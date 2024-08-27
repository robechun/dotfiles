# Usage

```
$ git clone git@github.com:robechun/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow config hammerspoon zsh git # plus whatever else you'd like
```

## Env variables
If you have any env variables (like OPENAI_API_KEY), you can set them in

'~/.zshenv'

Something like:
```
export OPENAI_API_KEY=<api_key_here>
export ANTHROPIC_API_KEY=<api_key_here>
```
