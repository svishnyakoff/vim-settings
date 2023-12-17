let mapleader = "\<Space>"
let g:highlightedyank_highlight_duration = 500

" ============== Custom options ===================
set incsearch
set mouse=a
set wildmenu
set wildmode=full
set history=200
set laststatus=2
set number relativenumber
set clipboard=unnamed
set ignorecase smartcase

" ============== Custom mapppings ===================
inoremap jk <esc>

" Scroll the screen using 10 lines intervals
nnoremap <C-u> 10<C-y>
nnoremap <C-d> 10<C-e>

" Mapping to execute bash commands and print output below
nnoremap <leader>xe yypV!bash
vnoremap <leader>xe yPgv:!bash

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
call plug#end()
