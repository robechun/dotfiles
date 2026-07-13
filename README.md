# Usage

```
$ git clone git@github.com:robechun/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow config hammerspoon zsh git claude # plus whatever else you'd like
```

## Env variables
Secrets live in `~/.zshenv` (a local file, NOT tracked here). Something like:
```
export OPENAI_API_KEY=<api_key_here>
```

Note: do NOT export `ANTHROPIC_API_KEY` here for Claude Code — see below.

## Claude Code auth (`claude-auth`)
The `claude` stow package installs `claude-auth`, which flips Claude Code
between the Max subscription and API-key billing via the `apiKeyHelper`
setting (the env var is deliberately never exported, so headless `claude -p`
can't silently bill API credits):

```
$ claude-auth api      # bill API credits
$ claude-auth sub      # bill Max subscription
$ claude-auth toggle   # flip
$ claude-auth          # show current mode
```
Restart Claude after switching; verify with `claude auth status` (check the
`apiKeySource` field, not "Login method").

### Per-machine setup (incl. the SSH box)
The API key is never committed. On each machine:
```
$ stow claude
$ install -m 600 /dev/null ~/.claude/anthropic-key   # create empty, 0600
# then paste the key into it, e.g. from your Mac:
#   scp ~/.claude/anthropic-key remote:~/.claude/anthropic-key
$ claude-auth api
```
Requires `python3` on PATH. For the subscription side, run `claude auth login`
once on that machine (both machines are logged into Max).
