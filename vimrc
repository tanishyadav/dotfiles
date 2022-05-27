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
" Disable backup
set nobackup
" Enable syntax highlighting
syntax on
" Enable filetype plugins and indents
filetype plugin indent on
" Set the leader key
let mapleader=" "
" My terminal supports true colors
set termguicolors
" Colorscheme
"set background=dark
"colorscheme solarized8
" Enable mouse support
set mouse=a



" -----------------------
" | Options and related |
" -----------------------

" Show ruler
set ruler
" Show line numbers
set number
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
" Use backspace in a normal way
"set bs=indent,eol,start
set bs=indent,start
" Reduce waiting time
set ttimeout
set ttimeoutlen=100
" Show @@@ in the last line if it is truncated, instead of hiding the whole line
set display=truncate
" Minimum screen lines around the cursor
set scrolloff=3
" Showing tabs, new lines and trailing spaces
"set listchars=eol:$,tab:>-,trail:-
" Manage wrapping of lines
set nowrap
set sidescroll=5
"set listchars+=precedes:<,extends:>
" Make tilde an opertor
"set tildeop
" Show status line always
set laststatus=2
" Show tabline always
set showtabline=2
" Split below when splitting horizontally
set splitbelow
" Split right when splitting vertically
set splitright
" Set textwidth
set textwidth=80
" Insert 4 characters of white space for indentation
"set shiftwidth=4
" Show tab characters (\t) as at most 8 characters
"set tabstop=8
" Don't use a mix of tabs and spaces (though this is default)
"set softtabstop=0
" Insert spaces when <TAB> is pressed in insert mode (Use <CTRL>-V to
" insert literal tab)
"set expandtab
" When typing a <TAB> to manually insert indentation in the start of a
" line, use shiftwidth amount of white space instead of tabstop
"set smarttab
" Automatically indent next lines based on previous lines
set autoindent
" Show cursor at the start of tab
"set listchars=tab:\ \  list
" Use UTF-8 for almost everything
set encoding=utf-8
" When doing keyword completion adjust case of match depending on the typed text
set infercase
" TODO: Add spellcheck
" TODO: Add omni completion



" ------------
" | Mappings |
" ------------

" Map jj to ESC
inoremap jj <ESC>
" Enable use of undo on CTRL+U and CTRL+W in insert mode
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
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
" Show whitespace visually
"nnoremap <LEADER>s :set list!<CR>
" Remove highlights for current search
nnoremap <LEADER>h :noh<CR>
" Just like o/O but doesn't enter INSERT mode
nnoremap <LEADER>o o<ESC>
nnoremap <LEADER>O O<ESC>
" Paste from clipboard
"nnoremap <LEADER>p "+p
"nnoremap <LEADER>P "+P
" Copy to clipboard
"nnoremap <LEADER>y "+y
"nnoremap <LEADER>Y "+Y
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
Plug 'tpope/vim-rhubarb'
call plug#end()

