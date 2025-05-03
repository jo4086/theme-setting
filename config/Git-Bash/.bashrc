PS1='\[\e[3m\]\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[38;5;41m\]\u@\h \[\033[0;3;33m\]\w\[\033[0m\]\n\[\e[3m\]$ \[\e[0m\]'

# PS1='\[\e[3m\]\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[1;38;5;35m\]\u@\h \[\033[0;3;38;5;204m\]MINGW64 \[\033[33m\]\w\[\033[0m\]\n\[\e[3m\]$ \[\e[0m\]'
# bind '"\e[3m": self-insert'

# eval "$(oh-my-posh init bash)"
CUSTOM="$HOME/custom-bashrc"
[ -f "$CUSTOM/.env_bashrc" ]   && source "$CUSTOM/.env_bashrc"
[ -f "$CUSTOM/.fn_bashrc" ]    && source "$CUSTOM/.fn_bashrc"
[ -f "$CUSTOM/.alias_bashrc" ] && source "$CUSTOM/.alias_bashrc"
