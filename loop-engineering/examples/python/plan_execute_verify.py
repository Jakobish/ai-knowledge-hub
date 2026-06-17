"""Plan-execute-verify loop for file-oriented AI agent tasks."""

from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable, Iterable
import logging


@dataclass(frozen=True)
class Step:
    """One planned unit of work."""

    name: str
    action: Callable[["Workspace"], str]
    verifier: Callable[["Workspace"], bool]


@dataclass
class Workspace:
    """Small file workspace wrapper used by the demo loop."""

    root: Path
    log: list[str] = field(default_factory=list)

    def read(self, relative_path: str) -> str:
        return (self.root / relative_path).read_text(encoding="utf-8")

    def write(self, relative_path: str, content: str) -> None:
        path = self.root / relative_path
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")


@dataclass
class StepResult:
    name: str
    output: str
    verified: bool


class PlanExecuteVerify:
    """Run a plan and stop at the first failed verification."""

    def __init__(self, logger: logging.Logger | None = None) -> None:
        self.logger = logger or logging.getLogger(__name__)

    def run(self, workspace: Workspace, steps: Iterable[Step]) -> list[StepResult]:
        results: list[StepResult] = []
        for step in steps:
            self.logger.info("executing step: %s", step.name)
            output = step.action(workspace)
            verified = step.verifier(workspace)
            result = StepResult(step.name, output, verified)
            results.append(result)
            workspace.log.append(f"{step.name}: {'ok' if verified else 'failed'}")
            if not verified:
                raise AssertionError(f"verification failed for step: {step.name}")
        return results


def build_readme_plan(project_name: str) -> list[Step]:
    """Create a tiny documentation workflow."""

    def create_readme(workspace: Workspace) -> str:
        workspace.write(
            "README.md",
            f"# {project_name}\n\nA minimal project created by a plan-execute-verify loop.\n",
        )
        return "README.md written"

    def add_usage(workspace: Workspace) -> str:
        text = workspace.read("README.md")
        workspace.write("README.md", text + "\n## Usage\n\nRun `python main.py`.\n")
        return "usage added"

    return [
        Step("create readme", create_readme, lambda ws: project_name in ws.read("README.md")),
        Step("add usage", add_usage, lambda ws: "## Usage" in ws.read("README.md")),
    ]


if __name__ == "__main__":
    import tempfile

    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
    with tempfile.TemporaryDirectory() as tmp:
        workspace = Workspace(Path(tmp))
        results = PlanExecuteVerify().run(workspace, build_readme_plan("Demo Agent Project"))
        for result in results:
            print(result)
