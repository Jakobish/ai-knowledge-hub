"""Retry loop primitives for AI agent workflows.

The module is intentionally dependency-free so it can be copied into agent
tools, evaluation harnesses, or CLI automations.  It supports verification,
timeouts, exponential backoff, structured attempt history, and a simple circuit
breaker for repeated failures.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from time import monotonic, sleep
from typing import Any, Callable, Generic, Optional, TypeVar
import logging


T = TypeVar("T")


class RetryError(RuntimeError):
    """Raised when a retry loop cannot produce a verified result."""


@dataclass
class Attempt:
    """A single execution attempt."""

    number: int
    elapsed_seconds: float
    ok: bool
    result: Any = None
    error: Optional[str] = None


@dataclass
class RetryContext:
    """Mutable memory shared across attempts."""

    attempts: list[Attempt] = field(default_factory=list)
    memory: dict[str, Any] = field(default_factory=dict)


class CircuitBreaker:
    """Open the circuit after too many consecutive failures."""

    def __init__(self, failure_threshold: int = 5) -> None:
        if failure_threshold < 1:
            raise ValueError("failure_threshold must be >= 1")
        self.failure_threshold = failure_threshold
        self.failures = 0
        self.open = False

    def record_success(self) -> None:
        self.failures = 0
        self.open = False

    def record_failure(self) -> None:
        self.failures += 1
        if self.failures >= self.failure_threshold:
            self.open = True


class RetryLoop(Generic[T]):
    """Execute a callable until it succeeds and passes verification."""

    def __init__(
        self,
        max_attempts: int = 3,
        delay_seconds: float = 0.0,
        exponential_backoff: bool = True,
        timeout_seconds: Optional[float] = None,
        logger: Optional[logging.Logger] = None,
        circuit_breaker: Optional[CircuitBreaker] = None,
    ) -> None:
        if max_attempts < 1:
            raise ValueError("max_attempts must be >= 1")
        if delay_seconds < 0:
            raise ValueError("delay_seconds cannot be negative")
        self.max_attempts = max_attempts
        self.delay_seconds = delay_seconds
        self.exponential_backoff = exponential_backoff
        self.timeout_seconds = timeout_seconds
        self.logger = logger or logging.getLogger(__name__)
        self.circuit_breaker = circuit_breaker

    def run(
        self,
        fn: Callable[[RetryContext], T],
        verify: Callable[[T], bool] | None = None,
        on_error: Callable[[Exception, RetryContext], None] | None = None,
    ) -> tuple[T, RetryContext]:
        """Run ``fn`` until it returns a verified result.

        ``fn`` receives a ``RetryContext`` so it can adapt using memory from
        previous attempts, such as a compiler error, HTTP status, or failed
        assertion text.
        """

        started = monotonic()
        context = RetryContext()
        verifier = verify or (lambda _: True)

        for attempt_number in range(1, self.max_attempts + 1):
            if self.circuit_breaker and self.circuit_breaker.open:
                raise RetryError("circuit breaker is open")
            self._raise_if_timed_out(started)

            attempt_started = monotonic()
            try:
                self.logger.info("retry attempt %s/%s", attempt_number, self.max_attempts)
                result = fn(context)
                ok = verifier(result)
                attempt = Attempt(
                    number=attempt_number,
                    elapsed_seconds=monotonic() - attempt_started,
                    ok=ok,
                    result=result,
                )
                context.attempts.append(attempt)
                if ok:
                    if self.circuit_breaker:
                        self.circuit_breaker.record_success()
                    return result, context
                context.memory["last_verification_error"] = "result did not pass verifier"
                if self.circuit_breaker:
                    self.circuit_breaker.record_failure()
            except Exception as exc:  # pragma: no cover - exercised by tests
                attempt = Attempt(
                    number=attempt_number,
                    elapsed_seconds=monotonic() - attempt_started,
                    ok=False,
                    error=f"{type(exc).__name__}: {exc}",
                )
                context.attempts.append(attempt)
                context.memory["last_exception"] = attempt.error
                if on_error:
                    on_error(exc, context)
                if self.circuit_breaker:
                    self.circuit_breaker.record_failure()

            if attempt_number < self.max_attempts:
                sleep(self._delay_for(attempt_number))

        raise RetryError(f"failed after {self.max_attempts} attempts")

    def _delay_for(self, completed_attempt: int) -> float:
        if not self.exponential_backoff:
            return self.delay_seconds
        return self.delay_seconds * (2 ** (completed_attempt - 1))

    def _raise_if_timed_out(self, started: float) -> None:
        if self.timeout_seconds is None:
            return
        if monotonic() - started > self.timeout_seconds:
            raise RetryError(f"retry loop timed out after {self.timeout_seconds}s")


def bug_fixing_demo() -> str:
    """Demonstrate how an agent can use feedback between attempts."""

    broken_code = "def add(a, b):\n    return a - b\n"

    def agent_attempt(context: RetryContext) -> str:
        if "last_verification_error" in context.memory:
            return broken_code.replace("a - b", "a + b")
        return broken_code

    def tests_pass(candidate: str) -> bool:
        namespace: dict[str, Any] = {}
        exec(candidate, namespace)
        return namespace["add"](2, 3) == 5

    fixed_code, _ = RetryLoop[str](max_attempts=2).run(agent_attempt, tests_pass)
    return fixed_code


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
    print(bug_fixing_demo())
