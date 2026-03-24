# copilot-env-sync

> Sync your Copilot CLI setup across machines in seconds.

`copilot-env-sync` is a lightweight CLI tool that lets developers sync their **Copilot CLI plugins, skills, agents, and custom marketplaces** using a simple, version-controlled configuration.

Works with the official **`gh copilot`** extension (GitHub CLI). No separate `copilot` binary required.

No cloud required. No vendor lock-in. Just Git.

---

## Compatibility

This tool works with the official GitHub Copilot CLI extension:

```sh
gh extension install github/gh-copilot
```

> **Note:** `gh copilot` does not expose a plugin or marketplace API, so the tool cannot automatically install plugins or register marketplaces. Instead, `copilot-sync pull` displays your recorded config so you can apply items manually.

---

## What gets tracked

| Item | Notes |
|------|-------|
| **Plugins** | e.g. `feature-dev@claude-code-plugins` — displayed on pull for manual installation |
| **Marketplaces** | Custom registries e.g. `impeccable` — displayed on pull for manual registration |
| **Model preference** | e.g. `claude-sonnet-4.6` — recorded for reference |

Skills and agents are bundled inside plugins and are not tracked separately.

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

> **First:** Create a new **private** repo on GitHub (e.g. `copilot-env`) to store your config. Then:

```sh
copilot-sync init                          # snapshot current environment
cd ~/.copilot-sync
git remote add origin https://github.com/<you>/copilot-env.git
git push -u origin main
```

**Machine 2 — view and apply your config:**

```sh
copilot-sync pull https://github.com/<you>/copilot-env.git
```

The config is displayed so you can manually apply plugins, marketplaces, and model preferences via `gh copilot`.

---

## Commands

```sh
copilot-sync init                 # Snapshot current environment → config
copilot-sync push [message]       # Update config and push to remote
copilot-sync pull [remote-url]    # Show config (clone from URL if needed)
copilot-sync status               # Show config contents
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

Create a **private repo in your org** (e.g. `github.com/your-org/copilot-env`) and share it with your team. Everyone gets the same plugins, skills, and marketplaces without manual setup.

```sh
# Everyone runs once:
copilot-sync pull https://github.com/your-org/copilot-env.git

# When you update your config:
copilot-sync push "add: security-review plugin"
# teammates run:
copilot-sync pull
```

---

## Requirements

- `git` (for config versioning)
- `gh` CLI with `gh copilot` extension (`gh extension install github/gh-copilot`)
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
