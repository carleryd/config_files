set nocompatible              " be iMproved, required
filetype off                  " required

" CHANGE TEST

" Autoreload vimrc
:au! BufWritePost $MYVIMRC source $MYVIMRC

let mapleader = ","

" Activate line numbering and set its color to grey
set number
highlight LineNr guifg=#777777

" Indents with 4 spaces instead of tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" And h to be : instead of ; so Vim-command is easier to use
map ; :

" Hotkeys for creating splits
map <c-u> :vsplit<CR>
map <c-i> :split<CR>

" Faster way to shift between splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Map scrolling to alt jk instead of ctrl ey
nnoremap <D-j> <c-e>  
nnoremap <D-k> <c-y>

" Scroll 1/2 up with f(previously 1 down)
nnoremap <c-f> <c-u>

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

" Highlight search matches while typing.
set incsearch
set showmatch
set hlsearch
hi Search guibg=#999999
nmap <silent> <leader><space> :silent noh<CR>

" Set style of built in vim-tree :E
let g:netrw_liststyle=3

" New splits are created to the right and below instead of left and above
set splitright
set splitbelow
