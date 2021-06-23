call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
Plug 'iamcco/diagnostic-languageserver', { 'do': 'yarn install' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vim-test/vim-test'
Plug 'praem90/nvim-phpcsf'
Plug 'nvim-lua/completion-nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

set autoread

set termguicolors
set background=dark
colorscheme gruvbox

set hidden

" Do not display modes on bottom row
set noshowmode

" Always split right by default
set splitright

" Do not keep any history
set nobackup
set nowb
set noswapfile

set number
set relativenumber

set mouse=a

set inccommand=split
set clipboard+=unnamed

let mapleader=","

let g:airline_theme='gruvbox'

nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1

"Telescope mappings
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fc <cmd>Telescope grep_string<cr>
nnoremap <c-f> <cmd>lua require('telescope.builtin').grep_string{ use_regex = true, search = vim.fn.input('Grep for > ' ) }<cr>
nnoremap <leader>d <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>wd <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
nnoremap <silent>gd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

"Compe mappings
inoremap <silent><expr> <CR> compe#confirm('<CR>')

" vim-test
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}
let g:test#preserve_screen = 1

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-v> :TestVisit<CR>

" nvim-phpcsf
let g:nvim_phpcs_config_phpcs_path = '/Users/gabriel/.composer/vendor/bin/phpcs'
let g:nvim_phpcs_config_phpcbf_path = '/Users/gabriel/.composer/vendor/bin/phpcbf'
let g:nvim_phpcs_config_phpcs_standard = 'PSR12' " or path to your ruleset phpcs.xml

nnoremap <leader>cs <cmd>:lua require'phpcs'.cs()<cr>
nnoremap <leader>cbf <cmd>:lua require'phpcs'.cbf()<cr>

" Completion setup
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.html.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.graphql.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.dockerls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.jsonls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}

lua << EOF
require'nvim-web-devicons'.setup {}
require'lspconfig'.html.setup{}
require'lspconfig'.graphql.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vuels.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.vimls.setup{}
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--fixed-strings'
    },
    prompt_position = "top",
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    winblend = 5,
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },
  }
}

require'lspconfig'.intelephense.setup{
  init_options = {
    licenceKey = "/Users/gabriel/intelephense/licence.txt",
  }
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "intelephense", "jsonls", "bashls", "vuels", "tsserver", "html", "graphql", "vimls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

EOF


