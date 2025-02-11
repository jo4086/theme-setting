set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set mouse=a
set encoding=utf-8

set cursorline
set whichwrap+=<,>,h,l

" UI
set ruler
set lazyredraw
set wildmenu
syntax on
set novisualbell

" 줄바꿈 주석 생성제거
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 줄바꿈
inoremap <C-CR> <Esc>o
" 위쪽 줄바꿈
inoremap <C-S-CR> <Esc>O

" 플러그인
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

call plug#end()

" HTML/XML 태그 자동닫기
let g:closetag_filenames = '*.html,*.xhtml,*.phtml' " 적용할 파일 확장자
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'    " XHTML처럼 닫기
let g:closetag_filetypes = 'html,xhtml,phtml'       " 적용할 파일 타입
let g:closetag_emptyTags_caseSensitive = 1         " 빈 태그 닫기 설정

" ctrl+h를 백스페이스에서분리

" Insert 모드에서 Ctrl+H로 HTML 템플릿 삽입
inoremap <C-t> <Esc>:call InsertHtmlTemplate()<CR>

" HTML 템플릿 함수
function! InsertHtmlTemplate()
    call append(line('.'), [
    \ '<!DOCTYPE html>',
    \ '<html lang="ko">',
    \ '   <head>',
    \ '      <meta charset="UTF-8" />',
    \ '      <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
    \ '      <title>Document</title>',
    \ '   </head>',
    \ '   <body>',
    \ '',
    \ '   </body>',
    \ '</html>'
    \ ])
    normal! j
endfunction
