export EDITOR="vim"
export ZPLUG_HOME=$HOME/.zplug

[[ ! -f $ZPLUG_HOME/init.zsh ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# for speed debug
# zplug "paulmelnikow/zsh-startup-timer"
zplug "b4b4r07/ultimate", as:theme
zplug "hlissner/zsh-autopair", defer:2
zplug 'zdharma/fast-syntax-highlighting', defer:2, hook-load:'FAST_HIGHLIGHT=()'
zplug check || zplug install
zplug load

blanktab() { [[ $#BUFFER == 0 ]] && CURSOR=3 zle list-choices || zle expand-or-complete }
zle -N blanktab && bindkey '^I' blanktab
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
(cat ~/.cache/wal/sequences &)
