# Loop Engineering

Loop engineering is the practice of designing systems that automatically prompt,
check, and retry AI agents until a measurable goal is reached.

## What Is Here

- `examples/python/retry_loop.py`: retry loop with verification, memory, timeout,
  and circuit-breaker support.
- `examples/python/plan_execute_verify.py`: small file workflow with per-step
  validation.
- `examples/python/multi_agent.py`: deterministic planner/developer/reviewer/tester
  orchestration.
- `examples/typescript/`: TypeScript versions of retry, orchestration, and git
  worktree management patterns.
- `docs/BEST_PRACTICES.md`: production guidance for loop design.

## Run

```bash
python3 loop-engineering/examples/python/retry_loop.py
python3 -m unittest tests/test_loop_examples.py
```

Use these examples as starting points for coding agents, RAG maintenance loops,
document-processing pipelines, and CI repair workflows.
