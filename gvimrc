" Autoreload gvimrc
:au! BufWritePost $MYGVIMRC source $MYGVIMRC

set nocompatible
filetype off

" VUNDLE
" This is needed for plugin paths to work
let $PATH=substitute($PATH, "/usr/local[^:]\\+:", "", "g")

" Bind NERDTree toggle
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree on vim start
autocmd VimEnter * NERDTree

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin(expand('$XDG_CONFIG_HOME').'/vim/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" File expolorer plugin
Bundle 'scrooloose/nerdtree'

" Auto completion plugin
Plugin 'Valloric/YouCompleteMe'

" Improved auto completion for JavaScript
Bundle 'marijnh/tern_for_vim' 

" Makes it easier to switch between files using c-p
Plugin 'kien/ctrlp.vim'

" Set color scheme to that of Sublime for JavaScript and others
Plugin 'tomasr/molokai'

" Syntax highlighting for CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
