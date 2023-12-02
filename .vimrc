set wildmenu
set wildmode=full
set history=200
set laststatus=2
set number relativenumber
let mapleader = "\<Space>"

nmap H b
nmap L w

inoremap jk <esc>

" VIM plugins 
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'
call plug#end()
