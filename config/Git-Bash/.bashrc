PS1='\[\e[3m\]\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[38;5;41m\]\u@\h \[\033[0;3;33m\]\w\[\033[0m\]\n\[\e[3m\]$ \[\e[0m\]'

# PS1='\[\e[3m\]\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[1;38;5;35m\]\u@\h \[\033[0;3;38;5;204m\]MINGW64 \[\033[33m\]\w\[\033[0m\]\n\[\e[3m\]$ \[\e[0m\]'

bind '"\e[3m": self-insert'

# ◆ alias
# ◇ script
# alias ls='ls -lsh'
alias tree='tree.sh'
alias tree-d='tree_depth2.sh'
alias tree-a='tree_all.sh'


alias acp='acp_sh.sh'
alias sbp='sbp_script.sh'

# ◇ git
alias add='git add .'
alias commit='git commit -m '
alias push='git push'
alias pull='git pull'
alias status='git status'

# ◇ npm & yarn
alias nS='npm start'
alias nI='npm install '
alias yA='yarn add '
alias yC='yarn create react-app '
alias yI='yarn install'

alias mD='mkdir '
alias tC='touch '

alias sync='./sync_submodules.sh'

alias py='python'

alias ras='ssh rice-pi4@172.30.1.85'

export PATH="$HOME/bin:$PATH"

v() {
    case "$1" in
        bs) command vim ~/.bashrc ;;  # `vim bs` → `vim ~/.bashrc`
        vm) command vim ~/.vimrc ;;  # `vim vm` → `vim ~/.vimrc`
        *) command vim "$@" ;;       # 일반적인 vim 사용
    esac
}

src() {
    case "$1" in
        bs) . ~/.bashrc ;;  # `source bs` → `source ~/.bashrc`
        vm) command source ~/.vimr ;;   # `source vm` → `source ~/.vimrc`
        *) . "$@" ;;        # 일반적인 source 사용
    esac
}

c() {
    case "$1" in
        bs) command cat ~/.bashrc ;;
        vm) command cat ~/.vimrc ;;
        *) command cat "$@" ;;
    esac
}

# function run_scripts {
#     # 첫 번째 스크립트 (idea에서 실행)
#     ./check_safe_repos.sh && ./check_submodules.sh

#     # 두 번째 스크립트 (idea/library/propStyling에서 실행)
#     cd library/propStyling && ./check_submodule.sh &

#     # 기다리기 (백그라운드에서 실행되는 작업들이 모두 끝날 때까지 기다림)
#     wait
# } 

# eval "$(oh-my-posh init bash)"
