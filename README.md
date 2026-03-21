# copilot-env-sync

> Sync your Copilot CLI setup across machines in seconds.

`copilot-env-sync` is a lightweight CLI tool that lets developers sync their **Copilot CLI plugins, skills, agents, and custom marketplaces** using a simple, version-controlled configuration.

No cloud required. No vendor lock-in. Just Git.

---

## What gets synced

| Item | How |
|------|-----|
| **Plugins** | `feature-dev@claude-code-plugins`, etc. |
| **Skills** | Bundled in plugins — restored automatically |
| **Agents** | Bundled in plugins (e.g. `code-reviewer`, `code-architect`) |
| **Marketplaces** | Custom registries like `impeccable`, `anthropic-agent-skills` |
| **Model preference** | e.g. `claude-sonnet-4.6` |

---

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/Dillan-03/copilot-env-sync/main/install.sh | sh
```

Or clone and install:

```sh
git clone https://github.com/Dillan-03/copilot-env-sync.git
cd copilot-env-sync
sh install.sh
```

Add to your PATH if needed (add to `~/.zshrc` or `~/.bashrc`):

```sh
export PATH="$HOME/.local/bin:$PATH"
```

---

## Quick Start

**Machine 1 — snapshot and push your setup:**

```sh
copilot-sync init                          # snapshot current environment
cd ~/.copilot-sync
git remote add origin https://github.com/<you>/copilot-env.git
git push -u origin main
```

**Machine 2 — restore everything:**

```sh
copilot-sync pull https://github.com/<you>/copilot-env.git
```

That's it. Your plugins, skills, agents, and marketplaces are restored.

---

## Commands

```sh
copilot-sync init                 # Snapshot current environment → config
copilot-sync push [message]       # Update config and push to remote
copilot-sync pull [remote-url]    # Apply config (clone from URL if needed)
copilot-sync status               # Compare config vs current environment
copilot-sync help                 # Show all commands
```

---

## Example config

The config lives at `~/.copilot-sync/config.json` (a git repo):

```json
{
  "version": "2",
  "updated_at": "2024-01-01T00:00:00Z",
  "updated_from": "my-macbook",
  "model": "claude-sonnet-4.6",
  "marketplaces": [
    { "name": "impeccable",            "source": "pbakaus/impeccable" },
    { "name": "anthropic-agent-skills","source": "anthropics/skills"  }
  ],
  "plugins": [
    "frontend-design@claude-code-plugins",
    "feature-dev@claude-code-plugins",
    "impeccable@impeccable"
  ],
  "agents": []
}
```

---

## Team workflow

Share the config repo with your team:

```sh
# Everyone runs once:
copilot-sync pull https://github.com/your-org/copilot-env.git

# When you add a new plugin:
copilot-sync push "add: security-review plugin"
# teammates run:
copilot-sync pull
```

---

## Requirements

- `git` (for config versioning)
- `copilot` CLI (GitHub Copilot CLI)
- `python3` (for JSON parsing — available by default on macOS and most Linux distros)

---

## Roadmap

- [ ] Profile switching (work / personal)
- [ ] MCP server config sync
- [ ] Support for other AI CLI tools
- [ ] Plugin version pinning

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to get involved.

---

## License

MIT
