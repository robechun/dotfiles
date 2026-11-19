# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This file runs on the Mac and on Linux exe.dev boxes (stowed there by
# ~/.config/charcoal/exe-personal-setup.sh). Mac-only lines go in IS_MAC blocks.
if [[ $OSTYPE == darwin* ]]; then IS_MAC=1; else IS_MAC=; fi

if [[ -n $IS_MAC ]]; then
  # Homebrew shell environment (sets HOMEBREW_PREFIX, PATH, etc.)
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="$PATH:/opt/homebrew/opt/llvm@14/bin"
  export PATH="$PATH:/usr/local/opt/python@3.10/bin"
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
  # For image.nvim and imagemagick
  export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"
else
  # exe.dev box: its environment (nvm, gh, Claude token, AWS role) lives in
  # ~/.profile, written by charcoal-base in sh syntax.
  emulate sh -c '. "$HOME/.profile"'
  # Every box is a clone of the same snapshot; don't prompt to update on each.
  zstyle ':omz:update' mode disabled
fi

# bun
export BUN_INSTALL="$HOME/.bun"

# If you come from bash you might have to change your $PATH.
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.toolbox/bin"
command -v go >/dev/null && export PATH="$PATH:$(go env GOPATH)/bin"
# Before the system paths on Linux, where the image ships an old nvim in /usr/bin.
if [[ -n $IS_MAC ]]; then export PATH="$PATH:$HOME/.local/bin"; else export PATH="$HOME/.local/bin:$PATH"; fi

# export TERM="xterm-ghostty"
# export TERM="alacritty"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

# vim/tmux
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias oldvim="vim"
alias tat='tmux attach -t'
alias tls='tmux ls'
alias tmux='tmux -2'

# kube
alias k="kubectl"
alias kp="k get pods"
alias kdp="k describe pod"

# ssh stuff
if [[ -n $IS_MAC ]]; then
  if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null 2>&1
  fi
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519 2>/dev/null
fi

alias mini="ssh mini"

# misc other commands
alias zz="vim ~/.zshrc"
alias tt="vim ~/.tmux.conf.local"
alias pp="vim package.json"
alias conf="cd ~/.config/nvim"
alias nr="npm run"
alias br="bun run"
alias ww="cd ~/workspace"
alias p="pnpm"
alias pr="pnpm run"
# alias c="claude --dangerously-skip-permissions"
alias c="jaynshare claude --dangerously-skip-permissions"
alias co="jaynshare codex --yolo"
alias sso="aws sso login --profile prod"

alias cc="cd ~/workspace/charcoal"

# github
alias ghcs="gh copilot suggest"

# terraform
# Mac only: a box's AWS identity comes from its tier's role (~/.profile).
[[ -n $IS_MAC ]] && export AWS_PROFILE=prod
alias tf="terraform"

ZSH_THEME=powerlevel10k/powerlevel10k

ZSH_DISABLE_COMPFIX=true

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
 plugins=(
   git
   man
   python
   # zsh-syntax-highlighting
   # zsh-autosuggestions
)
[[ -n $IS_MAC ]] && plugins+=(macos fnm)

# No autocorrect on shell
unsetopt correct

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Homebrew's share dir on the Mac, apt's on Linux.
ZSH_PLUGIN_SHARE=${HOMEBREW_PREFIX:-/usr}/share
source $ZSH_PLUGIN_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

unalias gwt 2>/dev/null
gwt() {
  local dir
  dir=$(~/.local/bin/gwt-helper "$@") && cd "$dir"
}

# Shell completion
autoload -U compinit; compinit
