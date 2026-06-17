#!/usr/bin/env bash
set -euo pipefail

# Scaffold and verify the AI Knowledge Hub directory layout.
#
# The repository content has been materialized into runnable examples and
# finished documentation. This script now creates the expected directories and
# reports missing key files without overwriting existing work.

ROOT_DIR="${1:-.}"

mkdir -p \
  "$ROOT_DIR/loop-engineering/examples/python" \
  "$ROOT_DIR/loop-engineering/examples/typescript" \
  "$ROOT_DIR/loop-engineering/docs" \
  "$ROOT_DIR/dag-workflows/examples" \
  "$ROOT_DIR/dag-workflows/docs" \
  "$ROOT_DIR/graph-rag/examples" \
  "$ROOT_DIR/graph-rag/docs" \
  "$ROOT_DIR/pdf-processing/examples" \
  "$ROOT_DIR/pdf-processing/docs" \
  "$ROOT_DIR/agent-frameworks/langgraph/examples" \
  "$ROOT_DIR/agent-frameworks/langgraph/docs" \
  "$ROOT_DIR/agent-frameworks/openai-sdk/examples" \
  "$ROOT_DIR/agent-frameworks/openai-sdk/docs" \
  "$ROOT_DIR/agent-frameworks/ms-agents/examples" \
  "$ROOT_DIR/agent-frameworks/ms-agents/docs" \
  "$ROOT_DIR/tutorials" \
  "$ROOT_DIR/tests"

required_files=(
  "README.md"
  "CONTRIBUTING.md"
  "loop-engineering/examples/python/retry_loop.py"
  "dag-workflows/examples/basic_dag.py"
  "graph-rag/examples/basic_graph_rag.py"
  "pdf-processing/examples/pdf_extractor.py"
  "agent-frameworks/openai-sdk/examples/openai_agent_example.py"
  "tutorials/agent-frameworks-comparison.md"
)

missing=0
for relative_path in "${required_files[@]}"; do
  if [[ ! -f "$ROOT_DIR/$relative_path" ]]; then
    echo "missing: $relative_path"
    missing=1
  fi
done

if [[ "$missing" -eq 0 ]]; then
  echo "AI Knowledge Hub structure is present."
else
  echo "Some expected files are missing."
  exit 1
fi
