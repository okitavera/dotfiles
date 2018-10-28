# powered by grml-zsh configuration framework

EDITOR="vim"
COMPDUMPFILE=$HOME/.cache/.zsh_compdump
ZSHIGHLIGHT=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setup zsh
zstyle ':completion:*' insert-tab false
zstyle ':prompt:grml:left:setup' items user
zstyle ':prompt:grml:right:setup' items
zstyle ':prompt:grml:left:items:user' pre  '%B%F{blue}'
zstyle ':prompt:grml:left:items:user' post '%f do%b : '

export EDITOR VISUAL="$EDITOR"
export COMPDUMPFILE

[[ -f "$ZSHIGHLIGHT" ]] && source $ZSHIGHLIGHT
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

(cat ~/.cache/wal/sequences &)
