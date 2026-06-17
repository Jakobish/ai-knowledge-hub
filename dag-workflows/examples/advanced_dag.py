"""
Advanced DAG with Conditional Logic
====================================

AI Agent Prompt:
----------------
You are an expert in advanced workflow orchestration. Implement a DAG with conditional logic:

1. CONDITIONAL NODES:
   - Nodes that execute based on conditions
   - Support for multiple output paths
   - Dynamic dependency resolution

2. IMPLEMENTATION:
   - Extend the basic DAG with conditional nodes
   - Add condition evaluation logic
   - Support for branching workflows
   - Merge points for different paths

3. EXAMPLE SCENARIO:
   - Implement a workflow that:
     a) Checks if a code change is needed
     b) If yes: plan, develop, test
     c) If no: verify current state
     d) Merge results

4. CONDITION EVALUATION:
   - Support for custom condition functions
   - Context-aware conditions
   - Short-circuit evaluation
   - Default path handling

5. ERROR HANDLING:
   - Handle condition evaluation errors
   - Timeout for condition checks
   - Fallback mechanisms
   - Logging of condition results

6. VISUALIZATION:
   - Add method to generate ASCII representation of DAG
   - Include execution path in output
   - Show which conditions were true/false

7. PERFORMANCE:
   - Optimize for large DAGs
   - Support for lazy evaluation
   - Caching of condition results
   - Parallel execution of independent branches

This should demonstrate how to build complex, conditional workflows for AI agents.
"""
