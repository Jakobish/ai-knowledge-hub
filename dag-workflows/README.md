# DAG Workflows

Directed acyclic graphs are a reliable way to orchestrate multi-step AI agent
workflows with explicit dependencies.

## Contents

- `examples/basic_dag.py`: dependency validation, topological sort, and execution.
- `examples/advanced_dag.py`: conditional routing for code-change workflows.
- `examples/dag_with_loops.py`: DAG-shaped orchestration with retry loops inside nodes.
- `docs/DAG_CONCEPTS.md`: conceptual guide with diagrams and production checks.

## Run

```bash
python3 -m unittest tests/test_dag_examples.py
```
