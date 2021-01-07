"forget about vi
set nocompatible

"install plug if not already here
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"do plugin install
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/junegunn/seoul256.vim.git'
Plug 'git@github.com:vim-airline/vim-airline.git'
Plug 'git@github.com:preservim/nerdtree.git'
"end plugin install, this automatically executes filetype on/off
call plug#end()


"good tabs
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set autoindent

"set leader key for easier shortcuts
let mapleader = ","

" faster saves and exiting
map <Leader>w :w<cr>
map <Leader>q :q<cr>
map <Leader>wq :wq<cr>

" faster splits and switching
map <Leader>l <C-W><C-L>
map <Leader>h <C-W><C-H>
map <Leader>j <C-W><C-J>
map <Leader>k <C-W><C-K>
set splitright
set splitbelow
map <Leader>L :vsp<cr>
map <Leader>J :split<cr>

" better than esc
inoremap jk <esc>

" faster scrolling, original J and K were kinda useless anyway
noremap J 3j
noremap K 3k

set scrolloff=999

" status bar
set showmode
set showcmd

" hybrid line numbering
set number relativenumber

" SEOUL256 OPTIONS
let g:seoul256_background = 233
colo seoul256
"/SEOUL256 OPTIONS

" NERDTREE OPTIONS
" auto nerdtree if entering dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" open nerdtree
map <Leader>nn :NERDTreeToggle<cr>
"/NERDTREE OPTIONS


" cursor line and cursor column
set cul cuc

" show a line at 80 chars
set colorcolumn=80

" terminal commands
tnoremap jk <C-\><C-n>
set t_ut=""
