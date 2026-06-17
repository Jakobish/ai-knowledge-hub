# Graph RAG

Graph RAG combines retrieval-augmented generation with explicit knowledge graph
relationships so answers can use both text similarity and entity traversal.

## Contents

- `examples/basic_graph_rag.py`: in-memory document/entity graph retrieval.
- `examples/knowledge_graph.py`: reusable node and relationship builder.
- `examples/graph_rag_with_loops.py`: verification loop that repairs missing evidence.
- `docs/GRAPH_RAG_GUIDE.md`: implementation guide and retrieval architecture.

## Run

```bash
python3 -m unittest tests/test_graph_rag_examples.py
```
