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


class DAGExampleTests(unittest.TestCase):
    def test_basic_dag_runs_in_dependency_order(self):
        basic = load_module("basic_dag", "dag-workflows/examples/basic_dag.py")
        results = basic.DAGExecutor(basic.build_research_dag()).run()
        self.assertEqual(results["summarize"], "Compared 3 frameworks")

    def test_basic_dag_detects_cycles(self):
        basic = load_module("basic_dag_cycle", "dag-workflows/examples/basic_dag.py")
        dag = basic.DAG()
        dag.add_node("a", lambda ctx: "a")
        dag.add_node("b", lambda ctx: "b")
        dag.add_edge("a", "b")
        dag.add_edge("b", "a")
        with self.assertRaises(basic.DAGValidationError):
            dag.topological_sort()

    def test_conditional_dag_branches(self):
        advanced = load_module("advanced_dag", "dag-workflows/examples/advanced_dag.py")
        self.assertEqual(advanced.build_code_change_workflow(True).run({})["visited"], ["inspect", "implement", "test", "document"])
        self.assertEqual(advanced.build_code_change_workflow(False).run({})["visited"], ["inspect", "skip"])

    def test_dag_with_loops_retries_code(self):
        loops = load_module("dag_with_loops", "dag-workflows/examples/dag_with_loops.py")
        results = loops.run_agent_pipeline(require_review_fix=True)
        self.assertEqual(results["code"].attempts, 2)


if __name__ == "__main__":
    unittest.main()
