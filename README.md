# copilot-env-sync

> Git for your Copilot CLI setup.

Sync your GitHub Copilot CLI plugins and agents across every machine with a single command.

## The Problem

Developers using GitHub Copilot CLI often:

- Install plugins manually on every machine
- Lose their setup when switching laptops or joining a new team
- Have no way to share a consistent AI environment with teammates

There is no built-in way to **persist and sync your Copilot CLI configuration**.

## The Solution

`copilot-sync` lets you:

- Snapshot your current plugin setup into a version-controlled config
- Push it to a GitHub repo
- Pull it onto any machine in seconds

```bash
# On machine A — save your setup
copilot-sync init
copilot-sync push

# On machine B — restore it
copilot-sync pull https://github.com/you/copilot-env.git
```

---

## Installation

```sh
curl -fsSL https://raw.githubusercontent.com/Dillan-03/copilot-env-sync/main/install.sh | sh
```

Or manually:

```sh
git clone https://github.com/Dillan-03/copilot-env-sync.git
cd copilot-env-sync
sh install.sh
```

---

## Commands

| Command | Description |
|---|---|
| `copilot-sync init` | Snapshot current plugins into `~/.copilot-sync/config.json` |
| `copilot-sync push [message]` | Update config, commit, push to remote |
| `copilot-sync pull [remote-url]` | Apply config (optionally clone from URL first) |
| `copilot-sync status` | Show diff between config and current environment |

---

## Workflow

### New machine

```bash
# Clone your config and apply it
copilot-sync pull https://github.com/you/copilot-env.git

# Result: all your plugins are installed
copilot plugin list
```

### After installing a new plugin

```bash
copilot plugin install testing-automation@awesome-copilot

# Save and sync
copilot-sync push "add: testing-automation"
```

### Team setup

Share your config repo URL. Every developer runs:

```bash
copilot-sync pull https://github.com/your-team/copilot-env.git
```

---

## Config Format

Config lives at `~/.copilot-sync/config.json`:

```json
{
  "version": "1",
  "updated_at": "2025-03-20T10:00:00Z",
  "updated_from": "my-macbook",
  "plugins": [
    "testing-automation@awesome-copilot",
    "security-best-practices@awesome-copilot",
    "frontend-web-dev@awesome-copilot",
    "feature-dev@claude-code-plugins"
  ],
  "agents": []
}
```

The config repo is a plain git repo — fork it, edit it, version it like any code.

---

## Requirements

| Tool | Purpose |
|---|---|
| `git` | Cloning and syncing config |
| `copilot` CLI | Installing and listing plugins |

No backend. No account. No lock-in.

---

## Roadmap

- [ ] `agents` support — sync custom agents from config
- [ ] Profile switching (`work`, `personal`, `team`)
- [ ] `copilot-sync diff` — visual diff of config vs current state
- [ ] Support for other AI CLI tools (Claude Code, Codex CLI)
- [ ] Auto-sync on plugin install via hook

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md). All contributions welcome.

Good first issues:
- **Agent sync** — implement the `agents` array in `config.json`
- **Profile support** — multiple named configs
- **Other tools** — detect and sync Claude Code / Cursor settings

---

## License

MIT © [Dillan-03](https://github.com/Dillan-03)
