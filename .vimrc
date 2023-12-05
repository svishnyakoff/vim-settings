let mapleader = "\<Space>"
let g:highlightedyank_highlight_duration = 500

" ============== Custom options ===================
set wildmenu
set wildmode=full
set history=200
set laststatus=2
set number relativenumber

" ============== Custom mapppings ===================
inoremap jk <esc>

" Scroll the screen using 10 lines intervals
nnoremap <C-u> 10<C-y>
nnoremap <C-d> 10<C-e>

nmap s <Plug>(easymotion-s)

nmap H b
nmap L w

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
call plug#end()
