" Pathogen plugin installer setup
execute pathogen#infect()

" Show line numbers
set number

" Enable syntax highlighting
syntax enable

" Use the dark solarized theme
set background=dark
colorscheme solarized

" Set the font to size 11 Consolas
set guifont=Consolas:h11

" Hide the toolbar from the GUI
set guioptions=egmrLt

" This is where the .swp and ~ files will be saved, so we don't have to look at them
set backupdir=C:/temp
set directory=C:/temp

" Automatically convert tabs into space, and set tab sizes
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Ignore case when searching
set ignorecase
" unless we've included a capital letter in our search expression
set smartcase

" Add custom dictionaries for autocomplete.
set dictionary+=$HOME/vimfiles/c-sharp.dictionary 
set dictionary+=$HOME/vimfiles/html.dictionary 
set dictionary+=$HOME/vimfiles/javascript.dictionary
" Add these dictionaries as source for the default autocomplete (using Ctrl+P)
set complete=.,w,b,u,t,i,k

" Enable filetype plugins
:filetype plugin on

" NERDTree settings {{{1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTree %:p:h<CR>
let g:NERDTreeWinPos = "right"
" NERDTree settings }}}1

" Use the currently open file's path as Vim's working directory
autocmd BufEnter * lcd %:p:h

" Make backspace work in VsVim
set backspace=indent,eol,start

" Make copy and paste use the system's clipboard by default
set clipboard=unnamed

" Keep a longer history of commands
set history=1000

" Enable the matchit plugin that comes bundled with the Vim installation
runtime macros/matchit.vim

" Maintain more context around the cursor
set scrolloff=6

" Set the default timeout smaller
set timeoutlen=500

" Remaps {{{1

" Set <leader> to <space>
let mapleader = " "

" Set <localleader> to \ 
let maplocalleader = "\\"

" Automatically edit this file with <leader> + ev
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Reapply everything in my _vimrc without having to exit and reload.
" Note that this won't CLEAR any settings.  It will only replace/add settings
" to the previous configuration.
nnoremap <leader>sv :source $MYVIMRC<cr>

" Allow Ctrl+Backspace to act like Windows
inoremap <C-BS> <C-W>

" Allow Ctrl+Delete to act like Windows - doesn't quite work properly
inoremap <C-Del> <C-O>dw

" Toggle whitespace visibility with <leader> + s
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Alias kj to <Esc>
:inoremap kj <Esc>

" Map Ctrl+r to search and replace the currently selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Remaps }}}1

" Abbreviations {{{1
iabbrev @@ contact@nathanfriend.com
" Abbreviations }}}1

" vim: set fdm=marker:
