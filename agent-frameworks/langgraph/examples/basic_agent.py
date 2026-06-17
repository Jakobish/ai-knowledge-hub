"""Basic LangGraph-style agent with offline fallback."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable


Tool = Callable[[str], str]


def search_tool(query: str) -> str:
    return f"search result for {query}: use graph workflows for stateful agents"


def calculator_tool(expression: str) -> str:
    allowed = set("0123456789+-*/(). ")
    if not set(expression) <= allowed:
        raise ValueError("unsafe expression")
    return str(eval(expression, {"__builtins__": {}}, {}))


def python_tool(code: str) -> str:
    namespace: dict[str, object] = {}
    exec(code, {"__builtins__": {"len": len, "sum": sum, "range": range}}, namespace)
    return repr(namespace)


@dataclass
class OfflineAgent:
    tools: dict[str, Tool]

    def invoke(self, message: str) -> str:
        if message.startswith("calc:"):
            return self.tools["calculator"](message.removeprefix("calc:").strip())
        if message.startswith("python:"):
            return self.tools["python"](message.removeprefix("python:").strip())
        return self.tools["search"](message)


def build_offline_agent() -> OfflineAgent:
    return OfflineAgent({"search": search_tool, "calculator": calculator_tool, "python": python_tool})


def langgraph_reference_snippet() -> str:
    return """from langgraph.graph import StateGraph, START, END
from typing_extensions import TypedDict

class State(TypedDict):
    messages: list

builder = StateGraph(State)
builder.add_node("agent", call_model)
builder.add_edge(START, "agent")
builder.add_edge("agent", END)
graph = builder.compile()
"""


if __name__ == "__main__":
    print(build_offline_agent().invoke("calc: 2 + 3 * 4"))
