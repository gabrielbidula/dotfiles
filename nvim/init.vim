call plug#begin()
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Include Phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

" Require ncm2 and this plugin
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'

Plug 'tpope/vim-fugitive'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'

Plug 'jremmen/vim-ripgrep'
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

let mapleader=","

nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>


autocmd FileType php setlocal omnifunc=phpactor#Complete

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>g :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>h :call phpactor#Hover()<CR>

" FZF search word under cursor with AG
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

let g:gruvbox_contrast_dark='soft'
let g:airline_theme='badwolf'
