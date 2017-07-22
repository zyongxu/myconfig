#--------------------
# visual and general
#--------------------
autoload colors; colors

# colors for `ls` output
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

unsetopt beep

# prompt format
PROMPT='[%F{cyan}%m:%f%F{yellow}%~%f]%% '
RPROMPT=' ${vcs_info_msg_0_} %F{yellow}%T%f'

# display git info
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5} %u%c]%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr 'U'
zstyle ':vcs_info:*' stagedstr 'S'


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
zstyle ':completion:*' menu select

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
