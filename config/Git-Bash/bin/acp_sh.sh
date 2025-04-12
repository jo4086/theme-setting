#!/bin/bash

# 색상
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
REDBOLD='\033[1;31m'
GREENBOLD='\033[1;32m'
YELLOWBOLD='\033[1;33m'
WHITEBOLD='\033[1;37m'
RESET='\033[0m'

# Git 저장소 확인
ROOT_PATH=$(git rev-parse --show-toplevel 2>/dev/null)
if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Git 저장소가 아닙니다.${RESET}"
    exit 1
fi

# 날짜
DATE=$(date +"%Y-%m-%d")

# 인자 처리
INPUT1="$1"
INPUT2="$2"
INPUT3="$3"

# 기본값
FILE="null"
TYPE="refactor"
MSG="no message"
SHOW_FILE=true

# 인자 수에 따라 처리
if [[ -n "$INPUT1" && -n "$INPUT2" && -n "$INPUT3" ]]; then
    FILE="$INPUT1"
    TYPE="$INPUT2"
    MSG="$INPUT3"
elif [[ -n "$INPUT1" && -n "$INPUT2" ]]; then
    SHOW_FILE=false
    TYPE="$INPUT1"
    MSG="$INPUT2"
elif [[ -n "$INPUT1" ]]; then
    SHOW_FILE=false
    TYPE="refactor"
    MSG="$INPUT1"
else
    echo -e "${REDBOLD}❌ 커밋 메시지를 입력하세요.${RESET}"
    exit 1
fi

# 커밋 메시지 포맷 조립
if $SHOW_FILE; then
    COMMIT_MSG="[${DATE} | ${FILE}] ${TYPE}: ${MSG}"
else
    COMMIT_MSG="[${DATE}] ${TYPE^}: ${MSG}"  # TYPE^: 첫 글자 대문자
fi

# 로그 출력
echo ""
echo -e "${YELLOWBOLD}📦 Git 자동 커밋 실행중...${RESET}"
[[ $SHOW_FILE == true ]] && echo -e "${WHITEBOLD}▶ 파일: ${FILE}${RESET}"
echo -e "${WHITEBOLD}▶ 타입: ${TYPE}${RESET}"
echo -e "${WHITEBOLD}▶ 메시지: ${MSG}${RESET}"
echo ""

# Git 처리
echo -e "${YELLOWBOLD}== 📌 git add . ==${RESET}"
git add .
echo -e "${GREENBOLD}✅ 파일 추가 완료${RESET}"
echo ""

echo -e "${YELLOWBOLD}== 📌 git commit ==${RESET}"
git commit -m "$COMMIT_MSG"
echo -e "${GREENBOLD}✅ 커밋 완료${RESET}"
echo ""

echo -e "${YELLOWBOLD}== 📌 git push ==${RESET}"
git push
echo -e "${GREENBOLD}✅ 푸시 완료${RESET}"
echo ""

