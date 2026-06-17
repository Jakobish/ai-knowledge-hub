"""
Retry Loop Implementation
=========================

AI Agent Prompt:
----------------
You are an expert Python developer specializing in Loop Engineering for AI Agents.
Your task is to implement a robust retry loop system with the following requirements:

1. IMPLEMENTATION:
   - Create a RetryLoop class that can execute any callable function
   - Support configurable max_attempts and delay between retries
   - Include verification function to check if result is valid
   - Track number of attempts

2. FEATURES:
   - Exponential backoff option
   - Custom error handling
   - Logging of each attempt
   - Configurable timeout

3. EXAMPLE USE CASE:
   - Demonstrate with a bug-fixing scenario
   - Show how to integrate with an AI agent (like Claude Code)
   - Include error handling for API calls

4. BEST PRACTICES:
   - Add type hints
   - Include docstrings
   - Add unit tests (in separate test file)
   - Handle edge cases (max attempts, timeout, etc.)

5. EXTENSION IDEAS:
   - Add memory/context between retries
   - Support async functions
   - Add circuit breaker pattern

Remember: This should be production-ready code that can be used in real AI agent systems.
"""
