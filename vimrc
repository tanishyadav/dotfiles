"
"   ______            _      ____  __          __
"  /_  __/___ _____  (_)____/ /\ \/ /___ _____/ /___ __   __
"   / / / __ `/ __ \/ / ___/ __ \  / __ `/ __  / __ `/ | / /
"  / / / /_/ / / / / (__  ) / / / / /_/ / /_/ / /_/ /| |/ /
" /_/  \__,_/_/ /_/_/____/_/ /_/_/\__,_/\__,_/\__,_/ |___/
"
"


" -------------------
" | Initializations |
" -------------------

" Enjoy full functionality of vim
set nocompatible
" Change the path/name for viminfo
"set viminfofile=$VIM\viminfo
" Change directory for swap files with full path in their names
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "", 0700)
endif
set directory=~/.vim/swap//
" Enable persistent undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo
set undofile
" Backup
set nobackup
set writebackup
" Enable filetype plugins and indents
filetype plugin indent on
" Enable syntax highlighting
syntax on
" Set the leader key
let mapleader=" "
let maplocaleader=" "
" My terminal supports true colors
set termguicolors
" Colorscheme
set background=dark
" Enable mouse support
set mouse=nvi
" Make either meta or alt key work in GNOME terminal; Both can't :(
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
let c='a'
while c <= 'z'
  exec "set <M-".c.">=\e".c
  exec "imap \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw
" Cursors
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[4 q"
let &t_EI = "\<esc>[2 q"



" -----------------------
" | Options and related |
" -----------------------

" Show ruler
set ruler
" Show line numbers
set number
" Show possible matches above the command line on <TAB>
set wildmenu
" Ignore case
set ignorecase
" Match case if search pattern contains CAPS
set smartcase
" Move to first result while searching and highlight it
set incsearch
" Highlight search results
set hlsearch
"Show partially typed commands in normal mode
set showcmd
" Increase max history
set history=10000
" Increase max undo levels
set undolevels=10000
" Increase max tabpage
set tabpagemax=50
" Use backspace in a normal way
set bs=indent,eol,start
" Reduce waiting time
set timeout
set ttimeout
set timeoutlen=500
set ttimeoutlen=50
" Show @@@ in the last line if it is truncated, instead of hiding the whole line
set display=lastline
" Don't store options in sessions
set sessionoptions-=options
" Don't store options in views
set viewoptions-=options
" Minimum screen lines around the cursor
set scrolloff=3
" Listchars
set listchars=tab:\ \ →,nbsp:·,extends:→,precedes:←
set list
" Manage wrapping of lines
set nowrap
" Side scrolling
set sidescroll=10
set sidescrolloff=5
" Show status line always
set laststatus=2
" Show tabline always
set showtabline=2
" Split below when splitting horizontally
set splitbelow
" Split right when splitting vertically
set splitright
" Enable modelines
set modeline
set modelines=5
" Set textwidth
set textwidth=80
" Insert 4 characters of white space for indentation
"set shiftwidth=4
" Show tab characters (\t) as at most 8 characters
"set tabstop=8
" Don't use a mix of tabs and spaces
"set softtabstop=0
" Insert spaces when <TAB> is pressed in insert mode
"set expandtab
" When typing a <TAB> to manually insert indentation in the start of a
" line, use shiftwidth amount of white space instead of tabstop
"set smarttab
" Automatically indent next lines based on previous lines
set autoindent
" Copy indentation from previous line
set copyindent
" Use UTF-8 for almost everything
set encoding=utf-8
" When doing keyword completion adjust case of match depending on the typed text
set infercase
" formatoptions
" TODO
set formatoptions+=j
" Autoread file if changed by other program
set autoread
" TODO: Add spellcheck
" TODO: Add omni completion



" ------------
" | Mappings |
" ------------

" ESC
inoremap kj <ESC>
vnoremap kj <ESC>
cnoremap kj <C-C>
" Enable use of undo on CTRL+U and CTRL+W in insert mode
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
" Enable use of undo on enters
"inoremap <CR> <C-G>u<CR>
" Put the closing quote, parenthesis and company
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<C-o>O
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap /* /**/<ESC>hi
"inoremap /*<CR> /*<CR><CR>*/<ESC>kS
" Put semicolon to end of line without moving cursor
nnoremap <LEADER>; m'A;<ESC>`'
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" Just like o/O but doesn't enter INSERT mode
nnoremap <LEADER>o o<ESC>
nnoremap <LEADER>O O<ESC>
" Write a *byte* faster
nnoremap <LEADER>w :w<CR>
" I open terminals a bit too often :D
nnoremap <LEADER>t :vert term<CR>
" Easier FZF
nnoremap <LEADER>f :FZF<CR>
" Git status - vertical
nnoremap <LEADER>g :vert Git<CR>
" Tab through windows
nnoremap <TAB> <C-W><C-W>
" Goyo - FOCUS!
nnoremap <F5> :Goyo<CR>
" Undotree
nnoremap <F4> :UndotreeToggle<CR>
" Limelight
nnoremap <F6> :Limelight!!<CR>
" TODO: Move bindings to filetype files
" TODO: Add binding for auto-completion



" ------------
" | Commands |
" ------------




" -------------------
" | Builtin Plugins |
" -------------------

" Load builtin plugins
packadd matchit
packadd justify
packadd termdebug



" ------------
" | Vim-plug |
" ------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'lifepillar/vim-solarized8'
autocmd vimenter * ++nested colorscheme solarized8
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
let g:show_spaces_that_precede_tabs=1
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rhubarb'
"Plug 'jiangmiao/auto-pairs'
"let g:AutoPairsFlyMode = 1
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
"Plug 'dpc/vim-smarttabs'
Plug 'Thyrum/vim-stabs'
autocmd vimenter * ++nested nunmap =
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['sensible']
let g:python_highlight_space_errors = 0
Plug 'junegunn/vim-peekaboo'
"Plug 'tpope/vim-scriptease'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'junegunn/limelight.vim'
let g:limelight_default_coefficient = 0.7
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

call plug#end()

" vim: ft=vim :
