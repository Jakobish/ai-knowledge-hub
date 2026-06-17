"""Combine DAG orchestration with retry loops."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable, Any


@dataclass
class LoopResult:
    value: Any
    attempts: int


def retry(name: str, action: Callable[[int], Any], verify: Callable[[Any], bool], attempts: int = 3) -> LoopResult:
    last_value = None
    for attempt in range(1, attempts + 1):
        last_value = action(attempt)
        if verify(last_value):
            return LoopResult(last_value, attempt)
    raise RuntimeError(f"{name} failed after {attempts} attempts")


def run_agent_pipeline(require_review_fix: bool = True) -> dict[str, LoopResult]:
    results: dict[str, LoopResult] = {}

    results["plan"] = retry("plan", lambda _: ["write code", "run tests"], lambda plan: "run tests" in plan)
    results["code"] = retry(
        "code",
        lambda attempt: "def add(a,b): return a-b" if attempt == 1 and require_review_fix else "def add(a,b): return a+b",
        lambda code: "a+b" in code,
    )
    results["review"] = retry("review", lambda _: "approved", lambda text: text == "approved")
    results["docs"] = retry("docs", lambda _: "Documented add(a, b)", lambda text: "add" in text)
    return results


if __name__ == "__main__":
    for step, result in run_agent_pipeline().items():
        print(f"{step}: {result.value!r} in {result.attempts} attempt(s)")
