"""Basic DAG execution engine for AI workflows."""

from __future__ import annotations

from collections import defaultdict, deque
from dataclasses import dataclass, field
from typing import Callable, Any


@dataclass
class Node:
    name: str
    run: Callable[[dict[str, Any]], Any]
    depends_on: set[str] = field(default_factory=set)


class DAGValidationError(ValueError):
    pass


class DAG:
    def __init__(self) -> None:
        self.nodes: dict[str, Node] = {}

    def add_node(self, name: str, run: Callable[[dict[str, Any]], Any]) -> None:
        if name in self.nodes:
            raise DAGValidationError(f"duplicate node: {name}")
        self.nodes[name] = Node(name, run)

    def add_edge(self, before: str, after: str) -> None:
        if before not in self.nodes or after not in self.nodes:
            raise DAGValidationError("both nodes must exist before adding an edge")
        self.nodes[after].depends_on.add(before)

    def topological_sort(self) -> list[str]:
        incoming = {name: set(node.depends_on) for name, node in self.nodes.items()}
        outgoing: dict[str, set[str]] = defaultdict(set)
        for name, node in self.nodes.items():
            for dependency in node.depends_on:
                outgoing[dependency].add(name)

        ready = deque(sorted(name for name, deps in incoming.items() if not deps))
        order: list[str] = []
        while ready:
            name = ready.popleft()
            order.append(name)
            for child in sorted(outgoing[name]):
                incoming[child].remove(name)
                if not incoming[child]:
                    ready.append(child)

        if len(order) != len(self.nodes):
            raise DAGValidationError("cycle detected")
        return order


class DAGExecutor:
    def __init__(self, dag: DAG) -> None:
        self.dag = dag

    def run(self, initial_context: dict[str, Any] | None = None) -> dict[str, Any]:
        context = dict(initial_context or {})
        results: dict[str, Any] = {}
        for name in self.dag.topological_sort():
            results[name] = self.dag.nodes[name].run(context | {"results": results})
        return results


def build_research_dag() -> DAG:
    dag = DAG()
    dag.add_node("collect", lambda ctx: ["LangGraph", "OpenAI Agents SDK", "Semantic Kernel"])
    dag.add_node("rank", lambda ctx: sorted(ctx["results"]["collect"]))
    dag.add_node("summarize", lambda ctx: f"Compared {len(ctx['results']['rank'])} frameworks")
    dag.add_edge("collect", "rank")
    dag.add_edge("rank", "summarize")
    return dag


if __name__ == "__main__":
    print(DAGExecutor(build_research_dag()).run())
