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

" Add custom dictionaries for autocomplete.
set dictionary+=E:/Documents/GitHub/vimsettings/c-sharp.dictionary 
set dictionary+=E:/Documents/GitHub/vimsettings/html.dictionary 
set dictionary+=E:/Documents/GitHub/vimsettings/javascript.dictionary
" Add these dictionaries as source for the default autocomplete (using Ctrl+P)
set complete=.,w,b,u,t,i,k

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

" vim: set fdm=marker:
