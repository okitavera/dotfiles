set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'

call plug#end()


filetype plugin indent on

syntax on
set t_Co=256

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

set laststatus=2
set encoding=utf8
set noshowmode
set wildmenu
set backspace=2
set visualbell
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set ttyfast
set mouse=a
set list listchars=tab:»·,trail:·,nbsp:·
set number
set cursorline

colorscheme base16-default-dark
hi EndOfBuffer ctermfg=BG
hi LineNr term=bold cterm=NONE ctermfg=FG ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=235
hi CursorLineNR cterm=NONE ctermbg=235 ctermfg=FG
let &t_SI = "\<Esc>[5 q"

