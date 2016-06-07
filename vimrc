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

" NERD Tree to display directory/file structure
Plugin 'scrooloose/nerdtree'

" Auto surrounds text snippets with quotes and what-have-yous
Plugin 'tpope/vim-surround'

" Comments code
Plugin 'tomtom/tcomment_vim'

" Syntastic for linting and syntax-stuff
Plugin 'scrooloose/syntastic'

" To insert lines before or after a line.
Plugin 'tpope/vim-unimpaired'

" To handle commenting
Plugin 'scrooloose/nerdcommenter'

" To handle automatic ctag genration 
Plugin 'xolox/vim-easytags'

" Needed by vim-easytags 
Plugin 'xolox/vim-misc'

" VIM-ROS for ROS features
Plugin 'taketwo/vim-ros'

" Builds code behind the scenes
Plugin 'tpope/vim-dispatch'

" Handles easier vim motions
Plugin 'easymotion/vim-easymotion'

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
hi CursorLine term=bold cterm=bold guibg=Gray40

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

" ROS auto-complete using YouCompleteMe from 
"           https://github.com/taketwo/vim-ros
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }

" Move cursor by display lines when wrapping
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" roslaunch xml syntax hilighting with inline yaml support
" From https://gist.github.com/jbohren/5964014
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

" Reselect visual block after indent/outdent indent visual
xnoremap < <gv
xnoremap > >gv

" You Complete Me improvements found on
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

let g:ycm_confirm_extra_conf = 1

" Disable default mappings
let g:EasyMotion_do_mapping = 0 
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Configure spell check to auto start 
set spell
" Change the highlight mode to underline
hi clear SpellBad
hi SpellBad cterm=underline

" Add a 81-character warning line
set colorcolumn=81
