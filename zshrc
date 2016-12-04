#--------------------
# visual and general
#--------------------
autoload colors; colors

# colors for `ls` output
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

unsetopt beep

# prompt format
PROMPT='[%F{yellow}%~%f]%% '
RPROMPT=[%F{yellow}%T%f]


#--------------------
# alias
#--------------------
alias l="ls -lhF"
alias ll="ls -alhF"
alias c="clear"


#--------------------
# auto-complete
#--------------------
zstyle :compinstall filename '/Users/yxz/.zshrc'

autoload -Uz compinit
compinit

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'


#--------------------
# history
#--------------------
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
