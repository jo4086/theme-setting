" 🌟 기본 설정
set number              " 줄 번호 표시
set tabstop=4           " 탭 크기 4칸
set shiftwidth=4        " 자동 들여쓰기 크기 4칸
set expandtab           " 탭을 공백으로 변환
set autoindent          " 자동 들여쓰기
set cursorline          " 현재 줄 강조
syntax on            " 문법 강조 활성화
set encoding=utf-8

" set clipboard+=unnamedplus  " 시스템 클립보드 사용 (복사/붙여넣기 가능)

" 🔍 검색 기능 개선
set ignorecase          " 대소문자 무시
set smartcase           " 대소문자 구분 (검색어에 대문자가 포함된 경우)
set hlsearch            " 검색어 하이라이트
set incsearch           " 점진적 검색 (입력할 때마다 검색됨)

" 🚀 성능 최적화
set hidden              " 수정한 버퍼를 저장하지 않고 숨김 가능
set nobackup            " 백업 파일 생성 안 함
set nowritebackup       " 백업 파일 생성 안 함
set updatetime=300      " 커서 움직일 때 딜레이 줄이기
set shortmess+=c        " 불필요한 메시지 숨김

" 🖱️ 마우스 사용 활성화
set mouse=a             " 마우스 사용 가능하게 설정


set termguicolors    " 24비트 색상 지원
colorscheme desert   " 기본 테마 (다른 테마로 변경 가능)


" init.vim 용
function! OSC52(str)
  let len = strlen(a:str)
  let b64 = system('base64 -w0', a:str)
  let b64 = substitute(b64, '\n$', '', '')
  
  let osc52 = '\e]52;c;' . b64 . '\x07'
  " /dev/tty 대신 stderr로 출력
  call chansend(v:stderr, osc52)
  return 0
endfunction

" 플러그인 션섹
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'ojroques/vim-oscyank'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdtree'
    Plug 'preservim/tagbar'
call plug#end()

" vim-oscyank 설정
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | execute 'OSCYankReg +' | endif

" 비주얼 모드에서 Y키로 복사 (선택사항)
vnoremap Y :OSCYank<CR>
