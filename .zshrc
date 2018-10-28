export EDITOR="vim"
export ZPLUG_HOME=$HOME/.zplug

[[ ! -f $ZPLUG_HOME/init.zsh ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# --- Plugins ---
# zplug self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# for speed debug
# zplug "paulmelnikow/zsh-startup-timer"

# minimal theme
MNML_USER_CHAR=$USER
MNML_INSERT_CHAR='do:'
zplug 'subnixr/minimal', use:minimal.zsh, as:theme

# autopair like a text-editor
zplug 'hlissner/zsh-autopair', defer:2

# another eyecandy
zplug 'zdharma/fast-syntax-highlighting', defer:2, hook-load:'FAST_HIGHLIGHT=()'

zplug check || zplug install
zplug load

blanktab() { [[ $#BUFFER == 0 ]] && CURSOR=3 zle list-choices || zle expand-or-complete }
zle -N blanktab && bindkey '^I' blanktab
zstyle ':completion:*' menu select

[[ -f $HOME/.aliases ]] && source $HOME/.aliases
(cat ~/.cache/wal/sequences &)
