"""Conditional DAG workflow for agentic code changes."""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Callable


Condition = Callable[[dict[str, Any]], bool]
Action = Callable[[dict[str, Any]], Any]


@dataclass
class ConditionalNode:
    name: str
    action: Action
    next_nodes: list[tuple[str, Condition]] = field(default_factory=list)


class ConditionalDAG:
    def __init__(self, start: str) -> None:
        self.start = start
        self.nodes: dict[str, ConditionalNode] = {}

    def add_node(self, name: str, action: Action) -> None:
        self.nodes[name] = ConditionalNode(name, action)

    def add_edge(self, source: str, target: str, condition: Condition | None = None) -> None:
        self.nodes[source].next_nodes.append((target, condition or (lambda _: True)))

    def run(self, context: dict[str, Any]) -> dict[str, Any]:
        current = self.start
        visited: list[str] = []
        while current:
            node = self.nodes[current]
            visited.append(current)
            context[current] = node.action(context)
            current = ""
            for target, condition in node.next_nodes:
                if condition(context):
                    current = target
                    break
        context["visited"] = visited
        return context

    def ascii(self) -> str:
        lines = []
        for name, node in self.nodes.items():
            targets = ", ".join(target for target, _ in node.next_nodes) or "END"
            lines.append(f"{name} -> {targets}")
        return "\n".join(lines)


def build_code_change_workflow(change_needed: bool = True) -> ConditionalDAG:
    graph = ConditionalDAG(start="inspect")
    graph.add_node("inspect", lambda ctx: {"change_needed": change_needed})
    graph.add_node("implement", lambda ctx: "patch created")
    graph.add_node("test", lambda ctx: "tests passed")
    graph.add_node("document", lambda ctx: "docs updated")
    graph.add_node("skip", lambda ctx: "no change required")
    graph.add_edge("inspect", "implement", lambda ctx: ctx["inspect"]["change_needed"])
    graph.add_edge("inspect", "skip", lambda ctx: not ctx["inspect"]["change_needed"])
    graph.add_edge("implement", "test")
    graph.add_edge("test", "document")
    return graph


if __name__ == "__main__":
    workflow = build_code_change_workflow()
    print(workflow.ascii())
    print(workflow.run({})["visited"])
