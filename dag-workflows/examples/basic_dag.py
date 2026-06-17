"""
Basic DAG Implementation for AI Workflows
==========================================

AI Agent Prompt:
----------------
You are an expert in DAG-based workflow orchestration. Implement a basic DAG execution engine:

1. CORE COMPONENTS:
   - Node: Represents a task or operation
   - Edge: Represents dependency between nodes
   - Graph: Collection of nodes and edges
   - Executor: Runs the DAG in topological order

2. IMPLEMENTATION REQUIREMENTS:
   - Create Node and DAG classes
   - Support adding nodes and edges
   - Implement topological sorting
   - Execute nodes in correct order
   - Handle dependencies properly

3. EXAMPLE WORKFLOW:
   - Create a DAG with 5-7 nodes
   - Include different types of dependencies
   - Show error handling for cyclic dependencies
   - Demonstrate parallel execution where possible

4. AI AGENT INTEGRATION:
   - Show how to use the DAG with AI agents
   - Each node can be an agent task
   - Pass context between nodes
   - Handle agent-specific errors

5. EXECUTION ENGINE:
   - Implement a basic DAG executor
   - Support for synchronous execution
   - Track execution state
   - Handle node failures

6. ADVANCED FEATURES:
   - Dynamic DAG modification
   - Conditional edges
   - Retry logic for failed nodes
   - Timeouts for node execution

7. BEST PRACTICES:
   - Add proper error handling
   - Include logging
   - Support cancellation
   - Add validation for DAG structure

This should be a complete, production-ready DAG implementation that can be used
as the foundation for AI agent workflows.
"""
