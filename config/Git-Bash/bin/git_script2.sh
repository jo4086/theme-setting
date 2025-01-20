if [[ $? -eq 0 ]]; then
    echo -e "${GREENBOLD}Git status output:${RESET}"
    # git_status 출력 중 'modified:'가 포함된 줄은 붉은색으로 강조
    while IFS= read -r line; do
        if [[ $line == *"modified:"* ]]; then
            echo -e "${RED}$line${RESET}"
        else
            echo -e "${RESET}$line"
        fi
    done <<< "$git_status"
else
    echo -e "${RED}Error running git status:${RESET}"
    echo -e "${WHITEBOLD}$git_status${RESET}"
fi

# 저장소 경로 출력
echo -e "${YELLOWBOLD}2. Current Repository Path:${RESET}"
echo -e "${WHITEBOLD}$ROOT_PATH${RESET}"


# 성공 여부에 따라 출력
# if [[ $? -eq 0 ]]; then
#     echo -e "${GREEN}Git status output:${RESET}"
#     in_untracked_section=false

#     # git_status 출력 한 줄씩 처리
#     while IFS= read -r line; do
#         # 'use "git add <file>' 줄 발견 시 플래그 설정
#         if [[ $line == *'use "git add <file>'* ]]; then
#             in_untracked_section=true
#             echo -e "${YELLOW}$line${RESET}"  # 노란색으로 강조
#             continue
#         fi

#         # Untracked 파일 섹션에 있는 파일명은 빨간색으로 출력
#         if $in_untracked_section; then
#             # Untracked 파일이 끝나는 빈 줄을 만나면 섹션 종료
#             if [[ -z $line ]]; then
#                 in_untracked_section=false
#             else
#                 echo -e "${RED}$line${RESET}"
#                 continue
#             fi
#         fi

#         # 기본 출력 처리
#         echo -e "${RESET}$line"
#     done <<< "$git_status"
# else
#     echo -e "${RED}Error running git status:${RESET}"
#     echo -e "${RED}$git_status${RESET}"
# fi

# if [[ $? -eq 0 ]]; then
#     echo -e "${GREENBOLD}Git status output:${RESET}"
#     # git_status 출력 중 'modified:'가 포함된 줄은 붉은색으로 강조
#     while IFS= read -r line; do
#         if [[ $line == *"modified:"* ]]; then
#             echo -e "${RED}$line${RESET}"
#         else
#             echo -e "${RESET}$line"
#         fi
#     done <<< "$git_status"
# else
#     echo -e "${RED}Error running git status:${RESET}"
#     echo -e "${WHITEBOLD}$git_status${RESET}"
# fi

# # 저장소 경로 출력
# echo -e "${YELLOWBOLD}2. Current Repository Path:${RESET}"
# echo -e "${WHITEBOLD}$ROOT_PATH${RESET}"