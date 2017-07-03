set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
hi Comment ctermfg=LightBlue

" Make vim-jsx work in .js files
let g:jsx_ext_required = 0

" Stop flow lint to run on save
let g:flow#enable = 0

" CtrlP ignores same files as git from .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ###   BUFFERS   ###
" Open buffer menu
nnoremap <leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <leader>f :CtrlPMRUFiles<CR>
" Navigate previous and next buffer
map <leader>h :bn<CR>
map <leader>l :bp<CR>


" Syntax
au BufReadPost *.html.eex set syntax=html " Enable html syntax highlighting on all *html.eex files

" Backspace problem fix
set backspace=indent,eol,start

" Don't create swap files
set noswapfile

" Pathogen, plugin installer
execute pathogen#infect()
call pathogen#helptags()
" Needed for Pathogen
filetype plugin indent on

syntax enable

" ###   Plugins     ###
" $$$   NERDTree
" autocmd VimEnter * NERDTree
" Do not open NERDTree directory listing on startup
let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=0
" Bind NERDTree toggle
map <leader><space> :NERDTreeToggle<CR>
hi Directory guifg=#FF0000 ctermfg=green

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Autoreload vimrc
:au! BufWritePost $MYVIMRC source $MYVIMRC

" Activate line numbering + relative and set its color to grey
set number
set relativenumber
" highlight LineNr guifg=#777777

" Indents with 2 spaces instead of tabs
filetype plugin indent on
set tabstop=2
set shiftwidth=2
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
nnoremap <leader>ov :e $MYVIMRC<CR>
nnoremap <leader>og :e $MYGVIMRC<CR>

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
