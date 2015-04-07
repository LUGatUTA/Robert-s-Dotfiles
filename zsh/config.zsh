export EDITOR=vim

# Command completion
autoload -Uz compinit promptinit colors
compinit
promptinit
colors

# Color prompt
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Autocompletion of command line switches for aliases
setopt completealiases

# Do not put duplicate lines in the history
setopt hist_ignore_dups

# Enable help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

# Persistent rehash
setopt nohashdirs

# Colored less output
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

# Control-x-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Powerline theme config
POWERLINE_RIGHT_A="mixed"
POWERLINE_DETECT_SSH="true" 

# CCache to tmpfs for faster cache
export CCACHE_DIR=/tmp/ccache 
