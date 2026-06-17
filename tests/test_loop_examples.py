from pathlib import Path
import importlib.util
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]


def load_module(name: str, relative: str):
    spec = importlib.util.spec_from_file_location(name, ROOT / relative)
    module = importlib.util.module_from_spec(spec)
    assert spec and spec.loader
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


class LoopExampleTests(unittest.TestCase):
    def test_retry_loop_uses_feedback_to_fix_code(self):
        retry_loop = load_module("retry_loop", "loop-engineering/examples/python/retry_loop.py")
        fixed = retry_loop.bug_fixing_demo()
        self.assertIn("return a + b", fixed)

    def test_plan_execute_verify_writes_expected_readme(self):
        pev = load_module("pev", "loop-engineering/examples/python/plan_execute_verify.py")
        with tempfile.TemporaryDirectory() as tmp:
            workspace = pev.Workspace(Path(tmp))
            results = pev.PlanExecuteVerify().run(workspace, pev.build_readme_plan("Demo"))
            self.assertEqual([result.verified for result in results], [True, True])
            self.assertIn("## Usage", workspace.read("README.md"))

    def test_multi_agent_team_delivers_artifacts(self):
        multi_agent = load_module("multi_agent", "loop-engineering/examples/python/multi_agent.py")
        state = multi_agent.build_software_team().run("create an add function")
        self.assertEqual(state.artifacts["test-report.txt"], "1 passed\n")
        self.assertEqual(state.metrics["agent_runs"], 4)


if __name__ == "__main__":
    unittest.main()
