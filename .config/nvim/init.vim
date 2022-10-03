" Enable 24-bit colors
set termguicolors

" Indentation settings for using spaces instead of tabs
set tabstop=4
set shiftwidth=0
set expandtab

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Enable use of the mouse for all modes
set mouse=a

" Use system clipboard
set clipboard=unnamedplus

" Display line numbers on the left relative to cursor
set number relativenumber

" Do not wrap lines when displaying text
set nowrap

set scrolloff=1
set sidescrolloff=5

" Highlight columns
set colorcolumn=81

" Better command-line completion
set wildmode=list:full

" Open new split panes to the right and bottom
set splitright
set splitbelow

" Load vim-plug
call plug#begin()

Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'inkarkat/vim-ShowTrailingWhitespace', { 'branch': 'stable' }

call plug#end()

let g:seoul256_srgb = 1
let g:seoul256_background = 234
colo seoul256

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }

" Key Remap

nnoremap <space> <nop>
let mapleader=" "

nnoremap <leader>h <C-w>s
nnoremap <leader>v <C-w>v
nnoremap <leader>w <C-w><up>
nnoremap <leader>a <C-w><left>
nnoremap <leader>s <C-w><down>
nnoremap <leader>d <C-w><right>

nnoremap <leader>l :noh<CR>
nnoremap <leader>b :NERDTreeToggle<CR>
