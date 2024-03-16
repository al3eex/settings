" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
    Plug 'https://github.com/kkga/vim-envy'
    Plug 'https://github.com/habamax/vim-gruvbit'
    Plug 'https://github.com/nanotech/jellybeans.vim'
    Plug 'https://github.com/lifepillar/vim-solarized8'
    Plug 'https://github.com/lunacookies/vim-colors-xcode'
    Plug 'https://github.com/ap/vim-css-color'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'https://github.com/ntpeters/vim-better-whitespace'
    " Plug 'https://github.com/cherryramatisdev/theme-sync.vim'
    " let g:theme_sync_light_colorscheme = 'solarized8_high'
    " let g:theme_sync_dark_colorscheme = 'xcodedarkhc'
call plug#end()

" ---------- GENERAL SETTINGS  ----------
filetype plugin indent on

set langmenu=en_US.utf-8
language en_US
language messages en_US

set nocompatible
set fileformats=unix,mac
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set title      " Set title of a window to filename
set noswapfile " Prevent vim from creating .swp files

set splitbelow splitright " Sane splitting

set wrap
set linebreak    " Break lines at word (requires Wrap lines)
set showbreak=↓  " Line break symbols
set virtualedit=all   " Enable free-range cursor
set display+=lastline " Always try to show a paragraph's last line

syntax on
let g:jellybeans_use_term_italics = 1
set termguicolors
colors default
set bg=dark
" colors envy
" set bg=light
" if has("gui_running")
"     colors envy
"     set bg=light
" endif
set nocursorline
set showmatch  " Highlight matching brackets
set nu         " Turn on the line numbers

set guifont=Lilex:h16 " Set GUI Font
set guioptions-=r " Disables right scrollbar in MacVim
set guioptions-=l " Disables right scrollbar in MacVim

set hlsearch     " Highlight all search results
set smartcase    " Enable smart-case search
set ignorecase   " Always case-insensitive
set incsearch    " Searches for strings incrementally
set shortmess-=S " Show search count message, e.g. [1/5]

" Center search results on screen
nnoremap n nzz
nnoremap N Nzz

set expandtab    " Use spaces instead of a tab character on TAB
set shiftwidth=4 " Arrow function (>>) creates 4 spaces
set softtabstop=4
set tabstop=4    " Tab equal 4 spaces
set shiftround   " Shift to the next round tab stop. Aka When at 3 spaces
                 " hit >> to go to 4, not 5 if your shiftwidth is set to 4.

set autoindent  " Auto-indent new lines
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs

set autochdir   " Change working directory to current file directory
set autoread    " Automatically read files modified elsewhere

set backspace=indent,eol,start  " Backspace behaviour

set mouse=a  " Enable mouse in vim

set wildmenu " cmd line completion
set wildmode=list:longest,full

set confirm " Prompt confirmation dialogues (better quitting)

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set undolevels=1000 " Number of undo levels

if !isdirectory($HOME."/vim-undo-dir")
    call mkdir($HOME."/vim-undo-dir", "", 0700)
endif
set undodir=~/vim-undo-dir
set undofile
