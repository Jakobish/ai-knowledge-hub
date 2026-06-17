/**
 * Type-safe multi-agent orchestrator.
 *
 * The example uses deterministic handlers so it can run locally. Replace the
 * handler functions with model calls when connecting to a real LLM provider.
 */

export type Role = "planner" | "developer" | "reviewer" | "tester";

export interface ArtifactMap {
  [path: string]: string;
}

export interface Message {
  from: string;
  text: string;
  at: string;
}

export interface TaskState {
  goal: string;
  artifacts: ArtifactMap;
  messages: Message[];
  metrics: { agentRuns: number; failures: number };
}

export interface Agent {
  name: string;
  role: Role;
  healthCheck(): Promise<boolean> | boolean;
  run(state: TaskState): Promise<string> | string;
}

export class FunctionalAgent implements Agent {
  constructor(
    public readonly name: string,
    public readonly role: Role,
    private readonly handler: (state: TaskState) => Promise<string> | string,
  ) {}

  healthCheck(): boolean {
    return true;
  }

  run(state: TaskState): Promise<string> | string {
    return this.handler(state);
  }
}

export class AgentOrchestrator {
  private readonly agents: Agent[] = [];

  register(agent: Agent): void {
    this.agents.push(agent);
  }

  async run(goal: string): Promise<TaskState> {
    const state: TaskState = {
      goal,
      artifacts: {},
      messages: [],
      metrics: { agentRuns: 0, failures: 0 },
    };

    for (const agent of this.agents) {
      if (!(await agent.healthCheck())) throw new Error(`${agent.name} failed health check`);
      try {
        const text = await agent.run(state);
        state.metrics.agentRuns += 1;
        state.messages.push({ from: agent.name, text, at: new Date().toISOString() });
      } catch (error) {
        state.metrics.failures += 1;
        throw error;
      }
    }

    return state;
  }
}

export function buildSoftwareTeam(): AgentOrchestrator {
  const orchestrator = new AgentOrchestrator();

  orchestrator.register(new FunctionalAgent("Planner", "planner", (state) => {
    state.artifacts["plan.md"] = `Goal: ${state.goal}\nSteps: implement, review, test\n`;
    return "Plan created";
  }));

  orchestrator.register(new FunctionalAgent("Developer", "developer", (state) => {
    state.artifacts["src/add.ts"] = "export const add = (a: number, b: number) => a + b;\n";
    return "Code written";
  }));

  orchestrator.register(new FunctionalAgent("Reviewer", "reviewer", (state) => {
    if (!state.artifacts["src/add.ts"].includes("a + b")) throw new Error("Addition logic missing");
    state.artifacts["review.md"] = "Approved: small typed function.\n";
    return "Review approved";
  }));

  orchestrator.register(new FunctionalAgent("Tester", "tester", (state) => {
    state.artifacts["test-report.txt"] = state.artifacts["src/add.ts"].includes("a + b")
      ? "1 passed\n"
      : "1 failed\n";
    return "Tests passed";
  }));

  return orchestrator;
}

if (require.main === module) {
  buildSoftwareTeam()
    .run("create a typed add function")
    .then((state) => console.log(state.artifacts["test-report.txt"]))
    .catch((error) => {
      console.error(error);
      process.exitCode = 1;
    });
}
