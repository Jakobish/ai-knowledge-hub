#!/bin/bash

# AI Knowledge Hub Repository Setup Script
# Created for Kobi Shahar - Loop Engineering & AI Systems Expert
# This script creates the entire repository structure with detailed prompts for AI agents

echo "🚀 Creating AI Knowledge Hub repository structure..."
echo "This will create 35+ files with detailed prompts for AI agents..."
read -p "Press Enter to continue or Ctrl+C to cancel" -n 1 -r
echo ""

# Create main directory
mkdir -p ai-knowledge-hub
cd ai-knowledge-hub

# =============================================
# LOOP ENGINEERING SECTION
# =============================================
echo "📦 Creating Loop Engineering section..."
mkdir -p loop-engineering/{examples/{python,typescript},docs}

# Loop Engineering README
cat > loop-engineering/README.md << 'EOF'
# Loop Engineering Starter Kit

## 🎯 Purpose
This directory contains practical examples and tutorials for Loop Engineering - the practice of designing systems that automatically prompt AI agents to achieve goals.

## 📚 For AI Agents:
You are an expert in Loop Engineering. Your task is to:
1. Explain what Loop Engineering is and why it's important
2. Provide practical examples of different loop patterns
3. Show how to implement loops in Python and TypeScript
4. Include best practices and common pitfalls
5. Add benchmarks and performance considerations

## 🔗 Related Topics
- DAG-based workflows
- Agent orchestration
- Autonomous systems
- Error handling in AI workflows

## 📌 Next Steps
- Explore the examples in the /examples directory
- Read the documentation in /docs
- Implement your own loops based on the patterns shown
EOF

# Python Examples
cat > loop-engineering/examples/python/retry_loop.py << 'EOF'
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
EOF

cat > loop-engineering/examples/python/plan_execute_verify.py << 'EOF'
"""
Plan-Execute-Verify Loop Implementation
=======================================

AI Agent Prompt:
----------------
You are an expert in AI Agent workflows. Implement a Plan-Execute-Verify loop pattern:

1. IMPLEMENTATION REQUIREMENTS:
   - Create a PlanExecuteVerifyLoop class
   - Three-phase approach: Plan -> Execute -> Verify
   - Support for complex, multi-step tasks
   - Context management between steps

2. CORE COMPONENTS:
   - Planner: Creates step-by-step plan
   - Executor: Runs each step
   - Verifier: Checks if step was successful
   - Context: Maintains state between steps

3. EXAMPLE SCENARIO:
   - Implement a workflow that:
     a) Plans a software refactoring task
     b) Executes each refactoring step
     c) Verifies each change with tests
     d) Rolls back on failure

4. ADVANCED FEATURES:
   - Support for parallel execution of independent steps
   - Dependency management between steps
   - Progress tracking
   - Error recovery strategies

5. INTEGRATION:
   - Show how to connect with Claude Code or other AI agents
   - Include example of reading/modifying files
   - Demonstrate running tests automatically

6. BEST PRACTICES:
   - Add comprehensive logging
   - Include timeout handling
   - Support cancellation
   - Add validation for each phase

This should be a complete, production-ready implementation that demonstrates
how to build autonomous agents that can handle complex tasks.
"""
EOF

cat > loop-engineering/examples/python/multi_agent.py << 'EOF'
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
EOF

# TypeScript Examples
cat > loop-engineering/examples/typescript/retryLoop.ts << 'EOF'
/**
 * Retry Loop Implementation in TypeScript
 * =========================================
 *
 * AI Agent Prompt:
 * ----------------
 * You are an expert TypeScript developer specializing in Loop Engineering for AI Agents.
 * Implement a robust retry loop system with the following TypeScript-specific requirements:
 *
 * 1. IMPLEMENTATION:
 *    - Create a generic RetryLoop class with TypeScript generics
 *    - Support async/await pattern
 *    - Strong typing for input/output
 *    - Configurable options interface
 *
 * 2. TYPE SAFETY:
 *    - Use proper TypeScript types for all parameters
 *    - Generic type parameters for input/output
 *    - Type guards for verification
 *    - Custom error types
 *
 * 3. EXAMPLE:
 *    - Demonstrate with a TypeScript code generation scenario
 *    - Show integration with a TypeScript project
 *    - Include proper error handling
 *
 * 4. FEATURES:
 *    - Exponential backoff with jitter
 *    - Detailed logging with context
 *    - Configurable retry conditions
 *    - Progress reporting
 *
 * 5. BEST PRACTICES:
 *    - Use ES6+ features
 *    - Include JSDoc comments
 *    - Add unit tests (describe in comments)
 *    - Handle edge cases properly
 *
 * 6. INTEGRATION:
 *    - Show how to use with:
 *      * TypeScript projects
 *      * Node.js environment
 *      * Frontend frameworks (React, etc.)
 *
 * Remember: This should be production-ready TypeScript code with proper typing.
 */
EOF

cat > loop-engineering/examples/typescript/agentOrchestrator.ts << 'EOF'
/**
 * Agent Orchestrator in TypeScript
 * =================================
 *
 * AI Agent Prompt:
 * ----------------
 * You are an expert in TypeScript and AI Agent systems. Implement a complete Agent Orchestrator:
 *
 * 1. ARCHITECTURE:
 *    - Define Agent interface with required methods
 *    - Create concrete agent implementations
 *    - Build orchestrator that manages agents
 *    - Type-safe context management
 *
 * 2. AGENT TYPES:
 *    - PlannerAgent: Creates execution plans
 *    - DeveloperAgent: Writes and modifies code
 *    - ReviewerAgent: Validates and checks code
 *    - TesterAgent: Runs tests and validations
 *
 * 3. ORCHESTRATOR:
 *    - Task queue management
 *    - Agent assignment based on skills
 *    - Dependency resolution between tasks
 *    - Error handling and retry logic
 *
 * 4. EXAMPLE:
 *    - Implement a complete workflow:
 *      a) Receive a feature request
 *      b) Plan the implementation
 *      c) Develop the feature
 *      d) Review the code
 *      e) Test the implementation
 *      f) Deploy if successful
 *
 * 5. ADVANCED FEATURES:
 *    - Agent health monitoring
 *    - Load balancing between agents
 *    - Priority queue for tasks
 *    - Resource management (API keys, rate limits)
 *
 * 6. INTEGRATION:
 *    - Connect with:
 *      * GitHub API (for repository operations)
 *      * Testing frameworks (Jest, etc.)
 *      * CI/CD pipelines
 *      * Notification systems
 *
 * 7. BEST PRACTICES:
 *    - Use dependency injection
 *    - Implement proper logging
 *    - Add comprehensive error handling
 *    - Include type guards and validation
 *
 * This should be a complete, type-safe implementation of a multi-agent system in TypeScript.
 */
EOF

cat > loop-engineering/examples/typescript/worktreeManager.ts << 'EOF'
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
EOF

# Loop Engineering Docs
cat > loop-engineering/docs/BEST_PRACTICES.md << 'EOF'
# Loop Engineering Best Practices

## 🎯 AI Agent Prompt

You are an expert in Loop Engineering and AI Agent systems. Create a comprehensive best practices guide covering:

### 1. LOOP DESIGN PRINCIPLES
- How to define clear, verifiable goals
- Choosing the right loop pattern for different scenarios
- Balancing complexity and maintainability
- Avoiding infinite loops and resource exhaustion

### 2. ERROR HANDLING
- Common error patterns in agent loops
- Retry strategies and when to use each
- Circuit breaker pattern implementation
- Graceful degradation strategies

### 3. PERFORMANCE OPTIMIZATION
- Token usage optimization
- Context management techniques
- Caching strategies for agent memory
- Parallel execution considerations

