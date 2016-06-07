" Vundle is a vim plugin manager:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" YouCompleteMe for auto completion
Plugin 'Valloric/YouCompleteMe'


" The badwolf colour scheme
Plugin 'sjl/badwolf'


" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" awesome colorscheme
" colorscheme badwolf

" enable syntax highlighting
syntax enable

" show line numbers
set number

" number of visual spaces per TAB
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4   

" expand tabs into spaces
set expandtab

" indent when moving to the next line while writing code
set autoindent

" load filetype-specific indent files - This both turns on filetype detection 
"     and allows loading of language specific indentation files based on that 
"     detection. For me, this means the python indentation file that lives at 
"     ~/.vim/indent/python.vim gets loaded every time I open a *.py file.
filetype indent on      

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" redraw only when we need to.
set lazyredraw          

" show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" SEARCHING
" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Include Pathogen in the start up list:
execute pathogen#infect()
filetype plugin indent on

" Syntastic settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

