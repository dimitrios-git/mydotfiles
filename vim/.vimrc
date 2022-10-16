" ~/.vimrc
"
" This configuration was tested with Vim 8.0 and above.

" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins
call plug#begin()
Plug 'mattn/emmet-vim'
Plug '42Paris/42header'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Settings for the 42header plugin
let g:user42 = 'dcharala'
let g:mail42 = 'dcharala@student.42heilbronn.de'

" Settings for the markdown-preview plugin
let g:mkdp_theme = 'dark'

" Setting for the dracula theme
let g:dracula_colorterm = 0
" let g:dracula_italic = 0						" Remove italic fonts to fix iTerm issues

" Key mapping
let g:user_emmet_leader_key=','

" Configuration
colo dracula									" Enable the dracula colour scheme
syntax on										" Enable syntax highlighting
set number										" Show line numbers
set relativenumber								" Show line nubmers relative to the cursor line
set ruler										" Show the line and column number of the cursor
set linebreak									" Break lines at word
set showbreak=↳									" Wrap-broken line prefix
set textwidth=80								" Line wraps at 80 characters
set showmatch									" Highlight matching brace
set noerrorbells visualbell t_vb=				" No audio or visual bell
set hlsearch									" Highlight all search results
set smartcase									" Enable smart-case search
set ignorecase									" Always case-insensitive
set incsearch									" Search for strings incrementally
set shiftwidth=4								" Number of auto-indent spaces
set autoindent									" Auto-indent new lines
set copyindent									" Copy the structure of the existing lines indent
set preserveindent								" Preserve the indent structure
autocmd BufRead *.c setlocal cindent			" Use 'C' style program indenting for C files
autocmd BufRead *.c setlocal formatoptions+=t	" Apply line wrapping for non-comments in C files
set smarttab									" Enable smart-tabs
set softtabstop=0								" Set softtabstop to zero for tabstop to work properly
set tabstop=4									" Set the tab to be equal to 4 spaces
set noexpandtab									" Use the appropriate number of spaces to insert a tab
set list listchars=tab:\→\ ,trail:·				" Assign visible characters to non-visible ones
set undolevels=1000								" Number of undo levels
set backspace=indent,eol,start					" Backspace behaviour
