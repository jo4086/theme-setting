#!/bin/bash

source ~/.bashrc

# [1] githooks 폴더에 prepare-commit-msg 파일 권한 주기
if [ -f ~/.githooks/prepare-commit-msg ]; then
  chmod +x ~/.githooks/prepare-commit-msg
  echo "✅ prepare-commit-msg 권한 부여 완료"
else
  echo "⚠️ prepare-commit-msg 파일이 없습니다"
fi

# [2] git config로 훅 경로 설정
git config --global core.hooksPath ~/.githooks
echo "✅ git core.hooksPath 설정 완료"

# [3] vim-plug 설치
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "✅ vim-plug 설치 완료"
else
  echo "⚠️ vim-plug가 이미 설치되어 있습니다"
fi

# [4] vimrc에 따라 플러그인 설치
if [ -f ~/.vimrc ]; then
  vim +PlugInstall +qall
  echo "✅ vim 플러그인 설치 완료"
else
  echo "⚠️ ~/.vimrc 파일이 없습니다"
fi

echo ""
echo "🎉 Git 환경 설정 및 vim 플러그인 설치 완료!"

