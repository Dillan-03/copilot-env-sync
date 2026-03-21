# Contributing to copilot-env-sync

Thanks for wanting to contribute! This project is intentionally small and focused — contributions that keep it simple are most welcome.

## What we welcome

- Bug fixes
- Support for new Copilot CLI features (new config fields, commands)
- Better error messages and UX
- Docs improvements
- Test scripts

## What we're careful about

- No runtime dependencies beyond `git`, `copilot`, and `python3`
- No lock-in to any cloud service
- POSIX-compatible shell where possible

## Getting started

```sh
git clone https://github.com/Dillan-03/copilot-env-sync.git
cd copilot-env-sync
sh install.sh        # install copilot-sync locally
copilot-sync help    # verify it works
```

## Project structure

```
copilot-env-sync/
 ├── bin/
 │    └── copilot-sync     # The CLI — POSIX sh + python3 for JSON
 ├── examples/
 │    └── config.json      # Example sync config
 ├── install.sh            # One-line installer
 ├── README.md
 └── CONTRIBUTING.md
```

## Making changes

1. Edit `bin/copilot-sync`
2. Test manually:
   ```sh
   sh bin/copilot-sync help
   sh bin/copilot-sync status
   ```
3. Verify syntax: `sh -n bin/copilot-sync`

## Submitting a PR

- Keep commits small and focused
- Use conventional commit messages: `fix:`, `feat:`, `docs:`
- Update `README.md` if you add a feature

## Good first issues

- Add `--dry-run` flag to `pull` command
- Add `copilot-sync list` to show config contents without running status
- Add MCP server config sync (`~/.copilot/mcp-config.json`)
- Write a test script that validates the CLI against a real Copilot install
