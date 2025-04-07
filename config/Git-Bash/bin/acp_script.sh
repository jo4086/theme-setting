#!/bin/bash
# Git 자동 add, commit, push 스크립트

# ANSI 색상 코드 설정
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'

REDBOLD='\033[1;31m'
GREENBOLD='\033[1;32m'
YELLOWBOLD='\033[1;33m'
WHITEBOLD='\033[1;37m'
RESET='\033[0m'

# Git 저장소 여부 확인
ROOT_PATH=$(git rev-parse --show-toplevel 2>/dev/null)
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Git 저장소가 아닙니다.${RESET}"
    exit 1
fi

# 현재 날짜와 시간 가져오기 (Mac & Linux 호환)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS (BSD date)
    # DATE=$(date "+%Y-%m-%d")
    DATE=$(date "+%m-%d(%y)")
    TIME=$(date "+%Hh %Mm")
else
    # Linux (GNU date)
    DATE=$(date +"%Y-%m-%d")
    TIME=$(date +"%Hh %Mm")
fi

# 인자 처리 (파일명과 코멘트 구분)
if [[ -z "$1" && -z "$2" ]]; then
    FILE="null"
    MSG="null"
elif [[ -n "$1" && -z "$2" ]]; then
    FILE="null"
    MSG="$1"
else
    FILE="$1"
    MSG="$2"
fi

# 실행 시작
echo ""

# Git add (파일 존재 여부와 상관없이 전체 추가)
echo -e "${YELLOWBOLD}== 📌 파일 추가 중... ==${RESET}"
git add .  # 🔵 파일이 있든 없든 무조건 전체 추가!
echo -e "${GREENBOLD}✅ 파일 추가 완료!${RESET}"
echo ""

# Git commit (자동 메시지)
echo -e "${YELLOWBOLD}== 📌 커밋 진행 중... ==${RESET}"
git commit -m "Date: $DATE, $TIME / File: $FILE / Msg: $MSG"
echo -e "${GREENBOLD}✅ 커밋 완료!${RESET}"
echo ""

# Git push
echo -e "${YELLOWBOLD}== 📌 푸시 진행 중... ==${RESET}"
git push
echo -e "${GREENBOLD}✅ 푸시 완료!${RESET}"
echo ""
