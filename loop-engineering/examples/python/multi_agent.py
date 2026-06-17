"""
Multi-Agent Orchestration System
=================================

AI Agent Prompt:
----------------
You are an expert in multi-agent systems. Implement a complete multi-agent orchestration framework:

1. ARCHITECTURE:
   - Agent base class with common functionality
   - Specialized agents: Planner, Developer, Reviewer, Tester
   - Orchestrator that coordinates between agents
   - Shared memory/context system

2. IMPLEMENTATION:
   - Each agent should have:
     * Unique role and responsibilities
     * Access to shared context
     * Ability to call tools
     * Error handling

3. WORKFLOW:
   - Planner breaks down complex tasks
   - Orchestrator assigns tasks to appropriate agents
   - Agents communicate through shared context
   - Results are aggregated and verified

4. EXAMPLE WORKFLOW:
   - Implement a complete software development cycle:
     a) Planner: Creates development plan
     b) Developer: Writes code
     c) Reviewer: Checks code quality
     d) Tester: Runs tests
     e) Orchestrator: Manages the process

5. ADVANCED FEATURES:
   - Agent specialization and load balancing
   - Conflict resolution between agents
   - Progress monitoring
   - Resource management (API rate limits, etc.)

6. INTEGRATION:
   - Show how to connect with:
     * GitHub API (for code changes)
     * Testing frameworks
     * Logging systems
     * Notification systems (Slack, Email)

7. BEST PRACTICES:
   - Add health checks for agents
   - Include timeout handling
   - Support graceful degradation
   - Add monitoring and metrics

This should demonstrate how to build a production-grade multi-agent system
that can handle real-world software development tasks autonomously.
"""
