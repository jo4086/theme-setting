#!/bin/bash
# 주석

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'

CREAMRED='\033[38;5;203m'

REDBOLD='\033[1;31m'
GREENBOLD='\033[1;32m'
YELLOWBOLD='\033[1;33m'
WHITEBOLD='\033[1;37m'
RESET='\033[0m'

IT='\033[40;3;38;5;45m'
GREENBACK='\033[40;32m'

ROOT_PATH=$(pwd | sed 's|/library.*||')

# 현재 날짜와 시간 가져오기 (24시간 기준)
DATE=$(date +"%m-%d")
TIME=$(date +"%Hh %Mm")

# 실행 시작
echo ""

# 인자로 받은 내용 저장 (기본값: "Null")
comment="${1:-Null}"

# Git add
echo -e "${YELLOWBOLD}== 📌 파일 추가중... ==${RESET}"
git add .
echo -e "${GREENBOLD}✅ 파일 추가 완료!${RESET}"
echo ""

# Git commit (자동 메시지)
echo -e "${YELLOWBOLD}== 📌 커밋 진행중... ==${RESET}"
git commit -m "Date: $DATE / Time: $TIME / Comment: ${comment}"
echo -e "${GREENBOLD}✅ 커밋 완료!${RESET}"
echo ""

# Git push
echo -e "${YELLOWBOLD}== 📌 푸쉬 진행중... ==${RESET}"
git push
echo -e "${GREENBOLD}✅ 푸시 완료!${RESET}"
echo ""