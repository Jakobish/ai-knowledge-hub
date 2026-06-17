from pathlib import Path
import importlib.util
import sys
import unittest


ROOT = Path(__file__).resolve().parents[1]


def load_module(name: str, relative: str):
    spec = importlib.util.spec_from_file_location(name, ROOT / relative)
    module = importlib.util.module_from_spec(spec)
    assert spec and spec.loader
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


class GraphRAGExampleTests(unittest.TestCase):
    def test_basic_graph_rag_returns_cited_answer(self):
        basic = load_module("basic_graph_rag", "graph-rag/examples/basic_graph_rag.py")
        answer = basic.build_demo_graph().answer("knowledge graph explainability")
        self.assertIn("doc3", answer)

    def test_knowledge_graph_neighbors(self):
        kg = load_module("knowledge_graph", "graph-rag/examples/knowledge_graph.py")
        graph = kg.build_ai_system_graph()
        self.assertEqual([node.id for node in graph.neighbors("agents", "uses")], ["tools"])

    def test_graph_rag_loop_repairs_missing_evidence(self):
        loop = load_module("graph_rag_with_loops", "graph-rag/examples/graph_rag_with_loops.py")
        answer, attempts = loop.answer_with_repair("graph entities")
        self.assertIn("repair-note", answer)
        self.assertEqual(attempts, 2)


if __name__ == "__main__":
    unittest.main()
