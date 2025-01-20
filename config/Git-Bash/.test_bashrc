PS1='\[\e[3m\]\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[38;5;204m\]MINGW64 \[\033[33m\]\w\[\033[0m\]\n\[\e[3m\]$ \[\e[0m\]'

bind '"\e[3m": self-insert'

alias snb='cd /c/project/node_class/ch05/sns-api'
alias snf='cd /c/project/node_class/ch05/sns-frontend/src'

alias snfap='vim /c/project/node_class/ch05/sns-frontend/src/App.js'
alias snbap='vim /c/project/node_class/ch05/sns-api/app.js'

alias ls='ls -lsh'
alias bdf='cd /c/project/board/board-frontend/src'
alias bdb='cd /c/project/board/board-api'

alias bdfapp='vim /c/project/board/board-frontend/src/App.js'
alias bdbapp='vim /c/project/board/board-api/app.js'

alias mkf='cd /c/project/personal-project/full_stack/market/market_front/src'
alias mkb='cd /c/project/personal-project/full_stack/market/market_api'

alias project='cd /c/project'
alias pp='cd /c/project/personal-project'

alias g-ad='git add .'
alias g-cm='git commit -m '
alias g-ps='git push'
alias g-pl='git pull'
alias g-st='git status'

alias nS='npm start'
alias nI='npm install '
alias yA='yarn add '
alias yC='yarn create react-app '
alias yI='yarn install'

alias mD='mkdir '
alias tC='touch '

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

cat() {
    case "$1" in
        bs) command cat ~/.bashrc ;;
        vm) command cat ~/.vimrc ;;
        *) command cat "$@" ;;
    esac
}
