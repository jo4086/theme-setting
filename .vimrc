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

" Insert 모드에서 [ctrl + t] 로 HTML 템플릿 삽입
inoremap <C-t> <Esc>:call InsertHtmlTemplate()<CR>

" HTML 템플릿 함수
function! InsertHtmlTemplate()
    call setline(line('.'), [
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
    startinsert
endfunction

" Insert 모드 단축키 (선택사항)
inoremap <C-g> <Esc>:Docs<CR>

" Git 커밋 템플릿 삽입 함수
function! InsertGitCommitTemplate(typeText)
    " 1. 무조건 문서 최상단 1행으로 이동
    execute "normal! gg"

    " 2. 2행에 [Type] 삽입
    call append(1, '[' . a:typeText . ']')

    " 3. 3행에 '  - ' 삽입
    call append(2, '  -  ')

    " 4. 4행에 빈 줄 삽입
    call append(3, '')

    " 5. 현재 날짜 생성
    let l:today = strftime("[%Y-%m-%d]")

    " 6. 5행에 오늘 날짜 삽입
    call setline(5, l:today)

    " 7. '  - ' 줄로 이동해서 커서 세팅
    execute "normal! 1gg$"

    " 8. Insert 모드 진입
    startinsert
endfunction

" 명령어 등록
command! Docs call InsertGitCommitTemplate('Docs')
command! Test call InsertGitCommitTemplate('Test')
command! Refactor call InsertGitCommitTemplate('Refactor')
command! Fix call InsertGitCommitTemplate('Fix')
command! Feat call InsertGitCommitTemplate('Feat')
command! Design call InsertGitCommitTemplate('Design')
command! Chore call InsertGitCommitTemplate('Chore')
command! Hotfix call InsertGitCommitTemplate('!HOTFIX')
command! Rename call InsertGitCommitTemplate('Rename')
command! Remove call InsertGitCommitTemplate('Remove')
command! Comment call InsertGitCommitTemplate('Comment')
command! Break call InsertGitCommitTemplate('BREAKING CHANGE')
