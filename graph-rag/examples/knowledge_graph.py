"""
Knowledge Graph Construction for AI Systems
============================================

AI Agent Prompt:
----------------
You are an expert in knowledge graph construction. Implement a comprehensive knowledge graph builder:

1. GRAPH SCHEMA:
   - Define node types (Concept, Technology, Person, etc.)
   - Define relationship types (RELATED_TO, USES, PART_OF, etc.)
   - Define properties for each type
   - Validation rules

2. DATA INGESTION:
   - Support for multiple input formats:
     * Text documents
     * Structured data (JSON, CSV)
     * APIs
     * Web scraping
   - Text processing pipeline:
     * Entity extraction
     * Relationship extraction
     * Property extraction
   - Deduplication strategies

3. GRAPH CONSTRUCTION:
   - Create nodes from extracted entities
   - Create relationships from extracted relationships
   - Add properties to nodes and relationships
   - Handle conflicts and ambiguities

4. EXAMPLE: AI DOMAIN
   - Build a knowledge graph about AI systems including:
     * Concepts: Loop Engineering, DAG, RAG, Agents
     * Technologies: Python, TypeScript, LangGraph, etc.
     * People: Researchers, developers, companies
     * Relationships: USES, EXTENDS, IMPLEMENTS, etc.
   - Include at least 50 nodes and 100 relationships

5. QUERY INTERFACE:
   - Natural language to graph query translation
   - Support for complex queries
   - Result formatting
   - Explanation of results

6. INTEGRATION:
   - Connect with LLM for:
     * Query understanding
     * Result generation
     * Query refinement
   - Support for different graph databases:
     * Neo4j
     * Amazon Neptune
     * In-memory

7. MAINTENANCE:
   - Graph update mechanisms
   - Versioning of knowledge
   - Quality metrics
   - Error correction

This should demonstrate how to build a production-ready knowledge graph for AI systems.
"""
