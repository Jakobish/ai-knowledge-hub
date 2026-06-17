/**
 * Production-ready retry loop for TypeScript agent workflows.
 *
 * Run with:
 *   npx tsx loop-engineering/examples/typescript/retryLoop.ts
 */

export type Verifier<T> = (result: T) => boolean | Promise<boolean>;

export interface Attempt<T> {
  number: number;
  ok: boolean;
  elapsedMs: number;
  result?: T;
  error?: string;
}

export interface RetryOptions<T> {
  maxAttempts?: number;
  delayMs?: number;
  exponentialBackoff?: boolean;
  timeoutMs?: number;
  verify?: Verifier<T>;
  onError?: (error: unknown, attempts: Attempt<T>[]) => void;
}

export class RetryError extends Error {
  constructor(message: string, public attempts: Attempt<unknown>[]) {
    super(message);
    this.name = "RetryError";
  }
}

const wait = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

export class RetryLoop<T> {
  private readonly maxAttempts: number;
  private readonly delayMs: number;
  private readonly exponentialBackoff: boolean;
  private readonly timeoutMs?: number;
  private readonly verify: Verifier<T>;
  private readonly onError?: (error: unknown, attempts: Attempt<T>[]) => void;

  constructor(options: RetryOptions<T> = {}) {
    this.maxAttempts = options.maxAttempts ?? 3;
    this.delayMs = options.delayMs ?? 0;
    this.exponentialBackoff = options.exponentialBackoff ?? true;
    this.timeoutMs = options.timeoutMs;
    this.verify = options.verify ?? (() => true);
    this.onError = options.onError;
    if (this.maxAttempts < 1) throw new Error("maxAttempts must be >= 1");
  }

  async run(task: (attempts: Attempt<T>[]) => Promise<T> | T): Promise<{ result: T; attempts: Attempt<T>[] }> {
    const attempts: Attempt<T>[] = [];
    const started = Date.now();

    for (let number = 1; number <= this.maxAttempts; number += 1) {
      if (this.timeoutMs && Date.now() - started > this.timeoutMs) {
        throw new RetryError(`Timed out after ${this.timeoutMs}ms`, attempts);
      }

      const attemptStarted = Date.now();
      try {
        const result = await task(attempts);
        const ok = await this.verify(result);
        attempts.push({ number, ok, elapsedMs: Date.now() - attemptStarted, result });
        if (ok) return { result, attempts };
      } catch (error) {
        attempts.push({
          number,
          ok: false,
          elapsedMs: Date.now() - attemptStarted,
          error: error instanceof Error ? error.message : String(error),
        });
        this.onError?.(error, attempts);
      }

      if (number < this.maxAttempts) await wait(this.delayFor(number));
    }

    throw new RetryError(`Failed after ${this.maxAttempts} attempts`, attempts);
  }

  private delayFor(completedAttempt: number): number {
    return this.exponentialBackoff ? this.delayMs * 2 ** (completedAttempt - 1) : this.delayMs;
  }
}

async function demo() {
  const loop = new RetryLoop<string>({
    maxAttempts: 3,
    verify: (code) => code.includes("return a + b"),
  });

  const { result, attempts } = await loop.run((history) => {
    return history.length === 0
      ? "function add(a: number, b: number) { return a - b }"
      : "function add(a: number, b: number) { return a + b }";
  });

  console.log(result);
  console.log(`attempts: ${attempts.length}`);
}

if (require.main === module) {
  demo().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
}
