# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/opt/llvm/bin:$HOME/bin:/usr/local/bin:$PATH:~/.toolbox/bin:/usr/local/opt/python@3.10/bin:$PATH
eval "$(fnm env --use-on-cd)"

# For image.nvim and imagemagick
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

# export TERM="xterm-256color"
export TERM="alacritty"
# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
export EDITOR='nvim'
export CANARY_USER='rob'


alias ssh="python3 ~/.config/kitty/sshTic.py" 

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

# ssh stuff
alias burn="ssh -i ~/personal/burnmoney_ec2.pem ec2-user@10.0.96.61"
alias ghost="ssh -i ~/ghost-kp.pem ubuntu@ec2-44-228-159-243.us-west-2.compute.amazonaws.com"

# misc other commands
alias zz="vim ~/.zshrc"
alias tt="vim ~/.tmux.conf.local"
alias pp="vim package.json"
alias conf="cd ~/.config/nvim"
alias nr="npm run"

# going to right folder
alias ai="cd ~/workspace/front-ai"
alias aim="cd ~/workspace/worktree/front-ai"
alias fe="cd ~/workspace/front-client"
alias fem="cd ~/workspace/worktree/front-client"
alias be="cd ~/workspace/front"
alias bem="cd ~/workspace/worktree/front"
alias inf="cd ~/workspace/front-infra"
alias infm="cd ~/workspace/front-infra.git/master"

# Front related
export STAGING_NAMESPACE=rchung
export PREPROD_USER=rob
export STAGING_CONTEXT=usw2.staging

alias kp="k get pods"
alias kdp="k describe pod"

alias gpstaging="git push origin HEAD:rchung/staging -f"
alias gppreprod="git push origin HEAD:preprod -f"
alias gphqpreprod="git push origin HEAD:hq-preprod -f"
alias staging="ssh aws-us-staging-1"
alias staging-eu="ssh aws-eu-staging"
alias res="npm ci && npm run build && npm run serve"
alias single="npm run mocha:single"
alias merge="npm run merge:prod"
alias logstagingexp="stern -n ${STAGING_NAMESPACE} --context ${STAGING_CONTEXT} -l 'app.kubernetes.io/name=front-exposed-components' --tail=0"
alias logstagingwork="stern -n ${STAGING_NAMESPACE} --context ${STAGING_CONTEXT} -l 'app.kubernetes.io/name=front-worker-components' --tail=0"
alias logpreprod="stern -l 'app.kubernetes.io/name=api' -n front-preprod --tail=0"
alias tail-slow-logs='npm run ts-node:transpile-only ./elasticsearch/slowlogs/tail.ts --prefix ~/workspace/front-infra/scripts/get_es_full_slow_logs.js'
alias top-slow-logs='npm run ts-node:transpile-only ./elasticsearch/slowlogs/top.ts --prefix ~/workspace/front-infra/scripts/get_es_full_slow_logs.js'

alias logboth="/Users/robertchung/.config/tmux-log-staging.sh"

function staging_get_pod() {
  kubectl get pod --context "${STAGING_CONTEXT}" -n "${STAGING_NAMESPACE}" -l "$1" -o jsonpath='{.items[0].metadata.name}'
}

function execute_on_staging() {
  kubectl exec --context "${STAGING_CONTEXT}" -n "${STAGING_NAMESPACE}" -it $(kubectl get pod -n "${STAGING_NAMESPACE}" --context "${STAGING_CONTEXT}" -l "$1" -o jsonpath='{.items[0].metadata.name}') -- env COLUMNS=$COLUMNS LINES=$LINES ${*:2}
}

alias bash-exposed="execute_on_staging app.kubernetes.io/name=front-exposed-components bash"
alias bash-worker="execute_on_staging app.kubernetes.io/name=front-worker-components bash"
# This alias makes things load slowly
# alias bash-preprod="kubectl exec -it -n front-preprod $(kubectl get pod -l "app.kubernetes.io/name=api" -o jsonpath='{.items[0].metadata.name}' --field-selector=status.phase=Running -n front-preprod) -- bash"
alias restart-exposed="execute_on_staging app.kubernetes.io/name=front-exposed-components front-reload"
alias restart-worker="execute_on_staging app.kubernetes.io/name=front-worker-components front-reload"
alias restart-both="restart-exposed && restart-worker"

alias staging-debug-workers="staging_debug worker"
alias staging-debug-exposed="staging_debug exposed"

alias pf-sql="kubectl --context "${STAGING_CONTEXT}" port-forward deployment/mysql 3306"
alias pf-search-light="kubectl port-forward --context "${STAGING_CONTEXT}" -n search statefulset/es-light-7-cluster 9200"
alias pf-search-full="kubectl port-forward --context "${STAGING_CONTEXT}" -n search statefulset/es-full-cluster 9200"
alias pf-analytics="kubectl port-forward --context "${STAGING_CONTEXT}" -n search statefulset/es-analytics-cluster 9200"
alias run-kibana="docker run -p 5601:5601 -e 'ELASTICSEARCH_HOSTS=http://host.docker.internal:9200' docker.elastic.co/kibana/kibana:$(curl localhost:9200 --silent | jq '.version.number' -r)"


alias boga="node ~/workspace/front-infra/scripts/boga.js"

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
   macos
   python
   zsh-syntax-highlighting
   zsh-autosuggestions
   fnm
)

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/robertchung/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/robertchung/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/robertchung/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/robertchung/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/llvm/bin:$PATH"
