export ZSH=/home/app/.oh-my-zsh

ZSH_THEME="agnoster"

umask 022

export EDITOR="nano"
export DEFAULT_USER="nop" # for agnoster

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  symfony2
  composer
)

source $ZSH/oh-my-zsh.sh
