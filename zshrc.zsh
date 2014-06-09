# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="idej"

# Disable weekly update checks
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting of terminal title
DISABLE_AUTO_TITLE="true"

# set alias for correct colors in vim on ubuntu
alias tmux="TERM=xterm-256color tmux"

# Which plugins would you like to load? Plugins can be found in:
#   ~/.oh-my-zsh/plugins/*
#
# Custom plugins may be added to:
#   ~/.oh-my-zsh/custom/plugins/
#
# Example format:
#   plugins=(rails git textmate ruby)
plugins=(git rvm)

source $ZSH/oh-my-zsh.sh

# Disable auto-correct
unsetopt correct_all

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t hack || tmux new -s hack; exit
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
