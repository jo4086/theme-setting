# 주석

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
WHITE='\033[37m'

CREAMRED='\033[38;5;203m'

REDBOLD='\033[1;31m'
GREENBOLD='\033[1;32m'
YELLOWBOLD='\033[1;33m'
PROCESSSTART='\033[1;107;30m'
PROCESSEND='\033[1;40;37m'
RESET='\033[0m'

IT='\033[40;3;38;5;45m'
GREENBACK='\033[40;32m'

# ROOT_PATH=$(pwd | sed 's|/library.*||')

ROOT_PATH=$(git rev-parse --show-toplevel 2>/dev/null)

if [[ $? -ne 0 ]]; then
    echo -e "${RED}❌ Git 저장소가 아닙니다.${RESET}"
    exit 1
fi

# 스크립트 실행
echo -e "${PROCESSSTART}🚀 스크립트 실행 시작...${RESET}"

# 저장소 경로 출력
echo -e "${GREEN}현재 경로:${RESET} $ROOT_PATH\n"

# 1. git status 확인
echo -e "${YELLOWBOLD}📌 1. 스테이터스 체크중...${RESET}"

echo ""

# git status 실행
git_status=$(git status 2>&1)

if [[ $? -eq 0 ]]; then
    echo -e "${YELLOW}==Git status==${RESET}"
    in_changes_section=false
    in_untracked_section=false

    while IFS= read -r line; do
        # "Changes not staged for commit:" 섹션 진입 확인
        if [[ $line == 'Changes not staged for commit:'* ]]; then
            in_changes_section=true
            in_untracked_section=false
            echo -e "${YELLOW}$line${RESET}"  # 노란색으로 섹션 제목 출력
            continue
        fi

        # "Untracked files:" 섹션 진입 확인
        if [[ $line == 'Untracked files:'* ]]; then
            in_untracked_section=true
            in_changes_section=false
            echo -e "${YELLOW}$line${RESET}"  # 노란색으로 섹션 제목 출력
            continue
        fi

        # 공백 줄을 만나면 섹션 종료
        if [[ -z $line ]]; then
            in_changes_section=false
            in_untracked_section=false
            echo ""
            continue
        fi

        # "Changes not staged for commit:" 섹션에서 "modified:"만 강조
        if $in_changes_section; then
            if [[ $line == *'modified:'* ]]; then
                echo -e "${CREAMRED}$line${RESET}"  # 붉은색 강조
            else
                echo -e "${RESET}$line"  # 기본 색상 출력
            fi
            continue
        fi

        # "Untracked files:" 섹션에서 파일 정보만 강조
        if $in_untracked_section; then
            if [[ $line == '  (use '* ]]; then
                echo -e "${RESET}$line"  # 설명 줄은 기본 색상
            else
                echo -e "${CREAMRED}$line${RESET}"  # 파일 정보 강조
            fi
            continue
        fi

        # 기타 기본 출력
        echo -e "${RESET}$line"
    done <<< "$git_status"
else
    echo -e "${RED}Error running git status:${RESET}"
    echo -e "${RED}$git_status${RESET}"
fi
echo -e "${GREENBOLD}✅ 스테이터스 체크 완료!${RESET}"
echo ""

# 2. git branch 확인
echo -e "${YELLOWBOLD}📌 2. 브런치 체크중...${RESET}"
git branch -a
echo -e "${GREENBOLD}✅ 브런치 체크 완료!${RESET}"
echo ""

# 3. develop 깃풀
echo -e "${YELLOWBOLD}📌 3. 깃풀 진행중...${RESET}"
git pull
echo -e "${GREENBOLD}✅ 깃풀 완료!${RESET}"

echo -e "${PROCESSEND}🏁 스크립트 실행 완료!${RESET}"
