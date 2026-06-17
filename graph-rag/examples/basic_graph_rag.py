"""
Basic Graph RAG Implementation
===============================

AI Agent Prompt:
----------------
You are an expert in Graph RAG systems. Implement a basic Graph RAG system:

1. KNOWLEDGE GRAPH:
   - Create a simple in-memory knowledge graph
   - Support for nodes (entities) and edges (relationships)
   - Store properties on nodes and edges
   - Query capabilities

2. GRAPH CONSTRUCTION:
   - Methods to add nodes and relationships
   - Support for different relationship types
   - Batch loading of data
   - Validation of graph structure

3. RETRIEVAL:
   - Implement graph traversal for retrieval
   - Support for different query types:
     * Entity lookup
     * Relationship queries
     * Path finding
     * Neighborhood queries
   - Scoring and ranking of results

4. RAG INTEGRATION:
   - Combine graph retrieval with LLM generation
   - Context construction from graph results
   - Prompt engineering for graph-augmented generation
   - Handling of missing information

5. EXAMPLE:
   - Create a knowledge graph about:
     * AI concepts (Loop Engineering, DAGs, RAG, etc.)
     * Relationships between concepts
     * Properties of each concept
   - Implement queries like:
     * "What are the components of Loop Engineering?"
     * "How does Graph RAG relate to traditional RAG?"
     * "Show me all concepts related to AI Agents"

6. ADVANCED FEATURES:
   - Support for weighted relationships
   - Path-based retrieval
   - Community detection
   - Graph visualization

7. PERFORMANCE:
   - Indexing for fast queries
   - Caching of frequent queries
   - Optimized traversal algorithms
   - Memory management

This should be a complete, working implementation of a basic Graph RAG system.
"""
