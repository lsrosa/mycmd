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

" Plugins for Python Docstrings
" for plugin installation: https://github.com/junegunn/vim-plug
" Docstring installation: https://github.com/heavenshell/vim-pydocstring
" On VIM, run :Plug install(), then :Pydocstring
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Docstrings plugin
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
" Make sure you use single quotes

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

