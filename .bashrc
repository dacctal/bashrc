#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="\e[0;33m\W\e[0m > "

fastfetch

# my aliases
alias nv='nvim'
alias ls='eza --icons=always'
alias grep='grep --color=auto'
alias scsh='grim -g "$(slurp)" - | wl-copy'
alias ff='fastfetch'
alias dark='sudo ddcutil setvcp 10 5 --display 2 & sudo ddcutil setvcp 10 5 --display 1;'
alias bright='sudo ddcutil setvcp 10 100 --display 2 & sudo ddcutil setvcp 10 100 --display 1;'
alias kys='exit'

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
