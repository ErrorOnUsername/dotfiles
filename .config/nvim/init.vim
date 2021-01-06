set number
set relativenumber
set nowrap

set nosmd

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

syntax on

call plug#begin('~/.vim/plugged')

" Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'udalov/kotlin-vim'
Plug 'bfrg/vim-cpp-modern'

call plug#end()

set termguicolors
let ayucolor="mirage"
colorscheme ayu

let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

let g:airline_powerline_fonts=1
let g:airline_theme='deus'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

let mapleader = " "

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
