typeset -U path


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Paths
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} = # colorz !

# Color
alias ls='ls --color'

# Shortcuts
# Terminal
alias c="cd"
alias cb="cd .."
alias cl="clear"
alias ex="exit"
alias pls="sudo"
alias cdp="cd ~/Projects"
# Make
alias mk="make"
alias mc="make clean"
alias mt="make test"
# Vim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias v.="nvim ."
alias cn="cd ~/.config/nvim"
# Git
alias g="git"
alias gi="git init"
alias gr="git remote add origin"
alias grs="git remote set-url origin"
alias ga="git add"
alias ga.="git add ."
alias gc="git commit -m"
alias gcl="git clone"
alias gb="git branch"
alias gbm="git branch -m"
alias gs="git status"
alias gsw="git switch"
alias gst="git stash"
alias gpop="git stash pop"
alias gp="git push"
alias gl="git pull"
# zshrc
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
# Competitive Programming
alias ca="cd ~/Projects/CP-Library/"
alias va="nvim a.cpp"
# XClip Copy
alias copy="xclip -sel c < "
# Shell integrations
eval "$(fzf --zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
