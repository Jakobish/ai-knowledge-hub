"""
Plan-Execute-Verify Loop Implementation
=======================================

AI Agent Prompt:
----------------
You are an expert in AI Agent workflows. Implement a Plan-Execute-Verify loop pattern:

1. IMPLEMENTATION REQUIREMENTS:
   - Create a PlanExecuteVerifyLoop class
   - Three-phase approach: Plan -> Execute -> Verify
   - Support for complex, multi-step tasks
   - Context management between steps

2. CORE COMPONENTS:
   - Planner: Creates step-by-step plan
   - Executor: Runs each step
   - Verifier: Checks if step was successful
   - Context: Maintains state between steps

3. EXAMPLE SCENARIO:
   - Implement a workflow that:
     a) Plans a software refactoring task
     b) Executes each refactoring step
     c) Verifies each change with tests
     d) Rolls back on failure

4. ADVANCED FEATURES:
   - Support for parallel execution of independent steps
   - Dependency management between steps
   - Progress tracking
   - Error recovery strategies

5. INTEGRATION:
   - Show how to connect with Claude Code or other AI agents
   - Include example of reading/modifying files
   - Demonstrate running tests automatically

6. BEST PRACTICES:
   - Add comprehensive logging
   - Include timeout handling
   - Support cancellation
   - Add validation for each phase

This should be a complete, production-ready implementation that demonstrates
how to build autonomous agents that can handle complex tasks.
"""