### 4. SECURITY CONSIDERATIONS
- Safe tool execution
- Input validation and sanitization
- Rate limiting and API key management
- Sandboxing agent operations

### 5. MONITORING AND OBSERVABILITY
- Logging best practices
- Metrics to track in agent systems
- Alerting strategies
- Debugging agent workflows

### 6. TESTING STRATEGIES
- Unit testing agent components
- Integration testing for workflows
- End-to-end testing for complete systems
- Testing with mock agents

### 7. DEPLOYMENT CONSIDERATIONS
- Containerization strategies
- Scaling agent systems
- Cost optimization
- CI/CD for agent workflows

### 8. MAINTENANCE
- Versioning agent workflows
- Documentation standards
- Knowledge sharing between agents
- Updating agent skills

Include code examples, diagrams (in ASCII or Mermaid), and real-world scenarios for each section.

This should be a practical guide that developers can use to build production-grade loop engineering systems.
EOF

# =============================================
# DAG WORKFLOWS SECTION
# =============================================
echo "📦 Creating DAG Workflows section..."
mkdir -p dag-workflows/{examples,docs}

cat > dag-workflows/README.md << 'EOF'
# DAG Workflows for AI Agents

## 🎯 Purpose
Directed Acyclic Graphs (DAGs) are fundamental to orchestrating complex AI agent workflows. This directory contains examples and documentation for building DAG-based systems.

## 📚 For AI Agents:
You are an expert in DAG-based workflow orchestration. Your tasks:

1. Explain DAG concepts in the context of AI agents
2. Show how to design DAGs for different workflow patterns
3. Implement DAG execution engines
4. Demonstrate integration with AI agents
5. Provide best practices for DAG design

## 🔗 Related Topics
- Loop Engineering
- Workflow orchestration
- Task scheduling
- Dependency management

## 📌 Structure
- /examples: Practical DAG implementations
- /docs: Conceptual documentation and guides
EOF

cat > dag-workflows/examples/basic_dag.py << 'EOF'
"""
Basic DAG Implementation for AI Workflows
==========================================

AI Agent Prompt:
----------------
You are an expert in DAG-based workflow orchestration. Implement a basic DAG execution engine:

1. CORE COMPONENTS:
   - Node: Represents a task or operation
   - Edge: Represents dependency between nodes
   - Graph: Collection of nodes and edges
   - Executor: Runs the DAG in topological order

2. IMPLEMENTATION REQUIREMENTS:
   - Create Node and DAG classes
   - Support adding nodes and edges
   - Implement topological sorting
   - Execute nodes in correct order
   - Handle dependencies properly

3. EXAMPLE WORKFLOW:
   - Create a DAG with 5-7 nodes
   - Include different types of dependencies
   - Show error handling for cyclic dependencies
   - Demonstrate parallel execution where possible

4. AI AGENT INTEGRATION:
   - Show how to use the DAG with AI agents
   - Each node can be an agent task
   - Pass context between nodes
   - Handle agent-specific errors

5. EXECUTION ENGINE:
   - Implement a basic DAG executor
   - Support for synchronous execution
   - Track execution state
   - Handle node failures

6. ADVANCED FEATURES:
   - Dynamic DAG modification
   - Conditional edges
   - Retry logic for failed nodes
   - Timeouts for node execution

7. BEST PRACTICES:
   - Add proper error handling
   - Include logging
   - Support cancellation
   - Add validation for DAG structure

This should be a complete, production-ready DAG implementation that can be used
as the foundation for AI agent workflows.
"""
EOF

cat > dag-workflows/examples/advanced_dag.py << 'EOF'
"""
Advanced DAG with Conditional Logic
====================================

AI Agent Prompt:
----------------
You are an expert in advanced workflow orchestration. Implement a DAG with conditional logic:

1. CONDITIONAL NODES:
   - Nodes that execute based on conditions
   - Support for multiple output paths
   - Dynamic dependency resolution

2. IMPLEMENTATION:
   - Extend the basic DAG with conditional nodes
   - Add condition evaluation logic
   - Support for branching workflows
   - Merge points for different paths

3. EXAMPLE SCENARIO:
   - Implement a workflow that:
     a) Checks if a code change is needed
     b) If yes: plan, develop, test
     c) If no: verify current state
     d) Merge results

4. CONDITION EVALUATION:
   - Support for custom condition functions
   - Context-aware conditions
   - Short-circuit evaluation
   - Default path handling

5. ERROR HANDLING:
   - Handle condition evaluation errors
   - Timeout for condition checks
   - Fallback mechanisms
   - Logging of condition results

6. VISUALIZATION:
   - Add method to generate ASCII representation of DAG
   - Include execution path in output
   - Show which conditions were true/false

7. PERFORMANCE:
   - Optimize for large DAGs
   - Support for lazy evaluation
   - Caching of condition results
   - Parallel execution of independent branches

This should demonstrate how to build complex, conditional workflows for AI agents.
"""
EOF

cat > dag-workflows/examples/dag_with_loops.py << 'EOF'
"""
DAG with Loop Integration
========================

AI Agent Prompt:
----------------
You are an expert in combining DAGs with Loop Engineering. Implement a system that uses DAGs to orchestrate multiple loops:

1. ARCHITECTURE:
   - DAG nodes can contain loops
   - Loops can trigger DAG executions
   - Shared context between DAG and loops
   - Nested structures (DAGs within loops within DAGs)

2. IMPLEMENTATION:
   - Create a DAGNode that can execute a loop
   - Support for loop results as DAG inputs
   - Context passing between levels
   - Error propagation across boundaries

3. EXAMPLE WORKFLOW:
   - Implement a system that:
     a) Uses a DAG to orchestrate a multi-phase process
     b) Each phase contains a loop
     c) Loop results feed into subsequent DAG nodes
     d) Final results are aggregated

4. USE CASE:
   - Software development pipeline:
     * Phase 1 (DAG): Planning (multiple parallel planning loops)
     * Phase 2 (DAG): Development (multiple parallel coding loops)
     * Phase 3 (DAG): Testing (multiple parallel testing loops)
     * Phase 4 (DAG): Deployment (single deployment loop)

5. ADVANCED FEATURES:
   - Dynamic DAG generation based on loop results
   - Conditional DAG paths based on loop outcomes
   - Resource sharing between DAG and loops
   - Monitoring of nested executions

6. INTEGRATION:
   - Show how to connect with:
     * AI agents for loop execution
     * External systems for DAG nodes
     * Databases for state management
     * APIs for tool execution

7. BEST PRACTICES:
   - Avoid excessive nesting
   - Manage context carefully
   - Add proper error handling
   - Include comprehensive logging

This should demonstrate the power of combining DAGs and loops for complex AI systems.
"""
EOF

cat > dag-workflows/docs/DAG_CONCEPTS.md << 'EOF'
# DAG Concepts for AI Agent Systems

## 🎯 AI Agent Prompt

You are an expert in DAG theory and its application to AI systems. Create a comprehensive guide covering:

### 1. FUNDAMENTAL CONCEPTS
- What is a DAG (Directed Acyclic Graph)?
- Nodes, edges, and directedness
- Why acyclic is important for workflows
- Topological sorting and its significance

### 2. DAGS IN AI SYSTEMS
- Why DAGs are perfect for AI workflows
- Comparison with other orchestration patterns
- Real-world examples of DAG-based AI systems
- Advantages over linear workflows

### 3. DESIGN PATTERNS
- Fan-out/fan-in patterns
- Diamond patterns
- Conditional patterns
- Loop patterns within DAGs

### 4. IMPLEMENTATION APPROACHES
- In-memory DAG execution
- Distributed DAG execution
- Persistent DAG storage
- Dynamic DAG modification

### 5. DAG + AI AGENTS
- Mapping agents to DAG nodes
- Context passing between agents
- Error handling in distributed agent DAGs
- Monitoring agent DAGs

### 6. TOOLS AND FRAMEWORKS
- Comparison of DAG frameworks:
  * Airflow
  * Prefect
  * Dagster
  * Luigi
- When to use each
- Integration with AI systems

### 7. PERFORMANCE CONSIDERATIONS
- DAG size limitations
- Memory management
- Parallel execution
- Distributed execution

### 8. DEBUGGING AND TESTING
- Visualizing DAGs
- Testing DAG workflows
- Debugging failed executions
- Logging strategies

Include diagrams (Mermaid syntax), code examples, and practical scenarios for each section.

This should be a complete reference for understanding and implementing DAGs in AI agent systems.
EOF

# =============================================
# GRAPH RAG SECTION
# =============================================
echo "📦 Creating Graph RAG section..."
mkdir -p graph-rag/{examples,docs}

cat > graph-rag/README.md << 'EOF'
# Graph RAG: Knowledge Graphs for AI Agents

## 🎯 Purpose
Graph RAG (Retrieval-Augmented Generation with Knowledge Graphs) enhances traditional RAG by using graph structures to represent relationships between entities. This directory contains implementations and documentation for Graph RAG systems.

## 📚 For AI Agents:
You are an expert in Graph RAG and knowledge graph systems. Your tasks:

1. Explain Graph RAG concepts and advantages
2. Show how to build knowledge graphs
3. Implement Graph RAG retrieval systems
4. Demonstrate integration with AI agents
5. Provide best practices for graph construction

## 🔗 Related Topics
- Traditional RAG
- Knowledge graphs
- Semantic search
- Entity relationship modeling

## 📌 Structure
- /examples: Practical Graph RAG implementations
- /docs: Conceptual documentation and guides
EOF

cat > graph-rag/examples/basic_graph_rag.py << 'EOF'
"""
Basic Graph RAG Implementation
===============================

AI Agent Prompt:
----------------
You are an expert in Graph RAG systems. Implement a basic Graph RAG system:

1. KNOWLEDGE GRAPH:
   - Create a simple in-memory knowledge graph
   - Support for nodes (entities) and edges (relationships)
   - Store properties on nodes and edges
   - Query capabilities

2. GRAPH CONSTRUCTION:
   - Methods to add nodes and relationships
   - Support for different relationship types
   - Batch loading of data
   - Validation of graph structure

3. RETRIEVAL:
   - Implement graph traversal for retrieval
   - Support for different query types:
     * Entity lookup
     * Relationship queries
     * Path finding
     * Neighborhood queries
   - Scoring and ranking of results

4. RAG INTEGRATION:
   - Combine graph retrieval with LLM generation
   - Context construction from graph results
   - Prompt engineering for graph-augmented generation
   - Handling of missing information

5. EXAMPLE:
   - Create a knowledge graph about:
     * AI concepts (Loop Engineering, DAGs, RAG, etc.)
     * Relationships between concepts
     * Properties of each concept
   - Implement queries like:
     * "What are the components of Loop Engineering?"
     * "How does Graph RAG relate to traditional RAG?"
     * "Show me all concepts related to AI Agents"

6. ADVANCED FEATURES:
   - Support for weighted relationships
   - Path-based retrieval
   - Community detection
   - Graph visualization

7. PERFORMANCE:
   - Indexing for fast queries
   - Caching of frequent queries
   - Optimized traversal algorithms
   - Memory management

This should be a complete, working implementation of a basic Graph RAG system.
"""
EOF

cat > graph-rag/examples/knowledge_graph.py << 'EOF'
"""
Knowledge Graph Construction for AI Systems
============================================

AI Agent Prompt:
----------------
You are an expert in knowledge graph construction. Implement a comprehensive knowledge graph builder:

1. GRAPH SCHEMA:
   - Define node types (Concept, Technology, Person, etc.)
   - Define relationship types (RELATED_TO, USES, PART_OF, etc.)
   - Define properties for each type
   - Validation rules

2. DATA INGESTION:
   - Support for multiple input formats:
     * Text documents
     * Structured data (JSON, CSV)
     * APIs
     * Web scraping
   - Text processing pipeline:
     * Entity extraction
     * Relationship extraction
     * Property extraction
   - Deduplication strategies

3. GRAPH CONSTRUCTION:
   - Create nodes from extracted entities
   - Create relationships from extracted relationships
   - Add properties to nodes and relationships
   - Handle conflicts and ambiguities

4. EXAMPLE: AI DOMAIN
   - Build a knowledge graph about AI systems including:
     * Concepts: Loop Engineering, DAG, RAG, Agents
     * Technologies: Python, TypeScript, LangGraph, etc.
     * People: Researchers, developers, companies
     * Relationships: USES, EXTENDS, IMPLEMENTS, etc.
   - Include at least 50 nodes and 100 relationships

5. QUERY INTERFACE:
   - Natural language to graph query translation
   - Support for complex queries
   - Result formatting
   - Explanation of results

6. INTEGRATION:
   - Connect with LLM for:
     * Query understanding
     * Result generation
     * Query refinement
   - Support for different graph databases:
     * Neo4j
     * Amazon Neptune
     * In-memory

7. MAINTENANCE:
   - Graph update mechanisms
   - Versioning of knowledge
   - Quality metrics
   - Error correction

This should demonstrate how to build a production-ready knowledge graph for AI systems.
"""
EOF

cat > graph-rag/examples/graph_rag_with_loops.py << 'EOF'
"""
Graph RAG with Loop Engineering Integration
===========================================

AI Agent Prompt:
----------------
You are an expert in both Graph RAG and Loop Engineering. Implement a system that combines both:

1. ARCHITECTURE:
   - Knowledge graph as the knowledge base
   - Loop Engineering for agent execution
   - Integration between graph and loops
   - Shared context

2. WORKFLOW:
   - Agent receives a query
   - Graph RAG retrieves relevant information
   - Loop Engineering executes tasks based on retrieved info
   - Results are stored back in the graph

3. EXAMPLE SCENARIO:
   - Build a system that:
     a) Maintains a knowledge graph of software projects
     b) Agents can query the graph for project information
     c) Agents can update the graph with new information
     d) Loops manage the agent workflows

4. USE CASE: SOFTWARE DOCUMENTATION
   - Knowledge graph contains:
     * Projects
     * Modules
     * Functions
     * Dependencies
     * Documentation
   - Agents can:
     * Query for information about specific components
     * Update documentation based on code changes
     * Find related components
     * Generate documentation automatically

5. ADVANCED FEATURES:
   - Dynamic graph updates based on loop results
   - Graph-aware loop decisions
   - Multi-hop reasoning using graph
   - Explanation generation using graph paths

6. IMPLEMENTATION:
   - Use a graph database (Neo4j recommended)
   - Implement graph RAG retrieval
   - Build loop engineering framework
   - Connect the two systems

7. PERFORMANCE:
   - Optimize graph queries
   - Cache frequent results
   - Parallel execution where possible
   - Resource management

This should demonstrate the power of combining Graph RAG with Loop Engineering for intelligent AI systems.
"""
EOF

cat > graph-rag/docs/GRAPH_RAG_GUIDE.md << 'EOF'
# Complete Guide to Graph RAG

## 🎯 AI Agent Prompt

You are an expert in Graph RAG systems. Create a comprehensive guide covering:

### 1. INTRODUCTION TO GRAPH RAG
- What is Graph RAG?
- How it differs from traditional RAG
- When to use Graph RAG vs. traditional RAG
- Real-world applications

### 2. KNOWLEDGE GRAPHS
- Fundamentals of knowledge graphs
- Graph databases overview
- Schema design for AI applications
- Best practices for graph construction

### 3. BUILDING KNOWLEDGE GRAPHS
- Data sources for knowledge graphs
- Entity and relationship extraction
- Graph construction pipelines
- Quality assurance for knowledge graphs

### 4. GRAPH RETRIEVAL
- Query types for knowledge graphs
- Traversal algorithms
- Scoring and ranking
- Combining multiple retrieval strategies

### 5. RAG WITH KNOWLEDGE GRAPHS
- Integrating graphs with LLMs
- Context construction
- Prompt engineering for Graph RAG
- Handling graph-specific challenges

### 6. IMPLEMENTATION APPROACHES
- In-memory graphs
- Database-backed graphs
- Hybrid approaches
- Cloud-based solutions

### 7. GRAPH RAG + AI AGENTS
- Agents as graph nodes
- Graph-aware agent decisions
- Multi-agent systems with shared graphs
- Dynamic graph updates

### 8. EVALUATION AND METRICS
- Evaluating Graph RAG systems
- Comparison with traditional RAG
- Benchmarking
- Error analysis

### 9. TOOLS AND FRAMEWORKS
- Neo4j
- Amazon Neptune
- LangChain Graph RAG
- Custom implementations

### 10. CASE STUDIES
- Customer support systems
- Technical documentation
- Research assistance
- Business intelligence

### 11. ADVANCED TOPICS
- Temporal knowledge graphs
- Multi-modal knowledge graphs
- Graph neural networks
- Federated knowledge graphs

Include code examples, architecture diagrams, and practical implementation tips for each section.

This should be the definitive guide to Graph RAG for AI practitioners.
EOF

# =============================================
# PDF INTERNALS SECTION
# =============================================
echo "📦 Creating PDF Internals section..."
mkdir -p pdf-processing/{examples,docs}

cat > pdf-processing/README.md << 'EOF'
# PDF Processing and Internals for AI Systems

## 🎯 Purpose
Understanding PDF internals is crucial for building AI systems that work with documents. This directory contains tools and documentation for PDF processing, extraction, and analysis.

## 📚 For AI Agents:
You are an expert in PDF internals and document processing. Your tasks:

1. Explain PDF file structure and format
2. Show how to extract different types of content from PDFs
3. Implement tools for PDF analysis and manipulation
4. Demonstrate integration with AI agents for document understanding
5. Provide best practices for PDF processing

## 🔗 Related Topics
- Document AI
- OCR (Optical Character Recognition)
- Text extraction
- Metadata analysis
- Digital forensics

## 📌 Structure
- /examples: Practical PDF processing tools
- /docs: Documentation on PDF internals
EOF

cat > pdf-processing/examples/pdf_extractor.py << 'EOF'
"""
PDF Content Extractor
====================

AI Agent Prompt:
----------------
You are an expert in PDF processing and Python. Implement a comprehensive PDF content extractor:

1. EXTRACTION CAPABILITIES:
   - Extract raw text from PDFs
   - Extract text with formatting (bold, italic, etc.)
   - Extract text with position information
   - Extract images from PDFs
   - Extract metadata (author, title, etc.)
   - Extract document structure (headings, paragraphs, etc.)

2. IMPLEMENTATION:
   - Use PyPDF2 or pdfminer.six for text extraction
   - Use pdf2image or PyMuPDF for image extraction
   - Support for both text-based and scanned PDFs
   - Handle encrypted PDFs
   - Process multi-page documents

3. ADVANCED FEATURES:
   - Text layout analysis
   - Table detection and extraction
   - Form field extraction
   - Annotation extraction
   - Bookmark extraction

4. EXAMPLE:
   - Create a function that extracts:
     * All text with formatting
     * All images
     * All metadata
     * Document structure
   - Process a sample PDF and display results

5. PERFORMANCE:
   - Batch processing of multiple PDFs
   - Memory-efficient processing
   - Parallel processing for large documents
   - Progress reporting

6. ERROR HANDLING:
   - Handle corrupted PDFs
   - Handle password-protected PDFs
   - Handle different PDF versions
   - Graceful degradation

7. OUTPUT FORMATS:
   - JSON output
   - Structured data output
   - HTML output
   - Markdown output

This should be a production-ready PDF extraction tool that can handle various PDF types.
"""
EOF

cat > pdf-processing/examples/pdf_ocr.py << 'EOF'
"""
PDF OCR Processing
==================

AI Agent Prompt:
----------------
You are an expert in OCR and PDF processing. Implement a PDF OCR pipeline:

1. OCR PIPELINE:
   - Detect if PDF contains scanned images
   - Extract images from PDF
   - Perform OCR on images
   - Combine OCR text with native text
   - Maintain text positioning

2. IMPLEMENTATION:
   - Use pytesseract for OCR
   - Use OpenCV for image preprocessing
   - Support for multiple OCR engines
   - Language support
   - Text post-processing

3. IMAGE PREPROCESSING:
   - Binarization
   - Deskewing
   - Noise removal
   - Contrast enhancement
   - Resolution adjustment

4. ADVANCED FEATURES:
   - Layout analysis
   - Text line detection
   - Word detection
   - Confidence scoring
   - Multi-language support

5. EXAMPLE:
   - Process a scanned PDF:
     * Extract images
     * Preprocess images
     * Perform OCR
     * Combine results
     * Output structured text

6. PERFORMANCE:
   - GPU acceleration
   - Batch processing
   - Memory management
   - Progress tracking

7. INTEGRATION:
   - Connect with AI agents for:
     * Text understanding
     * Information extraction
     * Document analysis
   - Support for different OCR services

This should be a complete OCR pipeline for scanned PDFs.
"""
EOF

cat > pdf-processing/examples/pdf_metadata.py << 'EOF'
"""
PDF Metadata Extractor and Analyzer
====================================

AI Agent Prompt:
----------------
You are an expert in PDF metadata and digital forensics. Implement a comprehensive metadata extraction and analysis tool:

1. METADATA EXTRACTION:
   - Standard PDF metadata (title, author, etc.)
   - XMP metadata
   - Document information dictionary
   - Custom metadata
   - Digital signatures
   - Encryption information

2. ADVANCED ANALYSIS:
   - Metadata validation
   - Anomaly detection
   - Timestamps analysis
   - Author and creator analysis
   - Version history tracking

3. FORENSIC FEATURES:
   - Metadata tampering detection
   - Hidden metadata extraction
   - Embedded files detection
   - JavaScript detection
   - Action detection (links, forms, etc.)

4. EXAMPLE:
   - Create a function that:
     * Extracts all metadata from a PDF
     * Analyzes metadata for anomalies
     * Generates a forensic report
     * Visualizes metadata relationships

5. OUTPUT:
   - Structured metadata output
   - Forensic report
   - Visualization of metadata
   - Comparison between multiple PDFs

6. INTEGRATION:
   - Connect with AI agents for:
     * Metadata understanding
     * Anomaly explanation
     * Forensic analysis
   - Support for batch processing

7. USE CASES:
   - Document authentication
   - Malware detection
   - Compliance checking
   - Digital investigation

This should be a professional-grade PDF metadata analysis tool.
"""
EOF

cat > pdf-processing/docs/PDF_INTERNALS.md << 'EOF'
# PDF Internals: Complete Guide

## 🎯 AI Agent Prompt

You are an expert in PDF file format and internals. Create a comprehensive guide covering:

### 1. PDF FILE STRUCTURE
- PDF file format overview
- Binary structure and objects
- Cross-reference table
- Trailer dictionary
- File header and body

### 2. PDF OBJECTS
- Object types (boolean, integer, real, string, etc.)
- Indirect objects and references
- Streams and filters
- Dictionary objects
- Array objects

### 3. PAGE STRUCTURE
- Page tree
- Page objects
- Content streams
- Graphics state
- Text rendering

