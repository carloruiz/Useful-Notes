"=============================================================================
"CARLO's .vimrc begins here
"=============================================================================

" Do not try to be compatible with 'vi'.
set nocompatible

call plug#begin('~/.vim/plugged')
" Bag of goodies for working with go.
Plug 'fatih/vim-go'
" Language server client.
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
" Nice colorschemes.
Plug 'flazz/vim-colorschemes'
" Navigating large files.
Plug 'preservim/tagbar'
" Git inside of vim.
Plug 'tpope/vim-fugitive'
" Fuzzy file search.
Plug 'kien/ctrlp.vim'
" A very nice status bar.
Plug 'vim-airline/vim-airline'
" Themes for the status bar.
Plug 'vim-airline/vim-airline-themes'
" Allows for Gbrowse to work with github.
Plug 'tpope/vim-rhubarb'
call plug#end()

"----------------------------
" Plugin configurations
"----------------------------

"========
" vim-go 
"========
" Turn off <S-k> mapping to :GoDoc. We rely heavily on <S-k> for cursor
" navigation.
let g:go_doc_keywordprg_enabled = 0
" All options below are for expanding syntax highlighting.
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1

"========
" airline
"========
" Do not show current vim mode.
let g:airline_section_y = 0
" Do not show file encoding-type.
let g:airline_section_a = 0
" Only show column number in the right corner section.
let g:airline_section_z = airline#section#create(['%v'])
" Set airline theme to a very minimal colors. 
let g:airline_theme='lessnoise'

"=======
" netrw
"=======
" Disable top banner.
let g:netrw_banner = 0
" Tree view.
let g:netrw_liststyle = 3
" Open file in last used buffer.
let g:netrw_browse_split = 4

"======
" CoC
"======
" Setting below taken from  https://github.com/neoclide/coc.nvim#example-vim-configuration
" I remove a few defaults.

" If hidden is not set, TextEdit might fail.
set hidden
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
" I could configure sign column to be same color as background.
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Make ENTER work with the new coc autocomplete.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"----------------------------
" Personal configurations
"----------------------------

" For fast synctatic go checkers see:
" https://github.com/fatih/vim-go/issues/145#issuecomment-52092928

""" File Management
" Disable swap file creation
set noswapfile
" What does this do? 
set nobackup
" Use system clipboard
set clipboard=unnamed

""" File Manipulation 
" Enable folding.
set foldenable
" Open vertical splits to the right.
set splitright 
" Retain text format when pasting.
" TODO: not sure why this stops omni-complete from working.
" set paste

""" File Functional Appearance
" Copy indent from the current line to start new line.
set autoindent
" Numer of spaces to use for each step of auto-indent.
set shiftwidth=4
" Number of spaces that a <Tab> counts for while performing editing operations.
set softtabstop=4
" Number of spaces that a <Tab> in the file counts for. 
set tabstop=4
" Show command in bottom bar.
set showcmd 
" Disable line wrapping.
set nowrap
" Allow backspacing in normal mode over these break chars.
set backspace=indent,eol,start
" Show line/column numbers in bottom right
set ruler
" Show line numbers.
set number 
" Not sure what this does
set listchars=tab:>\
" Visual autocomplete for command menu.
set wildmenu
" Highlight matching parens, brackes etc.
set showmatch

colorscheme LightDefault
" colorscheme macvim-light
autocmd FileType python setlocal expandtab "replace tabs with spaces for python files 
autocmd FileType yaml,css,javascript,html setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.js,*.css,*.html,*.py colorscheme molokai
autocmd FileType .yml set listchars=eol:\n,tab:>-
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

""" Aesthetics
" Turn on code syntax highlighting.
syntax enable
" Line number appearance.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" Pop up menu (pmenu) appearance.
highlight Pmenu ctermbg=black ctermfg=lightgrey
" Selected line in the pop up menu. CocMenuSel overrides PmenuSel
highlight CocMenuSel ctermfg=white ctermbg=22
" Search highlight appearance.
highlight Search ctermbg=grey ctermfg=black

""" Cursor Navigation
" Navigate cursor right to next break point. 
nmap <S-l> <S-Right>
" Navigate cursor left to next break point. 
nmap <S-h> <S-Left>
" Navigate cursor up to next break point. 
nmap <S-k> {
" Navigate cursor down to next break point. 
nmap <S-j> }
" Navigate cursor right to next break point, in visual mode.
vmap <S-l> <S-Right>
" Navigate cursor left to next break point, in visual mode.
vmap <S-h> <S-Left>
" Navigate cursor up to next break point, in visual mode.
vmap <S-k> {
" Navigate cursor down to next break point, in visual mode.
vmap <S-j> }

""" File Management and Navigation
" Switch to right vim tab with <Tab>
nmap <Tab> gt
" Switch to left vim tab with <Shift><Tab>
nmap <S-Tab> gT
" Save file with 'w'
nmap w :w<Enter>
" Open file in vertical split instead of horizontal
nmap e gO
" Open a terminal in the parent directory of the file in the current
" buffer in a horizontal bottom split with height of 14
nmap term :let $VIM_DIR=expand('%:p:h')<CR>:split<CR>:terminal<CR><C-W><S-j>14<C-W>_<CR>icd $VIM_DIR<CR>
" Switch buffers as in normal mode
tnoremap <C-W> <C-\><C-n><C-W>

""" Code Navigation and Tooling
" Move cursor to new buffer when it is horizontal (veritcal is already the
" default)
set splitbelow
" Open tag in right vertical split
nmap ' :vsplit<CR>:exec("GoDef ".expand("<cword>"))<CR>
" Open tag in new tab
nmap " :tab split<CR>:exec("GoDef ".expand("<cword>"))<CR>
" Open TagbarToggle
nmap tg :TagbarToggle<Enter>
" Git shortcut and open in leftmost pane
nmap git :Git<C-W><S-h>
