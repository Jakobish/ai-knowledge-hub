"""Knowledge graph builder for AI systems."""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


@dataclass
class Node:
    id: str
    label: str
    properties: dict[str, Any] = field(default_factory=dict)


@dataclass
class Relationship:
    source: str
    target: str
    kind: str
    properties: dict[str, Any] = field(default_factory=dict)


class KnowledgeGraph:
    def __init__(self) -> None:
        self.nodes: dict[str, Node] = {}
        self.relationships: list[Relationship] = []

    def add_node(self, node_id: str, label: str, **properties: Any) -> Node:
        node = Node(node_id, label, properties)
        self.nodes[node_id] = node
        return node

    def add_relationship(self, source: str, target: str, kind: str, **properties: Any) -> Relationship:
        if source not in self.nodes or target not in self.nodes:
            raise KeyError("source and target nodes must exist")
        rel = Relationship(source, target, kind, properties)
        self.relationships.append(rel)
        return rel

    def neighbors(self, node_id: str, kind: str | None = None) -> list[Node]:
        return [
            self.nodes[rel.target]
            for rel in self.relationships
            if rel.source == node_id and (kind is None or rel.kind == kind)
        ]

    def to_mermaid(self) -> str:
        lines = ["flowchart LR"]
        for rel in self.relationships:
            lines.append(f"  {rel.source}[{self.nodes[rel.source].label}] -- {rel.kind} --> {rel.target}[{self.nodes[rel.target].label}]")
        return "\n".join(lines)


def build_ai_system_graph() -> KnowledgeGraph:
    graph = KnowledgeGraph()
    graph.add_node("agents", "AI Agents", layer="application")
    graph.add_node("tools", "Tools", layer="capability")
    graph.add_node("memory", "Memory", layer="state")
    graph.add_node("rag", "RAG", layer="retrieval")
    graph.add_node("evals", "Evaluations", layer="quality")
    graph.add_relationship("agents", "tools", "uses")
    graph.add_relationship("agents", "memory", "reads-writes")
    graph.add_relationship("agents", "rag", "retrieves-with")
    graph.add_relationship("evals", "agents", "verifies")
    return graph


if __name__ == "__main__":
    print(build_ai_system_graph().to_mermaid())
