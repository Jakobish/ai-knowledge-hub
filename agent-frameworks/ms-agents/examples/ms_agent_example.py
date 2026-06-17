"""Microsoft agent-style example using plugin concepts.

Microsoft's current public Python guidance commonly centers on Semantic Kernel:
agents call plugins/functions that wrap business capabilities. This file models
that pattern locally so it can run without cloud credentials.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Callable


PluginFunction = Callable[[str], str]


@dataclass
class Plugin:
    name: str
    functions: dict[str, PluginFunction] = field(default_factory=dict)

    def add(self, name: str, fn: PluginFunction) -> None:
        self.functions[name] = fn


@dataclass
class MicrosoftStyleAgent:
    name: str
    plugins: dict[str, Plugin]

    def invoke(self, plugin_name: str, function_name: str, argument: str) -> str:
        return self.plugins[plugin_name].functions[function_name](argument)


def build_agent() -> MicrosoftStyleAgent:
    docs = Plugin("docs")
    docs.add("summarize", lambda text: f"Summary: {text[:60]}")
    docs.add("classify", lambda text: "technical" if "API" in text or "agent" in text.lower() else "general")

    workflow = Plugin("workflow")
    workflow.add("create_ticket", lambda title: f"TICKET-1 created: {title}")

    return MicrosoftStyleAgent("Knowledge Worker", {"docs": docs, "workflow": workflow})


if __name__ == "__main__":
    print(build_agent().invoke("docs", "classify", "Agent API integration"))
