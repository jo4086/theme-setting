EMAIL="$1"
NAME="$2"

echo "메일 입력: ${EMAIL}"

echo "네임 입력: ${NAME}"

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
