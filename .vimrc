let mapleader = "\<space>"
let maplocalleader = "\\"
let g:highlightedyank_highlight_duration = 500

filetype plugin indent on

" ============== Custom options ===================

" Ensures that indentation made using <> commands always has width that is
" multiple of 'shiftwidth'
" https://vimtricks.com/p/ensuring-aligned-indentation/#:~:text=With%20%3Aset%20shiftround%20enabled%2C%20Vim,the%20next%20multiple%20of%20shiftwidth
set shiftround
set wrap
set incsearch
set hidden
set mouse=a
set wildmenu
set wildmode=full
set history=200
set laststatus=2
set number relativenumber
set clipboard=unnamed
set ignorecase smartcase
set nocompatible

" ============== Custom mapppings ===================
inoremap jk <esc>

" Scroll the screen using 10 lines intervals
nnoremap <C-u> 10<C-y>
nnoremap <C-d> 10<C-e>

" Mapping to execute bash commands and print output below
nnoremap <leader>xe yypV!bash
vnoremap <leader>xe yPgv!bash

" Allows to UPPERCASE words in 'normal' and 'insert' modes
" https://learnvimscriptthehardway.stevelosh.com/chapters/04.html
inoremap <localleader><c-u> <esc>viWUgi
nnoremap <localleader><c-u> viWU

nmap s <Plug>(easymotion-s)

nmap H b
nmap L w

" Allows to use %% to refer to dir name of an active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
Plug 'nelstrom/vim-visual-star-search'
call plug#end()
