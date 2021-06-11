call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-scripts/bash-support.vim'
Plug 'fatih/vim-go'
Plug 'preservim/nerdtree'
Plug 'owickstrom/vim-colors-paramount'
Plug 'lurst/austere.vim'
Plug 'fxn/vim-monochrome'
Plug 'iamcco/diagnostic-languageserver', { 'do': 'yarn install' }
call plug#end()

set autoread

set termguicolors
set background=dark
colorscheme paramount

" Set BAT THEME
"let $BAT_THEME='base16-256'

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

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set redrawtime=10000

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let mapleader=","

" Open search for files
nnoremap <c-p> :Files<cr>

" Default options are --nogroup --column --color
" Alias for --literal (fixed-strings) for compatibility with grep.
let s:ag_options = ' -F '

command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \   <q-args>,
    \   s:ag_options,
    \  <bang>0)

" Call AG
nnoremap <c-f> :Ag<space>

" FZF search word under cursor with AG
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

"let g:gruvbox_contrast_dark='soft'
let g:airline_theme='minimalist'

" ########## Coc - Start ##########
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Open code action modal
nmap <leader>ac <Plug>(coc-codeaction)

nnoremap <silent> <leader>ac :<C-u>CocFzfList actions<CR>
nnoremap <silent> <leader>dw :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>db :<C-u>CocFzfList diagnostics --current-buf<CR>

" ########## Coc - End ##########

" Customize fzf colors to match your color scheme
"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" NerdTree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1
