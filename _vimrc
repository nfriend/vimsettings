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
set dictionary+=C:/vimsettings/c-sharp.dictionary 
set dictionary+=C:/vimsettings/html.dictionary 
set dictionary+=C:/vimsettings/javascript.dictionary
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

" Map Ctrl+r to search and replace the currently selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

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

" Toggle whitespace visibility with \ + s
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Alias kj to <Esc>
:imap kj <Esc>

" Set the default timeout smaller
set timeoutlen=200

" vim: set fdm=marker:
