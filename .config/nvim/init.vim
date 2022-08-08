set number
set relativenumber
set nowrap

set nosmd
set noswapfile

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set background=dark
syntax on

call plug#begin('~/.vim/plugged')

Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim'

" Custom archimedes highlighting
Plug '~/dev/amds/editors/nvim'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
let g:gruvbox_material_diagnostic_text_highlight='1'
let g:gruvbox_material_diagnostic_virtual_text='colored'

colorscheme palenight

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

set completeopt=menuone,noinsert,noselect

let g:coq_settings = { 'display.icons.mode': 'none', 'keymap.jump_to_mark': '' }

lua <<EOF
local nvim_lsp = require('lspconfig')
local coq      = require('coq')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
		on_attach = on_attach,
		flags = { debounce_text_changes = 150, }
	}))
end

require'nvim-treesitter.configs'.setup { highlight = { enable = true, } }
EOF

let mapleader = " "

:COQnow --shut-up

nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

function! MakeScratchBuffer()
	vsplit
	try
		b \*scratch\*
	catch
		noswapfile hide enew
		setlocal buftype=nofile
		setlocal bufhidden=hide
		setlocal noswapfile
		file *scratch*
	endtry
endfunction

nnoremap <Leader>s :call MakeScratchBuffer()<CR>