### 4. CONTENT STREAMS
- PDF operators
- Path construction
- Text showing
- Graphics state operators
- Color operators

### 5. FONTS AND TEXT
- Font dictionaries
- Encoding
- Text positioning
- Text rendering modes
- Unicode support

### 6. IMAGES AND GRAPHICS
- Image objects
- Color spaces
- Patterns
- Transparency
- Shading

### 7. INTERACTIVE FEATURES
- Annotations
- Actions
- JavaScript
- Forms
- Links

### 8. METADATA AND PROPERTIES
- Document information dictionary
- XMP metadata
- Custom metadata
- Digital signatures
- Encryption

### 9. PDF VARIANTS
- PDF/A (Archival)
- PDF/X (Exchange)
- PDF/E (Engineering)
- PDF/UA (Universal Accessibility)

### 10. TOOLS AND LIBRARIES
- PyPDF2
- pdfminer.six
- PyMuPDF (fitz)
- pdf2image
- qpdf
- ExifTool

### 11. ADVANCED TOPICS
- PDF forensics
- PDF manipulation
- PDF generation
- PDF optimization
- PDF security

### 12. PRACTICAL EXAMPLES
- Extracting text with formatting
- Extracting images
- Analyzing metadata
- Detecting anomalies
- Modifying PDFs

Include code examples, hex dumps, and practical tools for each section.

This should be the definitive guide to PDF internals for developers and forensic analysts.
EOF

# =============================================
# AGENT FRAMEWORKS SECTION
# =============================================
echo "📦 Creating Agent Frameworks section..."
mkdir -p agent-frameworks/{langgraph,ms-agents,openai-sdk}/{examples,docs}

# LangGraph
cat > agent-frameworks/langgraph/README.md << 'EOF'
# LangGraph: Agent Workflow Framework

## 🎯 Purpose
LangGraph is a framework for building complex agent workflows using graphs. This directory contains examples and documentation for LangGraph.

## 📚 For AI Agents:
You are an expert in LangGraph. Your tasks:

1. Explain LangGraph concepts and architecture
2. Show how to build agent workflows with LangGraph
3. Implement practical examples
4. Compare with other frameworks
5. Provide best practices

## 🔗 Related Topics
- Graph-based workflows
- Agent orchestration
- State management
- Tool integration

## 📌 Structure
- /examples: Practical LangGraph implementations
- /docs: Documentation and guides
EOF

cat > agent-frameworks/langgraph/examples/basic_agent.py << 'EOF'
"""
Basic LangGraph Agent
=====================

AI Agent Prompt:
----------------
You are an expert in LangGraph and Python. Implement a basic LangGraph agent:

1. SETUP:
   - Install LangGraph: pip install langgraph
   - Import necessary modules
   - Set up API keys

2. AGENT DEFINITION:
   - Create a basic agent with:
     * LLM model (OpenAI, Anthropic, etc.)
     * Tools for the agent to use
     * State definition
   - Define the agent's capabilities

3. TOOLS:
   - Implement at least 3 tools:
     * Web search
     * File I/O
     * Code execution
   - Tool schemas and descriptions
   - Error handling for tools

4. STATE MANAGEMENT:
   - Define agent state
   - Track conversation history
   - Manage context
   - Store intermediate results

5. EXAMPLE WORKFLOW:
   - Create an agent that can:
     * Answer questions about code
     * Write and execute Python code
     * Save results to files
     * Search for information online

6. EXECUTION:
   - Run the agent with a sample query
   - Show the conversation flow
   - Display tool calls
   - Show final results

7. BEST PRACTICES:
   - Proper error handling
   - Tool validation
   - State management
   - Logging

This should be a complete, working example of a basic LangGraph agent.
"""
EOF

cat > agent-frameworks/langgraph/examples/workflow_agent.py << 'EOF'
"""
Advanced LangGraph Workflow Agent
==================================

AI Agent Prompt:
----------------
You are an expert in LangGraph workflows. Implement an advanced multi-step workflow:

1. WORKFLOW DESIGN:
   - Define a complex workflow with multiple nodes
   - Include different types of nodes:
     * Agent nodes (for reasoning)
     * Tool nodes (for actions)
     * Conditional nodes (for decisions)
   - Connect nodes with edges

2. IMPLEMENTATION:
   - Create a workflow that:
     a) Receives a user request
     b) Plans the execution
     c) Executes the plan
     d) Verifies the results
     e) Handles errors
   - Use LangGraph's graph capabilities

3. NODE TYPES:
   - Planning node (creates execution plan)
   - Development node (writes code)
   - Testing node (runs tests)
   - Review node (checks quality)
   - Deployment node (deploys code)

4. CONDITIONAL LOGIC:
   - Add decision points
   - Branch based on conditions
   - Merge branches
   - Handle all possible paths

5. STATE MANAGEMENT:
   - Track workflow state
   - Pass data between nodes
   - Handle errors gracefully
   - Support for retries

6. EXAMPLE:
   - Implement a complete software development workflow:
     * User requests a feature
     * System plans the implementation
     * Code is written and tested
     * Results are reviewed
     * Code is deployed if successful

7. ADVANCED FEATURES:
   - Parallel execution of independent nodes
   - Timeout handling
   - Resource management
   - Monitoring and logging

This should demonstrate the power of LangGraph for complex workflows.
"""
EOF

cat > agent-frameworks/langgraph/docs/LANGRAPH_GUIDE.md << 'EOF'
# LangGraph: Complete Guide

## 🎯 AI Agent Prompt

You are an expert in LangGraph framework. Create a comprehensive guide covering:

### 1. INTRODUCTION
- What is LangGraph?
- History and development
- Core concepts
- Use cases

### 2. ARCHITECTURE
- Graph-based workflows
- Nodes and edges
- State management
- Execution engine

### 3. GETTING STARTED
- Installation
- Basic setup
- First agent
- Running workflows

### 4. CORE CONCEPTS
- Agents
- Tools
- State
- Graphs
- Nodes

### 5. BUILDING WORKFLOWS
- Simple workflows
- Complex workflows
- Conditional workflows
- Parallel workflows

### 6. AGENT TYPES
- Single-agent systems
- Multi-agent systems
- Hierarchical agents
- Collaborative agents

### 7. TOOL INTEGRATION
- Tool definition
- Tool schemas
- Tool execution
- Error handling

### 8. STATE MANAGEMENT
- State definition
- Context passing
- Memory management
- State persistence

### 9. ADVANCED TOPICS
- Custom nodes
- Custom edges
- Dynamic graphs
- Error recovery
- Performance optimization

### 10. INTEGRATION
- With external systems
- With databases
- With APIs
- With other frameworks

### 11. BEST PRACTICES
- Workflow design
- Error handling
- Testing
- Debugging
- Monitoring

### 12. COMPARISON
- LangGraph vs. LangChain
- LangGraph vs. CrewAI
- LangGraph vs. custom solutions

### 13. CASE STUDIES
- Customer support system
- Software development assistant
- Research assistant
- Business process automation

### 14. TROUBLESHOOTING
- Common errors
- Debugging techniques
- Performance issues
- Integration problems

Include code examples, architecture diagrams, and practical implementation tips.
EOF

# MS Agents
cat > agent-frameworks/ms-agents/README.md << 'EOF'
# Microsoft Agents Framework

## 🎯 Purpose
Microsoft Agents Framework is a set of tools for building AI agent systems. This directory contains examples and documentation for the framework.

## 📚 For AI Agents:
You are an expert in Microsoft Agents Framework. Your tasks:

1. Explain the framework architecture
2. Show how to build agents with the framework
3. Implement practical examples
4. Integrate with Microsoft ecosystem
5. Provide best practices

## 🔗 Related Topics
- Microsoft AI ecosystem
- Azure services
- .NET integration
- Enterprise AI

## 📌 Structure
- /examples: Practical implementations
- /docs: Documentation and guides
EOF

cat > agent-frameworks/ms-agents/examples/ms_agent_example.py << 'EOF'
"""
Microsoft Agents Framework Example
===================================

AI Agent Prompt:
----------------
You are an expert in Microsoft Agents Framework and Python/.NET. Implement an example agent:

1. SETUP:
   - Install Microsoft Agents Framework
   - Set up Azure AI resources
   - Configure API keys and endpoints

2. AGENT CREATION:
   - Create a basic agent with:
     * Azure OpenAI model
     * Tools and capabilities
     * State management
   - Use the framework's SDK

3. TOOLS:
   - Implement tools for:
     * Azure services integration
     * Database access
     * File operations
     * Web requests
   - Tool definitions and schemas

4. WORKFLOW:
   - Create a workflow that:
     a) Receives user input
     b) Processes the input with AI
     c) Calls appropriate tools
     d) Returns results to user
   - Handle errors and edge cases

5. MICROSOFT INTEGRATION:
   - Connect with:
     * Azure OpenAI
     * Azure Cognitive Services
     * Azure Storage
     * Microsoft Graph API
   - Use Microsoft authentication

6. EXAMPLE:
   - Build an agent that can:
     * Answer questions about Microsoft products
     * Access Azure resources
     * Process documents from OneDrive
     * Send notifications via Teams

7. ENTERPRISE FEATURES:
   - Security and compliance
   - Scalability
   - Monitoring
   - Logging

This should be a complete example of using Microsoft Agents Framework.
"""
EOF

cat > agent-frameworks/ms-agents/docs/MS_AGENTS_GUIDE.md << 'EOF'
# Microsoft Agents Framework: Complete Guide

## 🎯 AI Agent Prompt

You are an expert in Microsoft Agents Framework. Create a comprehensive guide covering:

### 1. INTRODUCTION
- What is Microsoft Agents Framework?
- Microsoft's AI vision
- Framework components
- Target audience

### 2. ARCHITECTURE
- Framework structure
- Core components
- Execution model
- Integration points

### 3. GETTING STARTED
- Prerequisites
- Installation
- Configuration
- First agent

### 4. AGENT DEVELOPMENT
- Agent definition
- Capabilities
- Tools
- State management

### 5. MICROSOFT ECOSYSTEM INTEGRATION
- Azure AI services
- Azure OpenAI
- Azure Cognitive Services
- Microsoft Graph API
- Azure Storage

### 6. WORKFLOW DESIGN
- Simple workflows
- Complex workflows
- Conditional logic
- Parallel execution

### 7. ENTERPRISE FEATURES
- Security
- Scalability
- Monitoring
- Compliance
- Deployment

### 8. TOOL INTEGRATION
- Azure services
- Microsoft 365
- Custom tools
- Third-party integrations

### 9. ADVANCED TOPICS
- Multi-agent systems
- Custom models
- Hybrid AI systems
- Performance optimization

### 10. COMPARISON
- MS Agents vs. LangGraph
- MS Agents vs. OpenAI SDK
- MS Agents vs. custom solutions
- When to use MS Agents

### 11. CASE STUDIES
- Enterprise document processing
- Customer support automation
- Business process automation
- Data analysis pipelines

### 12. BEST PRACTICES
- Agent design
- Error handling
- Testing
- Debugging
- Monitoring

Include code examples, architecture diagrams, and integration patterns.
EOF

# OpenAI SDK
cat > agent-frameworks/openai-sdk/README.md << 'EOF'
# OpenAI Agents SDK

## 🎯 Purpose
OpenAI Agents SDK is the official framework for building AI agents with OpenAI models. This directory contains examples and documentation.

## 📚 For AI Agents:
You are an expert in OpenAI Agents SDK. Your tasks:

1. Explain the SDK architecture
2. Show how to build agents with the SDK
3. Implement practical examples
4. Integrate with OpenAI models
5. Provide best practices

## 🔗 Related Topics
- OpenAI API
- Agent orchestration
- Tool calling
- Model context protocol (MCP)

## 📌 Structure
- /examples: Practical implementations
- /docs: Documentation and guides
EOF

cat > agent-frameworks/openai-sdk/examples/openai_agent_example.py << 'EOF'
"""
OpenAI Agents SDK Example
===========================

AI Agent Prompt:
----------------
You are an expert in OpenAI Agents SDK. Implement a comprehensive example:

1. SETUP:
   - Install OpenAI Agents SDK
   - Set up OpenAI API key
   - Configure environment

2. AGENT CREATION:
   - Create an agent with:
     * OpenAI model (gpt-4, gpt-3.5-turbo, etc.)
     * Tools for the agent
     * Instructions
     * Name and description

3. TOOLS:
   - Implement at least 5 tools:
     * Web search
     * File operations
     * Code execution
     * Database queries
     * API calls
   - Tool schemas with proper types
   - Error handling

4. AGENT CAPABILITIES:
   - Conversation memory
   - Tool calling
   - Reasoning
   - Context management

5. EXAMPLE WORKFLOWS:
   - Simple question answering
   - Multi-step problem solving
   - Code generation and execution
   - Data analysis
   - Document processing

6. ADVANCED FEATURES:
   - Multiple agents collaboration
   - State sharing between agents
   - Error recovery
   - Retry logic
   - Timeout handling

7. INTEGRATION:
   - Connect with external systems
   - Use MCP (Model Context Protocol)
   - Integrate with databases
   - Connect to APIs

8. BEST PRACTICES:
   - Proper error handling
   - Tool validation
   - Rate limiting
   - Logging
   - Monitoring

This should be a complete, production-ready example of OpenAI Agents SDK.
"""
EOF

cat > agent-frameworks/openai-sdk/docs/OPENAI_SDK_GUIDE.md << 'EOF'
# OpenAI Agents SDK: Complete Guide

## 🎯 AI Agent Prompt

You are an expert in OpenAI Agents SDK. Create a comprehensive guide covering:

### 1. INTRODUCTION
- What is OpenAI Agents SDK?
- OpenAI's agent vision
- SDK components
- Use cases

### 2. ARCHITECTURE
- Agent model
- Tool calling
- State management
- Execution flow

### 3. GETTING STARTED
- Installation
- Setup
- Authentication
- First agent

### 4. AGENT CREATION
- Agent definition
- Model selection
- Instructions
- Tools

### 5. TOOL INTEGRATION
- Tool definition
- Tool schemas
- Tool execution
- Error handling

### 6. WORKFLOW DESIGN
- Simple workflows
- Multi-step workflows
- Conditional workflows
- Parallel workflows

### 7. ADVANCED FEATURES
- Multi-agent systems
- State sharing
- Error recovery
- Performance optimization

### 8. MODEL CONTEXT PROTOCOL (MCP)
- What is MCP?
- MCP servers
- MCP clients
- Integration with agents

### 9. INTEGRATION
- With external APIs
- With databases
- With file systems
- With other services

### 10. BEST PRACTICES
- Agent design
- Tool design
- Error handling
- Testing
- Debugging
- Monitoring

### 11. COMPARISON
- OpenAI SDK vs. LangGraph
- OpenAI SDK vs. MS Agents
- OpenAI SDK vs. LangChain
- When to use OpenAI SDK

### 12. CASE STUDIES
- Code generation assistant
- Data analysis agent
- Document processing
- Customer support

### 13. TROUBLESHOOTING
- Common errors
- Debugging techniques
- Performance issues
- API limits

Include code examples, architecture diagrams, and practical patterns.
EOF

# =============================================
# TUTORIALS SECTION
# =============================================
echo "📦 Creating Tutorials section..."
mkdir -p tutorials

cat > tutorials/loop-engineering-101.md << 'EOF'
# Loop Engineering 101: Complete Beginner's Guide

## 🎯 AI Agent Prompt

You are an expert in Loop Engineering. Create a comprehensive beginner's guide that covers:

### 1. WHAT IS LOOP ENGINEERING?
- Definition and concept
- Historical context (from prompts to loops)
- Why it's important
- Real-world applications

### 2. FROM PROMPT ENGINEERING TO LOOP ENGINEERING
- Evolution of AI interaction
- Limitations of prompt engineering
- Advantages of loop engineering
- The paradigm shift

### 3. CORE CONCEPTS
- What is a loop?
- Loop components (action, observation, reasoning, decision)
- Loop patterns (retry, plan-execute-verify, explore-narrow, etc.)
- Termination conditions

### 4. LOOP ENGINEERING IN PRACTICE
- Setting up your first loop
- Choosing the right pattern
- Defining goals and verification
- Error handling

### 5. TOOLS AND TECHNOLOGIES
- Claude Code
- Cursor
- MindStudio
- LangGraph
- Custom implementations

### 6. EXAMPLES
- Simple retry loop
- Plan-execute-verify loop
- Multi-agent loop
- Human-in-the-loop

### 7. BEST PRACTICES
- Goal definition
- Context management
- Error handling
- Cost management
- Security considerations

### 8. COMMON PITFALLS
- Infinite loops
- Context overflow
- Poor goal definition
- Missing tool access
- No termination conditions

### 9. ADVANCED TOPICS
- Worktrees
- Skills
- Connectors
- Sub-agents
- Memory

### 10. RESOURCES
- Books
- Articles
- Communities
- Tools

Include code examples, diagrams, and practical exercises for each section.

This should be a complete guide that takes someone from zero to productive with Loop Engineering.
EOF

cat > tutorials/dag-workflows-guide.md << 'EOF'
# DAG Workflows Guide: Orchestrating AI Agents

## 🎯 AI Agent Prompt

You are an expert in DAG-based workflows for AI agents. Create a comprehensive guide covering:

### 1. INTRODUCTION TO DAG WORKFLOWS
- What are DAGs?
- Why DAGs for AI agents?
- DAGs vs. other orchestration patterns
- Real-world use cases

### 2. DAG FUNDAMENTALS
- Nodes and edges
- Directed vs. undirected
- Acyclic property
- Topological sorting

### 3. DESIGNING DAG WORKFLOWS
- Identifying tasks
- Defining dependencies
- Creating the graph structure
- Validating the DAG

### 4. IMPLEMENTATION APPROACHES
- In-memory execution
- Distributed execution
- Persistent storage
- Dynamic modification

### 5. DAG + AI AGENTS
- Mapping agents to nodes
- Context passing
- Error handling
- Monitoring

### 6. PRACTICAL EXAMPLES
- Simple workflow
- Complex workflow
- Conditional workflow
- Parallel workflow

### 7. TOOLS AND FRAMEWORKS
- Airflow
- Prefect
- Dagster
- Custom implementations

### 8. INTEGRATION WITH AI SYSTEMS
- Agent orchestration
- Tool calling
- State management
- Result aggregation

### 9. BEST PRACTICES
- Workflow design
- Error handling
- Performance optimization
- Testing
- Debugging

### 10. ADVANCED TOPICS
- Dynamic DAGs
- Nested DAGs
- DAGs with loops
- Distributed DAGs

Include code examples, architecture diagrams, and practical implementation tips.
EOF

cat > tutorials/graph-rag-tutorial.md << 'EOF'
# Graph RAG Tutorial: Building Knowledge Graphs for AI

## 🎯 AI Agent Prompt

You are an expert in Graph RAG. Create a comprehensive tutorial covering:

### 1. INTRODUCTION TO GRAPH RAG
- What is Graph RAG?
- How it improves upon traditional RAG
- When to use Graph RAG
- Real-world applications

### 2. KNOWLEDGE GRAPHS
- What are knowledge graphs?
- Graph databases
- Schema design
- Best practices

### 3. BUILDING A KNOWLEDGE GRAPH
- Data collection
- Entity extraction
- Relationship extraction
- Graph construction
- Quality assurance

### 4. GRAPH RETRIEVAL
- Query types
- Traversal algorithms
- Scoring and ranking
- Combining strategies

### 5. RAG WITH KNOWLEDGE GRAPHS
- LLM integration
- Context construction
- Prompt engineering
- Result generation

### 6. IMPLEMENTATION
- In-memory graphs
- Database-backed graphs
- Hybrid approaches
- Cloud solutions

### 7. EXAMPLE: AI DOMAIN KNOWLEDGE GRAPH
- Defining the schema
- Extracting entities and relationships
- Building the graph
- Querying the graph
- Using with RAG

### 8. ADVANCED TOPICS
- Temporal knowledge graphs
- Multi-modal graphs
- Graph neural networks
- Federated graphs

### 9. EVALUATION
- Metrics
- Benchmarking
- Comparison with traditional RAG
- Error analysis

### 10. TOOLS AND FRAMEWORKS
- Neo4j
- Amazon Neptune
- LangChain
- Custom implementations

Include step-by-step instructions, code examples, and practical exercises.
EOF

cat > tutorials/pdf-processing-guide.md << 'EOF'
# PDF Processing Guide: Working with Documents in AI Systems

## 🎯 AI Agent Prompt

You are an expert in PDF processing for AI systems. Create a comprehensive guide covering:

### 1. INTRODUCTION TO PDF PROCESSING
- Why PDFs are important for AI
- Challenges with PDFs
- PDF processing pipeline
- Use cases

### 2. PDF FILE STRUCTURE
- PDF format overview
- Objects and references
- Streams and filters
- Cross-reference table
- Trailer dictionary

### 3. TEXT EXTRACTION
- Simple text extraction
- Text with formatting
- Text with positioning
- Multi-page documents
- Encrypted PDFs

### 4. IMAGE EXTRACTION
- Detecting images in PDFs
- Extracting images
- Image formats
- Image preprocessing
- OCR for images

### 5. METADATA EXTRACTION
- Standard metadata
- XMP metadata
- Document information
- Custom metadata
- Digital signatures

### 6. ADVANCED TOPICS
- Tables extraction
- Forms extraction
- Annotations extraction
- Layout analysis
- Document structure

### 7. OCR PROCESSING
- When to use OCR
- OCR pipeline
- Image preprocessing
- Text post-processing
- Multi-language support

### 8. TOOLS AND LIBRARIES
- PyPDF2
- pdfminer.six
- PyMuPDF
- pdf2image
- pytesseract
- qpdf

### 9. INTEGRATION WITH AI
- Text understanding
- Information extraction
- Document analysis
- Question answering

### 10. BEST PRACTICES
- Error handling
- Performance optimization
- Memory management
- Batch processing
- Quality assurance

Include code examples, tool comparisons, and practical exercises.
EOF

cat > tutorials/agent-frameworks-comparison.md << 'EOF'
# Agent Frameworks Comparison: LangGraph vs. MS Agents vs. OpenAI SDK

## 🎯 AI Agent Prompt

You are an expert in AI agent frameworks. Create a comprehensive comparison guide covering:

### 1. INTRODUCTION
- The rise of agent frameworks
- Why frameworks are important
- Comparison methodology

### 2. LANGRAPH
- Overview
- Architecture
- Key features
- Pros and cons
- Best use cases
- Example implementation

### 3. MICROSOFT AGENTS FRAMEWORK
- Overview
- Architecture
- Key features
- Pros and cons
- Best use cases
- Example implementation

### 4. OPENAI AGENTS SDK
- Overview
- Architecture
- Key features
- Pros and cons
- Best use cases
- Example implementation

### 5. COMPARISON MATRIX
| Feature | LangGraph | MS Agents | OpenAI SDK |
|---------|-----------|-----------|------------|
| Ease of Use | | | |
| Flexibility | | | |
| Integration | | | |
| Performance | | | |
| Ecosystem | | | |
| Pricing | | | |

### 6. WHEN TO USE EACH
- LangGraph use cases
- MS Agents use cases
- OpenAI SDK use cases
- Hybrid approaches

### 7. FEATURE COMPARISON
- Agent creation
- Tool integration
- State management
- Workflow design
- Error handling
- Monitoring
- Scalability

### 8. INTEGRATION COMPARISON
- With external systems
- With databases
- With APIs
- With other frameworks

### 9. PERFORMANCE COMPARISON
- Execution speed
- Memory usage
- Token usage
- Scalability

### 10. COMMUNITY AND SUPPORT
- Documentation
- Community size
- Commercial support
- Open source

### 11. MIGRATION GUIDE
- From LangGraph to MS Agents
- From LangGraph to OpenAI SDK
- From MS Agents to LangGraph
- From MS Agents to OpenAI SDK
- From OpenAI SDK to LangGraph
- From OpenAI SDK to MS Agents

### 12. RECOMMENDATIONS
- For beginners
- For enterprises
- For startups
- For researchers
- For production systems

Include code examples, architecture diagrams, and practical recommendations.
EOF

# =============================================
# ROOT LEVEL FILES
# =============================================
echo "📦 Creating root level files..."
cat > README.md << 'EOF'
# AI Knowledge Hub 🧠

**Your comprehensive resource for AI Agent Systems, Loop Engineering, DAGs, Graph RAG, and more!**

## 🌟 About This Repository

This repository contains **practical examples, tutorials, and documentation** for building modern AI agent systems. Created by **Kobi Shahar**, a Senior AI Systems Engineer with 20+ years of experience in software development, cloud infrastructure, and digital forensics.

## 📚 What You'll Find Here

### 🔄 Loop Engineering
- **Concepts**: Understanding the shift from prompt engineering to loop engineering
- **Patterns**: Retry loops, Plan-Execute-Verify, Multi-Agent systems
- **Examples**: Python and TypeScript implementations
- **Best Practices**: Goal definition, error handling, cost management

### 🔷 DAG Workflows
- **Fundamentals**: Directed Acyclic Graphs for workflow orchestration
- **Implementation**: Building DAG execution engines
- **Integration**: Combining DAGs with AI agents
- **Advanced**: Conditional logic, parallel execution

### 🧠 Graph RAG
- **Knowledge Graphs**: Building and querying knowledge bases
- **Retrieval**: Advanced retrieval strategies
- **Integration**: Combining graphs with LLMs
- **Use Cases**: Document understanding, research assistance

### 📄 PDF Processing
- **Internals**: Understanding PDF file structure
- **Extraction**: Text, images, and metadata extraction
- **OCR**: Processing scanned documents
- **Forensics**: Digital investigation techniques

### 🤖 Agent Frameworks
- **LangGraph**: Graph-based workflows
- **Microsoft Agents**: Enterprise AI solutions
- **OpenAI SDK**: Official OpenAI agent framework
- **Comparisons**: When to use each framework

## 🎯 Who Is This For?

- **Developers** wanting to build AI agent systems
- **Architects** designing complex AI workflows
- **CTOs** evaluating AI technologies
- **Students** learning about modern AI systems
- **Anyone** interested in the future of software development

## 🚀 Getting Started

1. **Explore the directories** to find topics of interest
2. **Read the tutorials** in the `/tutorials` directory
3. **Run the examples** to see concepts in action
4. **Contribute** your own examples and improvements

## 💡 Key Concepts

| Concept | Description | Where to Learn |
|---------|-------------|----------------|
| Loop Engineering | Designing systems that automatically prompt AI agents | `/loop-engineering` |
| DAGs | Directed Acyclic Graphs for workflow orchestration | `/dag-workflows` |
| Graph RAG | Knowledge graphs for enhanced retrieval | `/graph-rag` |
| PDF Processing | Extracting and understanding PDF content | `/pdf-processing` |
| LangGraph | Microsoft's agent framework | `/agent-frameworks/langgraph` |
| MS Agents | Microsoft's agent framework | `/agent-frameworks/ms-agents` |
| OpenAI SDK | OpenAI's agent framework | `/agent-frameworks/openai-sdk` |

## 📢 Stay Updated

- **LinkedIn**: [Kobi Shahar](https://linkedin.com/in/kobishahar)
- **GitHub**: [Your GitHub Profile]
- **Newsletter**: [Subscribe for updates]

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guide]() for details.

## 📜 License

This repository is licensed under the [MIT License]().

---

**Built with ❤️ by Kobi Shahar**

*Senior AI Systems Engineer | Loop Engineering Specialist | AI Innovator*
EOF

cat > CONTRIBUTING.md << 'EOF'
# Contributing to AI Knowledge Hub

## 🎉 Welcome!

Thank you for your interest in contributing to the AI Knowledge Hub! We welcome contributions from everyone.

## 📌 How to Contribute

### Reporting Issues
- Use the GitHub issue tracker to report bugs or suggest features
- Include detailed information about the issue
- Provide steps to reproduce if it's a bug

### Suggesting Enhancements
- Open an issue to discuss your idea
- Provide use cases and benefits
- Be open to feedback and discussion

### Submitting Pull Requests
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Contributions
- Follow the existing code style
- Include appropriate comments
- Add tests for new functionality
- Update documentation
- Keep commits atomic

### Documentation Contributions
- Improve existing documentation
- Add new tutorials and guides
- Update examples
- Fix typos and errors

## 📝 Pull Request Guidelines

1. **Title**: Clear and descriptive
2. **Description**: Explain what you're changing and why
3. **Scope**: Keep PRs focused on one feature/fix
4. **Testing**: Ensure all tests pass
5. **Review**: Be responsive to feedback

## 🎨 Code Style Guidelines

### Python
- Follow PEP 8 style guide
- Use type hints
- Include docstrings
- Use consistent naming

### TypeScript
- Follow TypeScript best practices
- Use strong typing
- Include JSDoc comments
- Use consistent formatting

### Documentation
- Use clear, concise language
- Include code examples
- Add diagrams where helpful
- Keep it up-to-date

## 🚀 Getting Started

1. Find an issue you'd like to work on
2. Comment on the issue to let others know you're working on it
3. Fork the repository and create your branch
4. Implement your changes
5. Submit a Pull Request

## 🤝 Community

- Join our [Discord]() for discussions
- Follow us on [LinkedIn]()
- Star this repository to show your support

Thank you for contributing!
EOF

cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# TypeScript
node_modules/
dist/
build/
*.tsbuildinfo

# IDE
.idea/
.vscode/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Environment
.env
.env.local
.env.*.local

# Testing
.coverage
htmlcov/
.pytest_cache/
.tox/

# Documentation
*.md.swp
EOF

echo ""
echo "✅ Repository structure created successfully!"
echo ""
echo "📊 Summary:"
echo "   - Created $(find . -type d | wc -l) directories"
echo "   - Created $(find . -type f | wc -l) files"
echo ""
echo "📁 Repository structure:"
tree -L 3 --noreport 2>/dev/null || find . -type f | head -20
echo ""
echo "🚀 Next steps:"
echo "   1. cd ai-knowledge-hub"
echo "   2. git init"
echo "   3. git add ."
echo "   4. git commit -m 'Initial repository structure with AI agent prompts'"
echo "   5. Start filling in the files with actual code!"
echo ""
echo "💡 Each file contains detailed prompts for AI agents (Claude Code, Cursor, etc.)"
echo "   that explain exactly what should be implemented."
