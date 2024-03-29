filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

" Cursor finding type \c to highlight current line and column
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" backspace to remove these chars as well
:set backspace=indent,eol,start

:set foldmethod=marker
:set foldmarker=#if,#endif
augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview | filetype detect
    autocmd BufWinEnter ?* silent loadview | filetype detect
augroup END

command! Untab set expandtab | %retab!
command! Tab set noexpandtab | %retab! | set expandtab 

let maplocalleader = "-"

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
inoremap ;; <Esc>

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

syntax on

