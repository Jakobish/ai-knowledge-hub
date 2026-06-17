/**
 * Git worktree manager for parallel AI-agent development.
 *
 * The class wraps `git worktree` commands with input validation and logging.
 */

import { execFile } from "node:child_process";
import { promisify } from "node:util";
import { resolve } from "node:path";

const execFileAsync = promisify(execFile);

export interface WorktreeInfo {
  path: string;
  head: string;
  branch?: string;
}

export class WorktreeManager {
  constructor(private readonly repoPath: string = process.cwd()) {}

  async create(branch: string, path: string, base = "HEAD"): Promise<string> {
    this.validateName(branch);
    const target = resolve(path);
    await this.git(["worktree", "add", "-b", branch, target, base]);
    return target;
  }

  async remove(path: string, force = false): Promise<void> {
    const args = ["worktree", "remove"];
    if (force) args.push("--force");
    args.push(resolve(path));
    await this.git(args);
  }

  async list(): Promise<WorktreeInfo[]> {
    const output = await this.git(["worktree", "list", "--porcelain"]);
    const blocks = output.trim().split(/\n\n+/).filter(Boolean);
    return blocks.map((block) => {
      const info: WorktreeInfo = { path: "", head: "" };
      for (const line of block.split("\n")) {
        const [key, ...rest] = line.split(" ");
        const value = rest.join(" ");
        if (key === "worktree") info.path = value;
        if (key === "HEAD") info.head = value;
        if (key === "branch") info.branch = value.replace("refs/heads/", "");
      }
      return info;
    });
  }

  private async git(args: string[]): Promise<string> {
    try {
      console.info(`git ${args.join(" ")}`);
      const { stdout } = await execFileAsync("git", args, { cwd: this.repoPath });
      return stdout;
    } catch (error) {
      const message = error instanceof Error ? error.message : String(error);
      throw new Error(`git ${args.join(" ")} failed: ${message}`);
    }
  }

  private validateName(name: string): void {
    if (!/^[A-Za-z0-9._/-]+$/.test(name)) {
      throw new Error(`Unsafe branch name: ${name}`);
    }
  }
}

if (require.main === module) {
  new WorktreeManager()
    .list()
    .then((worktrees) => console.table(worktrees))
    .catch((error) => {
      console.error(error);
      process.exitCode = 1;
    });
}
