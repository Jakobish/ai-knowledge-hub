# Materialize AI Knowledge Hub Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace repository prompt stubs with concrete examples, guides, and tutorials that a developer can run or read directly.

**Architecture:** Keep examples dependency-light and self-contained, using standard-library implementations for general concepts. For fast-moving frameworks, provide optional real-framework entry points with safe offline fallbacks so repository verification does not require API keys.

**Tech Stack:** Python 3.11+, TypeScript examples, Markdown documentation, standard-library tests.

---

### Task 1: Loop Engineering Examples

**Files:**
- Modify: `loop-engineering/examples/python/retry_loop.py`
- Modify: `loop-engineering/examples/python/plan_execute_verify.py`
- Modify: `loop-engineering/examples/python/multi_agent.py`
- Modify: `loop-engineering/examples/typescript/retryLoop.ts`
- Modify: `loop-engineering/examples/typescript/agentOrchestrator.ts`
- Modify: `loop-engineering/examples/typescript/worktreeManager.ts`
- Modify: `loop-engineering/docs/BEST_PRACTICES.md`
- Create: `tests/test_loop_examples.py`

- [ ] Replace prompt comments with runnable retry, plan/execute/verify, multi-agent, TypeScript retry, orchestrator, and worktree examples.
- [ ] Add focused Python tests for retry behavior and plan/execute/verify success and failure paths.
- [ ] Run `python -m pytest tests/test_loop_examples.py -q`.

### Task 2: DAG Workflow Examples

**Files:**
- Modify: `dag-workflows/examples/basic_dag.py`
- Modify: `dag-workflows/examples/advanced_dag.py`
- Modify: `dag-workflows/examples/dag_with_loops.py`
- Modify: `dag-workflows/docs/DAG_CONCEPTS.md`
- Create: `tests/test_dag_examples.py`

- [ ] Implement topological sorting, validation, conditional routing, retry-loop composition, and ASCII/Mermaid diagrams.
- [ ] Add focused tests for execution order, cycle detection, branching, and loop retries.
- [ ] Run `python -m pytest tests/test_dag_examples.py -q`.

### Task 3: Graph RAG Examples

**Files:**
- Modify: `graph-rag/examples/basic_graph_rag.py`
- Modify: `graph-rag/examples/knowledge_graph.py`
- Modify: `graph-rag/examples/graph_rag_with_loops.py`
- Modify: `graph-rag/docs/GRAPH_RAG_GUIDE.md`
- Create: `tests/test_graph_rag_examples.py`

- [ ] Implement in-memory graph storage, entity extraction, traversal retrieval, citation-aware synthesis, and self-updating graph loops.
- [ ] Add tests for graph construction, retrieval ranking, and loop updates.
- [ ] Run `python -m pytest tests/test_graph_rag_examples.py -q`.

### Task 4: PDF Processing Examples

**Files:**
- Modify: `pdf-processing/examples/pdf_extractor.py`
- Modify: `pdf-processing/examples/pdf_ocr.py`
- Modify: `pdf-processing/examples/pdf_metadata.py`
- Modify: `pdf-processing/docs/PDF_INTERNALS.md`
- Create: `tests/test_pdf_examples.py`

- [ ] Implement pure-Python PDF inspection utilities with optional PyPDF/Pillow/Tesseract integrations.
- [ ] Add tests using generated minimal PDF bytes.
- [ ] Run `python -m pytest tests/test_pdf_examples.py -q`.

### Task 5: Agent Framework Examples

**Files:**
- Modify: `agent-frameworks/langgraph/examples/basic_agent.py`
- Modify: `agent-frameworks/langgraph/examples/workflow_agent.py`
- Modify: `agent-frameworks/langgraph/docs/LANGRAPH_GUIDE.md`
- Modify: `agent-frameworks/openai-sdk/examples/openai_agent_example.py`
- Modify: `agent-frameworks/openai-sdk/docs/OPENAI_SDK_GUIDE.md`
- Modify: `agent-frameworks/ms-agents/examples/ms_agent_example.py`
- Modify: `agent-frameworks/ms-agents/docs/MS_AGENTS_GUIDE.md`

- [ ] Use current official docs for version-sensitive syntax: LangGraph `StateGraph`, OpenAI Agents SDK `Agent`, `Runner`, and `function_tool`, and Microsoft Semantic Kernel-style plugin concepts.
- [ ] Provide offline fallback examples for local verification.
- [ ] Run `python -m py_compile` over all framework examples.

### Task 6: Tutorials and Repository Polish

**Files:**
- Modify: `tutorials/loop-engineering-101.md`
- Modify: `tutorials/dag-workflows-guide.md`
- Modify: `tutorials/graph-rag-tutorial.md`
- Modify: `tutorials/pdf-processing-guide.md`
- Modify: `tutorials/agent-frameworks-comparison.md`
- Modify: `README.md`

- [ ] Convert remaining prompt tutorials into readable, practical tutorials with diagrams and exercises.
- [ ] Refresh top-level navigation so it points to completed examples and docs.
- [ ] Run syntax checks and a repository-wide prompt-stub scan for the old generator language.
