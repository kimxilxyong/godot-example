# Repository Guidance

- The workspace contains a minimal Godot 4.x project: `project.godot` launches `main.tscn`, which displays a centered greeting. Preserve the configured major-version conventions when extending it.
- Check whether a Godot executable is available before running engine commands. If not, use focused static checks and state that engine import/runtime validation was unavailable.
- `.vscode/` contains editor settings and an Ollama extension recommendation. Treat these as local development configuration, not as a game runtime dependency; do not copy endpoint values into project code or documentation unless explicitly requested.
- As the Godot project takes shape, follow its configured Godot version and established scene, resource, and GDScript patterns. Keep this guidance aligned with the actual repository rather than adding speculative conventions.
