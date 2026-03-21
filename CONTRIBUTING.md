# Contributing to copilot-env-sync

Thanks for your interest! This project is intentionally small and hackable.

## Project Structure

```
copilot-env-sync/
├── bin/
│   └── copilot-sync      # The main CLI script (POSIX sh)
├── examples/
│   └── config.json       # Example config file
├── install.sh            # Installer script
├── README.md
└── CONTRIBUTING.md
```

## How It Works

1. `copilot plugin list` — captures installed plugins
2. Config is written to `~/.copilot-sync/config.json` as a git repo
3. `push` stages + commits + pushes to `origin`
4. `pull` clones/pulls the repo, then runs `copilot plugin install` for anything missing

The entire tool is one POSIX shell script with no external dependencies beyond `git` and `copilot`.

## Development Setup

```sh
git clone https://github.com/Dillan-03/copilot-env-sync.git
cd copilot-env-sync

# Test locally without installing
sh bin/copilot-sync help
sh bin/copilot-sync status
```

## Good First Contributions

### Agent sync
The `agents` array in `config.json` is scaffolded but not yet implemented. A useful first PR would read agent files from `~/.copilot/` and snapshot them into the config.

### Profile support
Add a `--profile <name>` flag so users can maintain separate `work.json` and `personal.json` configs.

### Other tools
Add detection + sync for Claude Code (`.claude/`), Cursor (`.cursor/`), or Codex CLI (`.codex/`).

### Better diff output
`copilot-sync status` could output a cleaner visual diff — colour-coded additions, removals, and untracked plugins.

## Guidelines

- Keep the script POSIX-compliant (`#!/bin/sh`, no bashisms)
- No new runtime dependencies — `git` and `copilot` are the only requirements
- One command per function, named `cmd_<name>`
- Add a row to the commands table in README.md for any new command
- Test on both macOS and Linux if possible

## Submitting a PR

1. Fork the repo
2. Create a branch: `git checkout -b feat/my-contribution`
3. Make your changes
4. Test with `sh bin/copilot-sync help` and the relevant subcommand
5. Open a PR with a clear description of what it does and why
