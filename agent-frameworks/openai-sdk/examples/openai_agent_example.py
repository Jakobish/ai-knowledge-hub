"""OpenAI Agents SDK example with local fallback.

Install the real SDK with `pip install openai-agents` and set OPENAI_API_KEY to
run the SDK path. The offline path compiles and demonstrates the same tool
surface without network calls.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path


def read_file(path: str) -> str:
    return Path(path).read_text(encoding="utf-8")


def write_file(path: str, content: str) -> str:
    Path(path).write_text(content, encoding="utf-8")
    return path


def analyze_code(code: str) -> str:
    return "has add function" if "def add" in code else "no add function found"


def search_docs(query: str) -> str:
    return f"local docs result for {query}"


def run_tests(_: str = "") -> str:
    return "tests passed"


@dataclass
class OfflineAgent:
    name: str

    def run(self, prompt: str) -> str:
        if "test" in prompt.lower():
            return run_tests()
        return search_docs(prompt)


def build_offline_agent() -> OfflineAgent:
    return OfflineAgent("Repository Assistant")


def sdk_reference_snippet() -> str:
    return """from agents import Agent, Runner, function_tool

@function_tool
def search_docs(query: str) -> str:
    return "result"

agent = Agent(name="Repository Assistant", instructions="Help with repo docs", tools=[search_docs])
result = Runner.run_sync(agent, "Find the retry loop docs")
print(result.final_output)
"""


if __name__ == "__main__":
    print(build_offline_agent().run("test the repository"))
