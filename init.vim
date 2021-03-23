call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
Plug 'xero/sourcerer.vim'
call plug#end()

set autoread

colorscheme gruvbox
set background=dark

set hidden

" Do not display modes on bottom row
set noshowmode

set splitright

" Do not keep any history
set nobackup
set nowb
set noswapfile

set number
set relativenumber
set termguicolors

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

let mapleader=","

nnoremap <c-p> :Files<cr>

" Default options are --nogroup --column --color
" Alias for --literal (fixed-strings) for compatibility with grep.
let s:ag_options = ' -F '

command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \   <q-args>,
    \   s:ag_options,
    \  <bang>0)

nnoremap <c-f> :Ag<space>

" FZF search word under cursor with AG
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

"let g:gruvbox_contrast_dark='soft'
let g:airline_theme='badwolf'

"PHP CS Fixer by php-cs-fixer
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <Leader>S <esc>:w<cr>:Silent php-cs-fixer fix %:p --rules=@PSR2<cr>

"PHP CS Fixer by ALE
let g:ale_php_phpcs_executable='/usr/local/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='/usr/local/bin/php-cs-fixer'
let g:ale_fixers = {'php': ['php_cs_fixer']}

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

"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)

nmap <C-s> :syn sync fromstart<CR>
