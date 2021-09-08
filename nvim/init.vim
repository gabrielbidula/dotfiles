"=================================================================================
"general
"=================================================================================

let mapleader=","

filetype on
filetype plugin indent on

set encoding=UTF-8
set autoindent
set copyindent
set autoread
set hidden
set noshowmode
set splitright
set nobackup
set nowb
set noswapfile
set number
set relativenumber
set mouse=a
set inccommand=split
set clipboard+=unnamed
set completeopt=menu,menuone,noselect
set cmdheight=1
set termguicolors
set background=dark

"==================================================================================
"plugins
"==================================================================================

call plug#begin()
"colorscheme
Plug 'EdenEast/nightfox.nvim'
Plug 'gruvbox-community/gruvbox'

"nerdtree stuff
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"language packs
Plug 'sheerun/vim-polyglot'

"native lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

"git diff markers
Plug 'airblade/vim-gitgutter'

"git details
Plug 'tpope/vim-fugitive'

"devicons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

"telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"lualine
Plug 'hoob3rt/lualine.nvim'

"treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"lsp autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"graphql
Plug 'jparise/vim-graphql'
call plug#end()

"==============================================================================
" plugin configs
"==============================================================================

" nerdtree
let NERDTreeShowHidden=1

"fzf
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:glow_use_pager = v:false

"==============================================================================
" key mappings
"==============================================================================

" nerdtree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>

" telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-f> <cmd>lua require('telescope.builtin').grep_string{ use_regex = true, search = vim.fn.input('Grep for > ' ) }<cr>

" autoload
lua require("general") 
lua require("completion")
