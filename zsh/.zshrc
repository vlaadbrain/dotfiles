export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="vlaad"

plugins=(git themes fzf zoxide)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias df='df -h'
alias ds='du -sk ./* | sort -k1nr  | head -20'
alias grep='grep -s --color=always'
alias ldconfig='ldconfig -N'
# alias ls='ls -ShFG'
alias ls="eza --color=always --git --icons=always"
alias darkstar='ssh cjt@darkstar'
alias arpnet='ssh cjt@174.136.109.82'
alias aneurism='ssh ctorres@72.69.183.210'
alias minecraft='ssh admin@52.55.99.118'
alias spigot-v1='ssh admin@18.234.86.217'
alias listening='netstat -napt | grep LISTEN'
alias more='less'
alias ns='netstat -utn'
alias nslookup='nslookup -sil'
alias sprunge='curl -F '\''sprunge=<-'\'' http://sprunge.us'
alias telnet='TERM=vt100 nc -vz'
alias vi='nvim'
alias vim='nvim'
alias tn='tmux new-session -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'
alias jobs='jobs -l'
alias ecrLogin='eval $(aws ecr get-login --no-include-email --region us-east-1)'
alias cleanDockerImages='docker rmi $(docker images -q --filter dangling=true)'
alias ec2bastion='ssh -p 220 ctorres@ec2-3-216-164-52.compute-1.amazonaws.com'
alias ssh-add='SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ssh-add'
alias cat=batcat
alias pricecachesku='(){ node ./src/skus/index.js $1 ; }'

function devdns() {
    nslookup "$1" ns-1114.awsdns-11.org
}

function proddns() {
    nslookup "$1" ns-1114.awsdns-11.org
}

export GITHUB_TOKEN=''
export YEXT_TOKEN=${GITHUB_TOKEN}
export GIT_TOKEN=${GITHUB_TOKEN}
export NPM_TOKEN=${GITHUB_TOKEN}

# If you need to have openjdk@21 first in your PATH, run:
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="${JAVA_HOME}/bin:$PATH"

# For compilers to find openjdk@21 you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

#export PATH="/usr/local/opt/redis@4.0/bin:$PATH"
#
export PATH="$HOME/src/flutter/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
if [[ "$OSTYPE" == "freebsd"* || "$OSTYPE" == "linux-gnu"* ]]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [[ "$OSTYPE" == "darwin"* ]]; then
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi
 


# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/.fzf-git.sh/fzf-git.sh

# --- setup fzf theme ---
fg="#93a1a1"
bg="#002936"
bg_highlight="#073642"
purple="#6c71c4"
blue="#268bd2"
cyan="#2aa198"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# ---- eza config ----

export EZA_CONFIG_DIR="$HOME/.config/eza"

# ---- bat theme ----

export BAT_THEME="Solarized (dark)"

# ---- Zoxide (better cd) ----
alias cd="z"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -f $HOME/bin/op ]] &&  eval "$(op completion zsh)"; compdef _op op

# Load Angular CLI autocompletion.
source <(ng completion script)
