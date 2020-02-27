" General " {{{
set nocompatible                " be iMproved

set modeline
set modelines=5                 " default numbers of lines to read for modeline instructions

set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set hlsearch                    " highlight search
" " }}}

" Formatting " {{{
set wrap                        " wrap lines by default
set textwidth=79                " 79 characters per line

set tabstop=8                   " tab size
set softtabstop=4
set shiftwidth=4                " default shift width for indents
set expandtab                   " replace tabs with ${tabstop} spaces
set smarttab                    " smart tabs according to context
set backspace=indent,eol,start

set autoindent
set smartindent
" " }}}

" Visual " {{{
syntax on                       " enable syntax

set background=dark             " adapt color to dark background

set mousehide                   " hide mouse after chars typed

set number                      " show line number

set laststatus=2                " always show status line
set shortmess=atI               " shortens messages
set showcmd                     " display an incomplete command in statusline

set statusline=%<%f\            " custom statusline
set stl+=[%{&ff}]               " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

set foldenable                  " turn on folding
set foldmethod=marker           " fold on the marker
set foldlevel=100               " don't autofold anything (but I can still fold manually)

set list                        " display unprintable characters f12 - switches
set listchars=tab:»-,eol:¶
set listchars+=trail:-
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

" Highlight tariling whitespace and spaces before a tab
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight long lines
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
" " }}}

" Key mappings " {{{

" Toggle line numbers for easy copying:
nmap <leader>n :set number! list!<CR>
" Map w!! with sudo:
cmap w!! w !sudo tee >/dev/null %

" Vetical tree explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'

" " }}}
