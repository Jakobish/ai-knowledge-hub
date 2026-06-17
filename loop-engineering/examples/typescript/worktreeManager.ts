/**
 * Worktree Manager for AI Agents
 * ===============================
 *
 * AI Agent Prompt:
 * ----------------
 * You are an expert in Git and TypeScript. Implement a Worktree Manager for AI Agents:
 *
 * 1. PURPOSE:
 *    - Enable multiple agents to work in parallel without conflicts
 *    - Isolate changes in separate worktrees
 *    - Manage git worktrees programmatically
 *
 * 2. IMPLEMENTATION:
 *    - Worktree class with create/remove/list operations
 *    - AgentWorktree class that associates agents with worktrees
 *    - Conflict detection and resolution
 *    - Cleanup mechanisms
 *
 * 3. FEATURES:
 *    - Create worktree from any branch/commit
 *    - Switch between worktrees
 *    - Merge changes from worktree to main
 *    - Automatic cleanup of stale worktrees
 *
 * 4. EXAMPLE WORKFLOW:
 *    - Agent 1 works on feature A in worktree-feature-a
 *    - Agent 2 works on bug fix in worktree-bugfix
 *    - Both can work simultaneously without conflicts
 *    - Changes are merged when ready
 *
 * 5. GIT INTEGRATION:
 *    - Use libgit2 or simple-git library
 *    - Handle git errors properly
 *    - Support for different git configurations
 *    - Conflict resolution strategies
 *
 * 6. AGENT INTEGRATION:
 *    - Each agent gets its own worktree
 *    - Context is isolated per worktree
 *    - Changes can be reviewed before merging
 *    - Support for collaborative work
 *
 * 7. BEST PRACTICES:
 *    - Add proper error handling for git operations
 *    - Include cleanup mechanisms
 *    - Add logging for all operations
 *    - Support for different git hosts (GitHub, GitLab, etc.)
 *
 * This should enable safe, parallel development by multiple AI agents.
 */
