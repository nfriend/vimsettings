" Pathogen plugin installer setup
execute pathogen#infect()

" Visual settings {{{1

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

" Persist code folding across Vim sessions
" I don't think this is working yet.
augroup codefolding
    autocmd!
    autocmd BufWinLeave .* mkview
    autocmd BufWinEnter .* silent loadview
    autocmd BufWinLeave _vimrc mkview
    autocmd BufWinEnter _vimrc silent loadview
augroup END
" Visual settings }}}1

" Basic settings {{{1
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

" Enable filetype plugins
:filetype plugin on

" Use the currently open file's path as Vim's working directory
" autocmd BufEnter * lcd %:p:h

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

" Basic settings }}}1

" Autocomplete settings {{{1

" Add custom dictionaries for autocomplete.
set dictionary+=$HOME/vimfiles/c-sharp.dictionary 
set dictionary+=$HOME/vimfiles/html.dictionary 
set dictionary+=$HOME/vimfiles/javascript.dictionary
" Add these dictionaries as source for the default autocomplete (using Ctrl+P)
set complete=.,w,b,u,t,i,k

" Autocomplete settings }}}1

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

" Abbreviations {{{1za
iabbrev @@ contact@nathanfriend.com

iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

" timestamp abbreviation, i.e. 2014/07/10 10:34:33 PM 
iabbrev <expr> dts strftime("%Y/%m/%d %X")

" Abbreviations }}}1

" Learning aids {{{1

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>

" Learning aids }}}1

" Vimscript filetype settings {{{1
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" Vimscript filetype settings }}}1

" Plugin settings {{{1

" NERDCommenter Settings {{{2
let NERDCommentWholeLinesInVMode=1

" Map NERDCommenter shortcuts to feel like Visual Studio
" nnoremap <leader>ec :call NERDComment(0, "comment")<cr>
nnoremap <leader>ec :call NERDComment(0, "comment")<cr>
vnoremap <leader>ec :call NERDComment(0, "comment")<cr>
nnoremap <leader>eu :call NERDComment(0, "uncomment")<cr>
vnoremap <leader>eu :call NERDComment(0, "uncomment")<cr>
" NERDCommenter Settings }}}2

" NERDTree settings {{{2
augroup NERDTreeAugroup
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup NERDTreeAugroup
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTree %:p:h<CR>
let g:NERDTreeWinPos = "right"
" NERDTree settings }}}2

" Plugin settings }}}1
