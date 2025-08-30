# `graphene`

> Artwork created in Graphite is represented as a node graph that generates the graphical content authored by the user. 

## Latency/Performance Tradeoff

| Regime      | Implemented? | Usage |
| ----------- | ------------ | ----- |
| Interpreted | ✅           | While Editing, for interactive changes. |
| JIT         | ⏳           | While editing.  Dynamically bridges gap between both other regimes by selectively substituting branches of the graph with interpreted and compiled nodes to keep latency low and work towards higher execution perf. |
| Compiled    | ⏳           | When exported, the entire graph is computed as a standalone program.  For example, a CLI program may read a string input (like a name) and procedurally generate an output image (like a birthday card) |

The `JIT` and `Compiled` regimes will require a rust compile server (for the web app) or a local copy of `rustc` (for the desktop app).

* Without a compile server, all nodes are precompiled when Graphite is built.
* `node_registry.rs` allows the interpreter to lookup Rust functions for each node.
* **Nodes support generics, so it's currently necessary to list every forseeable concrete type signature in the registry** until the compile server can generate bytecode for less common type combinations on-the-fly.

## Nodes

> See [Creating Nodes in Graphite](https://github.com/GraphiteEditor/Graphite/tree/master/node-graph)

* `(Atomic)Nodes` are functions written in Rust
  * every node has precompiled bytecode that ships with Graphite for use in the interpreted regime

## Graphene Language Concepts

| Graphene concept | Programming language concept |
| ---------------- | ---------------------------- |
| Node | Function |
| Graphite editor | IDE/text editor |
| Document | Source code |
| Graph/network | Abstract syntax tree (AST) |
| Graph compilation | Linking/JIT optimization/compilation |
| Graph execution | Program execution |

------------------------------

## Code Links

* [main entry point for the compiler](https://github.com/GraphiteEditor/Graphite/blob/master/node-graph/graph-craft/src/graphene_compiler.rs#L8) (via [discord](https://discordapp.com/channels/731730685944922173/1059075292414619689/1409826353410478181))

## References

* [Graphene Guide](https://graphite.rs/volunteer/guide/graphene/)
* [Graphene Concept Notes PDF](https://files.keavon.com/-/VigilantEmotionalPeregrinefalcon/Graphene_concept_notes.pdf)