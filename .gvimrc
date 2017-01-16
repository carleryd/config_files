" Autoreload gvimrc
:au! BufWritePost $MYGVIMRC source $MYGVIMRC

set nocompatible
filetype off

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Syntax highlighting Sublime-style by monokai bundle
syntax enable
colorscheme molokai

" CoffeeScript, appearently necessary
filetype plugin indent on

" Make YouCompleteMe check for config or something..
let g:ycm_confirm_extra_conf = 1
