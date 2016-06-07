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

" NERD Tree to display directory/file structure
Plugin 'scrooloose/nerdtree'

" NERDTree tabs to keep nerdtree open
Plugin 'jistr/vim-nerdtree-tabs'

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

" Adds ack-compatibility for VIM
Plugin 'mileszs/ack.vim'

" a.vim to switch b/w src and header files
Plugin 'vim-scripts/a.vim'

" For XML editing. Use \c or \C 
Plugin 'othree/xml.vim'

" " Ultisnips for code templates.
" Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Visualizes changes in git
Plugin 'airblade/vim-gitgutter'

" Get the solarized theme
Plugin 'altercation/vim-colors-solarized'

" Used to repeat plugin commands with:
Plugin 'tpope/vim-repeat'

" Auto-format code:
Plugin 'Chiel92/vim-autoformat'

" CtrlP to search for files and buffers
Plugin 'kien/ctrlp.vim'

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


" enable syntax highlighting
syntax enable

" Solarized!
set term=xterm-256color
set background=dark

let g:solarized_termcolors=256

let g:solarized_termtrans=1 " 1|0 background transparent

let g:solarized_bold=1 " 1|0 show bold fonts

let g:solarized_italic=1 " 1|0 show italic fonts

let g:solarized_underline=1 " 1|0 show underlines

let g:solarized_contrast="normal" " normal|high|low contrast

let g:solarized_visibility="normal" " normal|high|low effect on whitespace characters

" colorscheme default
colorscheme solarized




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
hi CursorLine term=bold cterm=bold guibg=Gray20

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

filetype plugin indent on

" Syntastic settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


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
highlight ColorColumn ctermbg=235

" YouCompleteMe extra configuration options. 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers = {
 \ 'c' : ['->', '.'],
 \   'cpp,objcpp' : ['->', '.', '::'],
 \   'roslaunch' : ['="', '$(', '/'],
 \   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }

" Open vim-links in an existing tab (if possible) or a new tab (otherwise)
set switchbuf+=usetab,newtab

" Open NERDTreeTabs on start up
let g:nerdtree_tabs_open_on_console_startup = 1

" " Trigger configuration. Do not use <tab> if you use YCM
" " let g:UltiSnipsExpandTrigger="<tab>"
" " ^ Clashes with YCM
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Tell vim-ros to use catkin-tools
let g:ros_build_system='catkin-tools'

" Git gutter settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 200

" FZF binding for fuzzy search.
set rtp+=~/.fzf

" Remap git-gutteri hunk traversal to more semantic keys i.e. ]h and [h
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Enable the use of a mouse
set mouse=a

" Adds clang format formatting to the current buffer:
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>

highlight LineNr ctermfg=grey
