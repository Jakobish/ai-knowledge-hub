"""
DAG with Loop Integration
========================

AI Agent Prompt:
----------------
You are an expert in combining DAGs with Loop Engineering. Implement a system that uses DAGs to orchestrate multiple loops:

1. ARCHITECTURE:
   - DAG nodes can contain loops
   - Loops can trigger DAG executions
   - Shared context between DAG and loops
   - Nested structures (DAGs within loops within DAGs)

2. IMPLEMENTATION:
   - Create a DAGNode that can execute a loop
   - Support for loop results as DAG inputs
   - Context passing between levels
   - Error propagation across boundaries

3. EXAMPLE WORKFLOW:
   - Implement a system that:
     a) Uses a DAG to orchestrate a multi-phase process
     b) Each phase contains a loop
     c) Loop results feed into subsequent DAG nodes
     d) Final results are aggregated

4. USE CASE:
   - Software development pipeline:
     * Phase 1 (DAG): Planning (multiple parallel planning loops)
     * Phase 2 (DAG): Development (multiple parallel coding loops)
     * Phase 3 (DAG): Testing (multiple parallel testing loops)
     * Phase 4 (DAG): Deployment (single deployment loop)

5. ADVANCED FEATURES:
   - Dynamic DAG generation based on loop results
   - Conditional DAG paths based on loop outcomes
   - Resource sharing between DAG and loops
   - Monitoring of nested executions

6. INTEGRATION:
   - Show how to connect with:
     * AI agents for loop execution
     * External systems for DAG nodes
     * Databases for state management
     * APIs for tool execution

7. BEST PRACTICES:
   - Avoid excessive nesting
   - Manage context carefully
   - Add proper error handling
   - Include comprehensive logging

This should demonstrate the power of combining DAGs and loops for complex AI systems.
"""
