export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

ZSH_THEME="afowler"

plugins=(git)

export ZSH="/Users/richarddavidson/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.config/nvim/init.vim"

alias gc="git commit"
alias gl="git log"
alias gs="git status"
alias gp="git push"
alias gpl="git pull"

alias scons="/usr/bin/env python3 $(which scons)"

alias axdev="cd ~/dev/axiom"
alias amdev="cd ~/dev/amds"
alias dpdev="cd ~/dev/dead-pixel/"

alias fix_taproot="rm -rf taproot && git submodule update --init --recursive"
