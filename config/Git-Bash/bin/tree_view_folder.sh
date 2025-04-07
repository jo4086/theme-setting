# 색상 정의
BLUE="\033[1;34m"
RESET="\033[0m"

# 현재 디렉토리 정보 가져오기
current_dir=$(pwd)
dir_name=$(basename "$current_dir")

# 출력 시작
echo -e "📁${BLUE}./$dir_name${RESET}"

# ls -r1F 결과 내부적으로 처리
ls_output=$(ls -r1F)

# 폴더와 파일 분리하기
directories=()
files=()

while IFS= read -r line; do
  if [[ "$line" == */ ]]; then
    # 디렉토리(끝에 / 있음)
    directories+=("${line%/}")  # / 제거
  else
    # 파일
    files+=("$line")
  fi
done <<< "$ls_output"

# 폴더와 먼저 출력
for dir in "${directories[@]}"; do
  echo -e "  📁${BLUE}$dir/${RESET}"
done

# 파일 출력
for file in "${files[@]}"; do
  echo "  🧾$file"
done

