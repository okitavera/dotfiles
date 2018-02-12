# grmlzshrc

EDITOR="nvim"
COMPDUMPFILE=$HOME/.cache/.zsh_compdump
NEEDS=("/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	   "${HOME}/.profile")

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $NEEDS[@]

# setup zsh
zstyle ':completion:*' insert-tab false
zstyle ':prompt:grml:left:setup' items host
zstyle ':prompt:grml:right:setup' items
zstyle ':prompt:grml:left:items:host' pre  '%F{red}'
zstyle ':prompt:grml:left:items:host' post '%f~ '

# aliases
alias ll="ls --color=auto -la"
alias lsport="sudo lsof -i"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias {ed,emacs,nano,vi,vim}="nvim"
alias :q="exit"

export EDITOR VISUAL="${EDITOR}"
export COMPDUMPFILE
