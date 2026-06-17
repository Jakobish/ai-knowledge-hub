"""Graph RAG combined with a verification loop."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


def _load_basic_graph_rag():
    path = Path(__file__).with_name("basic_graph_rag.py")
    spec = importlib.util.spec_from_file_location("basic_graph_rag_local", path)
    module = importlib.util.module_from_spec(spec)
    assert spec and spec.loader
    sys.modules["basic_graph_rag_local"] = module
    spec.loader.exec_module(module)
    return module


basic = _load_basic_graph_rag()


def answer_with_repair(query: str) -> tuple[str, int]:
    graph = basic.build_demo_graph()
    required_terms = basic.tokens(query)

    for attempt in range(1, 4):
        answer = graph.answer(query)
        if "No evidence" not in answer and required_terms.issubset(basic.tokens(answer)):
            return answer, attempt
        graph.add_document(
            "repair-note",
            "Graph RAG answers questions by retrieving documents connected through graph entities.",
            ["Graph RAG", "graph entities", "retrieval"],
        )
    raise RuntimeError("unable to produce cited answer")


def documentation_update_loop(changed_symbol: str) -> str:
    graph = basic.build_demo_graph()
    graph.add_document("code-change", f"{changed_symbol} now updates documentation automatically.", [changed_symbol, "documentation"])
    return graph.answer(f"How does {changed_symbol} affect documentation?")


if __name__ == "__main__":
    print(answer_with_repair("What is graph entity retrieval?"))
    print(documentation_update_loop("GraphRAGLoop"))
