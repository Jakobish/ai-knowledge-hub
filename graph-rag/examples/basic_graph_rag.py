"""Basic in-memory Graph RAG implementation."""

from __future__ import annotations

from collections import defaultdict, deque
from dataclasses import dataclass, field
import re


def tokens(text: str) -> set[str]:
    return set(re.findall(r"[a-z0-9]+", text.lower()))


@dataclass
class Document:
    id: str
    text: str


@dataclass
class GraphRAG:
    documents: dict[str, Document] = field(default_factory=dict)
    entity_docs: dict[str, set[str]] = field(default_factory=lambda: defaultdict(set))
    edges: dict[str, set[str]] = field(default_factory=lambda: defaultdict(set))

    def add_document(self, doc_id: str, text: str, entities: list[str]) -> None:
        self.documents[doc_id] = Document(doc_id, text)
        normalized = [entity.lower() for entity in entities]
        for entity in normalized:
            self.entity_docs[entity].add(doc_id)
        for left in normalized:
            for right in normalized:
                if left != right:
                    self.edges[left].add(right)

    def traverse(self, start_entities: list[str], depth: int = 1) -> set[str]:
        seen = {entity.lower() for entity in start_entities}
        queue = deque((entity.lower(), 0) for entity in start_entities)
        while queue:
            entity, current_depth = queue.popleft()
            if current_depth >= depth:
                continue
            for neighbor in self.edges[entity]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    queue.append((neighbor, current_depth + 1))
        return seen

    def retrieve(self, query: str, depth: int = 1, limit: int = 3) -> list[Document]:
        query_terms = tokens(query)
        matching_entities = [entity for entity in self.entity_docs if tokens(entity) & query_terms]
        expanded_entities = self.traverse(matching_entities, depth=depth)
        candidates: set[str] = set()
        for entity in expanded_entities:
            candidates.update(self.entity_docs[entity])

        scored = []
        for doc_id in candidates or self.documents:
            doc = self.documents[doc_id]
            score = len(tokens(doc.text) & query_terms)
            score += sum(1 for entity in expanded_entities if doc_id in self.entity_docs[entity])
            scored.append((score, doc.id, doc))
        return [doc for score, _, doc in sorted(scored, reverse=True)[:limit] if score > 0]

    def answer(self, query: str) -> str:
        docs = self.retrieve(query)
        citations = ", ".join(doc.id for doc in docs)
        evidence = " ".join(doc.text for doc in docs)
        return f"Answer from [{citations}]: {evidence}" if docs else "No evidence found."


def build_demo_graph() -> GraphRAG:
    graph = GraphRAG()
    graph.add_document("doc1", "Graph RAG connects retrieval to knowledge graph traversal.", ["Graph RAG", "retrieval", "knowledge graph"])
    graph.add_document("doc2", "Loop engineering verifies and retries AI agent work.", ["loop engineering", "verification", "AI agents"])
    graph.add_document("doc3", "Knowledge graphs improve explainability with explicit relationships.", ["knowledge graph", "explainability"])
    return graph


if __name__ == "__main__":
    print(build_demo_graph().answer("How does Graph RAG use a knowledge graph?"))
