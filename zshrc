# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(lol osx ruby battery github sublime history)

for file in ~/dotfiles/bash_{functions,aliases,secrets}; do
	[ -r "$file" ] && source "$file"
done

ulimit -n 2048

source $ZSH/oh-my-zsh.sh

# Disable autocorrect for arguments, but enable it for commands.
unsetopt correct_all
setopt correct

# Change to a directory just by typing its name.
setopt autocd

# Use more powerful globbing
setopt extended_glob

# zmv is a pattern-based file renaming module.
autoload -U zmv

# make sure ctrl-s saves stuff in vim
ttyctl -f

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    bg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z

bindkey '^Z' fancy-ctrl-z

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
bindkey -M viins 'jj' vi-cmd-mode

export LESSOPEN="| /usr/local/Cellar/source-highlight/3.1.7/bin/src-hilite-lesspipe.sh %s"
export LESS=' -RFX '

[[ -s "$HOME/.z.sh" ]] && source "$HOME/.z.sh"


[[ -e $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]] && source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')


# MAMP Madness (should really clean this up)
export PATH=/Applications/MAMP/bin/php/php5.5.3/bin/pear:/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php5.5.3/bin:$PATH

# Standard and System binaries
PATH+=:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin

# XCode build tools
PATH=/Developer/usr/bin:$PATH

# Pythonbrew
PATH+=:~/.pythonbrew/bin

# MacPorts
PATH+=:/opt/local/bin:/opt/local/sbin

# X11 ? Do I even use X11?
PATH+=:/usr/X11/bin:$HOME/pear/bin

# rvm
PATH+=:$HOME/.rvm/gems/ruby-1.9.2-p320/bin:$HOME/.rvm/gems/ruby-1.9.3-p194/bin
PATH+=:$HOME/.rvm/bin

# Will begin moving there into better spot at somepoint~
PATH+=:$HOME/bin:$HOME/dotfiles

# Add in the command
PATH+=:$HOME/bin/prox
PATH+=:$HOME/bin/wp-cli/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
