#!/bin/bash

# 색상 정의
BLUE="\033[1;34m"
RESET="\033[0m"

# 무시할 폴더 목록
IGNORE_DIRS=("node_modules" "dist")

# 확장자별 이모지
get_emoji_for_file() {
  case "$1" in
    *.js|*.jsx) echo "📜" ;;
    *.ts)       echo "📘" ;;
    *.json)     echo "🧾" ;;
    *.md)       echo "📖" ;;
    *)          echo "🧾" ;;
  esac
}

# 재귀 출력 함수
print_tree() {
  local current_dir="$1"
  local indent="$2"

  local entries
  entries=$(ls -1F "$current_dir" 2>/dev/null | sort)

  while IFS= read -r entry; do
    local clean_entry="${entry%/}"
    local full_path="$current_dir/$clean_entry"

    if [[ "$entry" == */ ]]; then
      if [[ " ${IGNORE_DIRS[*]} " == *" $clean_entry "* ]]; then
        echo -e "${indent}📁${BLUE}${clean_entry}/${RESET}"
        continue
      fi
      echo -e "${indent}📁${BLUE}${clean_entry}/${RESET}"
      print_tree "$full_path" "  $indent"
    else
      local emoji
      emoji=$(get_emoji_for_file "$entry")
      echo -e "${indent}${emoji}$clean_entry"
    fi
  done <<< "$entries"
}

# 시작점
start_dir="$(pwd)"
root_name=$(basename "$start_dir")

# 루트 표시
echo -e "📁${BLUE}./$root_name${RESET}"

# 루트 내부 항목 처리
for entry in "$start_dir"/*; do
  base=$(basename "$entry")

  if [[ -d "$entry" ]]; then
    if [[ " ${IGNORE_DIRS[*]} " == *" $base "* ]]; then
      echo -e "  📁${BLUE}$base/${RESET}"
      continue
    fi
    echo -e "  📁${BLUE}$base/${RESET}"
    print_tree "$entry" "    "
  elif [[ -f "$entry" ]]; then
    emoji=$(get_emoji_for_file "$base")
    echo -e "  ${emoji}${base}"
  fi
done
