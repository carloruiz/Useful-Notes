" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"=============================================================================
"CARLO's .vimrc begins here
"=============================================================================
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start 
set paste "pasting retains format
set ruler "shows line numbers in bottom right
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set listchars=tab:>\ 

autocmd FileType python setlocal expandtab "replace tabs with spaces for python files 
autocmd FileType yaml,css,javascript,html setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.js,*.css,*.html,*.py colorscheme molokai
autocmd FileType .yml set listchars=eol:\n,tab:>-
"autocmd BufEnter *.css colorscheme molokai
"autocmd BufEnter *.html colorscheme molokai



"set number "show line numbers

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax enable

set showcmd "show command in bottom bar
set wildmenu "visual autocomplete for command menu
set showmatch "highlight matching parens, brackes etc
set foldenable "enable folding

cmap q qa
nmap <Tab> gt
nmap <S-Tab> gT

set nobackup

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree' 
Plug 'fatih/vim-go'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flazz/vim-colorschemes'
Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_doc_keywordprg_enabled = 0

let g:vim_jsx_pretty_colorful_config = 1


nmap <S-l> <S-Right>
nmap <S-h> <S-Left>
nmap <s-K> {
nmap <s-J> }

vmap <S-l> <S-Right>
vmap <S-h> <S-Left>

"map <S-Up> {
"map <S-Down> }

"imap ˙ <Left> 
"imap ∆ <Down>
"imap ˚ <Up>
"imap ¬ <Right>

"nmap k <Up>
"nmap m <Down>
"nmap j <Left>
"vmap m <Down>
"vmap j <Left>
"vmap l <Right>
"vmap <C-l> <S-Right>
"vmap <C-j> <S-Left>


"imap ˚ <Up>
"imap µ <Down>
"imap ¬ <Right>
"imap ∆ <Left>
"imap <C-l> <S-Right>
"imap <C-j> <S-Left>
