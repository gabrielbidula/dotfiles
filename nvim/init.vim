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

"comment
Plug 'numToStr/Comment.nvim'

"lsp-kind
Plug 'onsails/lspkind.nvim'

"nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

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

"completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

"graphql
Plug 'jparise/vim-graphql'
call plug#end()

"==============================================================================
" plugin configs
"==============================================================================

"nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"fzf
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:glow_use_pager = v:false

"==============================================================================
" key mappings
"==============================================================================

" telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <c-f> <cmd>lua require('telescope.builtin').grep_string{ use_regex = true, search = vim.fn.input('Grep for > ' ) }<cr>

" autoload
lua require("general") 
lua require("completion")
lua require("fileexplorer")
