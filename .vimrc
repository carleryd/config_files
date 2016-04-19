set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" Set column line at width 80 characters
set colorcolumn=80
" highlight ColorColumn ctermbg=white

" Automatically read changes on disk
"set autoread

" Backspace problem fix
set backspace=indent,eol,start

" let mapleader = ","

" Don't create swap files
set noswapfile

" Pathogen, plugin installer
execute pathogen#infect()
call pathogen#helptags()
" Needed for Pathogen
filetype plugin indent on

" ###   Plugins     ###
" $$$   NERDTree
" autocmd VimEnter * NERDTree
" Bind NERDTree toggle
" map <leader><space> :NERDTreeToggle<CR>

" Autoreload vimrc
:au! BufWritePost $MYVIMRC source $MYVIMRC

" Activate line numbering + relative and set its color to grey
set number
set relativenumber
highlight LineNr guifg=#777777

" Indents with 4 spaces instead of tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" d witout copy
map <leader>d "_d

" Hotkeys for creating splits
map <c-u> :vsplit<CR>
map <c-i> :split<CR>

" Faster way to shift between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Navigate previous and next buffer
map <leader>j :bn<CR>
map <leader>k :bp<CR>

" Scroll 1/2 up with f(previously 1 down)
nnoremap <c-f> <c-u>

" Scroll 1 line up(instead of c-y
nnoremap <c-,> <c-y>
" Scroll 1 line down(instead of c-e
nnoremap <c-m> <c-e>


" Scroll 1 line up and down NOT WORKING
nnoremap ª <c-e>
nnoremap º <c-y>

" Custom <leader> mappings.
" Open vimrc and gvimrc.
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>eg :e $MYGVIMRC<CR>

" Center window vertically on current marker placement
nnoremap <space> zz

" Save undo/redo history across vim sessions
set undofile
set undodir=~/.vim/undo
set clipboard=unnamed

" Make searches case insensitive
set ignorecase
" Highlight search matches while typing.
set incsearch
set showmatch
set hlsearch
hi Search guibg=#999999
nmap <c-n> :noh<CR>

" Set style of built in vim-tree :E
let g:netrw_liststyle=3

" New splits are created to the right and below instead of left and above
set splitright
set splitbelow
