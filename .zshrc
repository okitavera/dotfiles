# grmlzshrc

EDITOR="vim"
COMPDUMPFILE=$HOME/.cache/.zsh_compdump

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setup zsh
zstyle ':completion:*' insert-tab false
zstyle ':prompt:grml:left:setup' items host
zstyle ':prompt:grml:right:setup' items
zstyle ':prompt:grml:left:items:host' pre  '%F{red}'
zstyle ':prompt:grml:left:items:host' post '%f~ '

export EDITOR VISUAL="${EDITOR}"
export COMPDUMPFILE
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.profile 
source $HOME/.aliases
