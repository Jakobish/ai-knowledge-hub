"""Advanced LangGraph-style software workflow with decision points."""

from __future__ import annotations

from dataclasses import dataclass, field


@dataclass
class WorkflowState:
    goal: str
    plan: list[str] = field(default_factory=list)
    code: str = ""
    review: str = ""
    tests: str = ""
    route: str = "plan"


class SoftwareWorkflow:
    def invoke(self, goal: str) -> WorkflowState:
        state = WorkflowState(goal=goal)
        self.plan(state)
        self.implement(state)
        self.review(state)
        if "changes requested" in state.review:
            self.implement(state, fix=True)
            self.review(state)
        self.test(state)
        return state

    def plan(self, state: WorkflowState) -> None:
        state.plan = ["write function", "review logic", "run unit test"]

    def implement(self, state: WorkflowState, fix: bool = False) -> None:
        state.code = "def add(a, b):\n    return a + b\n" if fix else "def add(a, b):\n    return a - b\n"

    def review(self, state: WorkflowState) -> None:
        state.review = "approved" if "a + b" in state.code else "changes requested: addition logic is wrong"

    def test(self, state: WorkflowState) -> None:
        namespace: dict[str, object] = {}
        exec(state.code, namespace)
        state.tests = "passed" if namespace["add"](2, 3) == 5 else "failed"


if __name__ == "__main__":
    print(SoftwareWorkflow().invoke("create add").tests)
