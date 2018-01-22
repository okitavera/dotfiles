#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

color_red="\[\e[0;31m\]"
color_reset="\[\e[0m\]"
PS1="${color_red}${color_reset} \h ${color_red}${color_reset} "

# aliases
alias ls='ls --color=auto -la'
alias lsport="sudo lsof -i"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
