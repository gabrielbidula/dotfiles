" #############################################################################
" #  Plugins install                                                          #
" #                                                                           #
" #                                                                           #
" #  Start                                                                    #
" ############################################################################# 

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vim-test/vim-test'
Plug 'praem90/nvim-phpcsf'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'creativenull/diagnosticls-configs-nvim'
Plug 'sbdchd/neoformat'
Plug 'jparise/vim-graphql'

" nvim-cmp - start
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" nvim-cmp - end
call plug#end()

" #############################################################################
" #  Plugins install                                                          #
" #                                                                           #
" #                                                                           #
" #  End                                                                      #
" ############################################################################# 

" #############################################################################
" #  Vim general setup                                                        #
" #                                                                           #
" #                                                                           #
" #  Start                                                                    #
" #############################################################################

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
set completeopt=menuone,noinsert,noselect
set cmdheight=1
set termguicolors
set background=dark

" #############################################################################
" #  Vim general setup                                                        #
" #                                                                           #
" #                                                                           #
" #  End                                                                      #
" ############################################################################# 

" #############################################################################
" #  Plugins general setup                                                    #
" #                                                                           #
" #                                                                           #
" #  Start                                                                    #
" ############################################################################# 

" nerdtree
let NERDTreeShowHidden=1

" vim-test
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}
let g:test#preserve_screen = 1

" #############################################################################
" #  Plugins general setup                                                    #
" #                                                                           #
" #                                                                           #
" #  End                                                                      #
" ############################################################################# 

" #############################################################################
" #  Mappings                                                                 #
" #                                                                           #
" #                                                                           #
" #  Start                                                                    #
" ############################################################################# 

" nerdtree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>

" telescope
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>lg <cmd>Telescope live_grep<cr>
nnoremap <leader>gc <cmd>Telescope grep_string<cr>
nnoremap <c-f> <cmd>lua require('telescope.builtin').grep_string{ use_regex = true, search = vim.fn.input('Grep for > ' ) }<cr>
nnoremap <leader>dd <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>wd <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>rf <cmd>Telescope lsp_references<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>
nnoremap <silent>gd <cmd> Telescope lsp_definitions<cr>

" vim-test
"nmap <silent> t<C-n> :TestNearest<CR>
"nmap <silent> t<C-f> :TestFile<CR>
"nmap <silent> t<C-s> :TestSuite<CR>
"nmap <silent> t<C-l> :TestLast<CR>
"nmap <silent> t<C-v> :TestVisit<CR>

" #############################################################################
" #  Mappings                                                                 #
" #                                                                           #
" #                                                                           #
" #  End                                                                      #
" ############################################################################# 

" #############################################################################
" #  Lua based plugins setup                                                  #
" #                                                                           #
" #                                                                           #
" #  Start                                                                    #
" ############################################################################# 

lua << EOF
require'nvim-web-devicons'.setup{}

require('lualine').setup{
  options = {
    theme = 'gruvbox'
  }
}

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
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    winblend = 5,
    layout_config = {
      preview_cutoff = 40,
      prompt_position = "top",
      horizontal = {
        width = {padding = 0.1},
        height = {padding = 0.1},
        preview_width = 0.6,
      },
      vertical = {
        width = {padding = 0.05},
        height = {padding = 1},
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

--require'lspconfig'.phpactor.setup{}

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<leader>df", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

--local servers = { "intelephense", "jsonls", "bashls", "vuels", "tsserver", "html", "graphql", "vimls", "yamlls", "dockerls" }
--for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup { on_attach = on_attach }
--end

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  },
}

local phpcs = require('diagnosticls-configs.linters.phpcs')
phpcs = vim.tbl_extend('force', phpcs, {
  args = {'--report=emacs', '-s', '-'}
})

local phpstan = require('diagnosticls-configs.linters.phpstan')

require 'diagnosticls-configs'.setup {
  ['php'] = {
    linter = phpcs,
  },
}

 -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['jsonls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['bashls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['vuels'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['graphql'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['vimls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['yamlls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['dockerls'].setup {
    capabilities = capabilities
  }

require('lualine').setup{
  options = {
    theme = 'nightfox'
  }
}

local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nordfox", -- change the colorscheme to use nordfox
  styles = {
    comments = "italic", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold" -- styles can be a comma separated list
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
EOF

" #############################################################################
" #  Lua based plugins setup                                                  #
" #                                                                           #
" #                                                                           #
" #  End                                                                      #
" ############################################################################# 

