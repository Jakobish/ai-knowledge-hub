"""Small multi-agent orchestration framework.

The example models a software-delivery team with planner, developer, reviewer,
and tester agents.  It is deterministic and local, which makes it useful for
tests, demos, and architecture discussions before connecting real LLM calls.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum
from typing import Callable
import time


class Role(str, Enum):
    PLANNER = "planner"
    DEVELOPER = "developer"
    REVIEWER = "reviewer"
    TESTER = "tester"


@dataclass
class Message:
    sender: str
    content: str
    timestamp: float = field(default_factory=time.time)


@dataclass
class TaskState:
    goal: str
    artifacts: dict[str, str] = field(default_factory=dict)
    messages: list[Message] = field(default_factory=list)
    metrics: dict[str, int] = field(default_factory=lambda: {"agent_runs": 0, "failures": 0})


class Agent:
    """A deterministic agent with health checks and message history."""

    def __init__(self, name: str, role: Role, handler: Callable[[TaskState], str]) -> None:
        self.name = name
        self.role = role
        self.handler = handler
        self.healthy = True
        self.last_error: str | None = None

    def health_check(self) -> bool:
        return self.healthy

    def run(self, state: TaskState) -> None:
        state.metrics["agent_runs"] += 1
        try:
            output = self.handler(state)
            state.messages.append(Message(self.name, output))
            self.last_error = None
        except Exception as exc:
            self.last_error = f"{type(exc).__name__}: {exc}"
            state.metrics["failures"] += 1
            raise


class AgentOrchestrator:
    """Coordinate agents through a fixed delivery lifecycle."""

    def __init__(self) -> None:
        self.agents: list[Agent] = []

    def register(self, agent: Agent) -> None:
        self.agents.append(agent)

    def run(self, goal: str) -> TaskState:
        state = TaskState(goal=goal)
        for agent in self.agents:
            if not agent.health_check():
                raise RuntimeError(f"agent {agent.name} failed health check")
            agent.run(state)
        return state


def build_software_team() -> AgentOrchestrator:
    orchestrator = AgentOrchestrator()

    def plan(state: TaskState) -> str:
        state.artifacts["plan.md"] = f"- Build: {state.goal}\n- Verify with tests\n"
        return "plan ready"

    def develop(state: TaskState) -> str:
        state.artifacts["solution.py"] = "def add(a: int, b: int) -> int:\n    return a + b\n"
        return "implementation ready"

    def review(state: TaskState) -> str:
        code = state.artifacts["solution.py"]
        state.artifacts["review.md"] = "Approved: uses type hints and simple implementation.\n"
        if "return a + b" not in code:
            raise ValueError("implementation does not satisfy goal")
        return "review approved"

    def test(state: TaskState) -> str:
        namespace: dict[str, object] = {}
        exec(state.artifacts["solution.py"], namespace)
        assert namespace["add"](2, 4) == 6
        state.artifacts["test-report.txt"] = "1 passed\n"
        return "tests passed"

    orchestrator.register(Agent("Planner", Role.PLANNER, plan))
    orchestrator.register(Agent("Developer", Role.DEVELOPER, develop))
    orchestrator.register(Agent("Reviewer", Role.REVIEWER, review))
    orchestrator.register(Agent("Tester", Role.TESTER, test))
    return orchestrator


if __name__ == "__main__":
    final_state = build_software_team().run("create an add function")
    print(final_state.artifacts["test-report.txt"])
