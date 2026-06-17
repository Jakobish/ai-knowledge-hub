# OpenAI Agents SDK Guide

The OpenAI Agents SDK is a Python-first runtime for agents with instructions,
tools, handoffs, guardrails, sessions, tracing, and MCP integration. It uses the
Responses API by default for OpenAI models and provides an agent loop around
tool execution.

## Minimal Agent

```python
from agents import Agent, Runner

agent = Agent(name="Assistant", instructions="You are helpful.")
result = Runner.run_sync(agent, "Write a short release note.")
print(result.final_output)
```

## Function Tools

```python
from agents import Agent, Runner, function_tool

@function_tool
def get_build_status(branch: str) -> str:
    return "green"

agent = Agent(name="CI helper", instructions="Explain build status.", tools=[get_build_status])
print(Runner.run_sync(agent, "Check main").final_output)
```

## Practical Patterns

- Use tools for deterministic operations such as file reads, tests, database
  queries, and internal APIs.
- Use handoffs when specialists own different domains.
- Use guardrails for input/output validation.
- Use sessions when a user expects memory across turns.
- Use tracing to debug tool calls and agent delegation.

## Local Development

Set `OPENAI_API_KEY` before running live examples. Keep offline mocks for tests
so CI does not depend on network or paid model calls.
