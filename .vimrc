" General " {{{
set nocompatible                " be iMproved

set modeline
set modelines=5                 " default numbers of lines to read for modeline instructions

set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set hlsearch                    " highlight search

let mapleader = ','             " comma as leader
let maplocalleader = '	'       " tab as a local leader
" " }}}

" Formatting " {{{
set wrap                        " wrap lines by default
set textwidth=80                " 80 characters per line

set tabstop=8                   " tab size
set softtabstop=4
set shiftwidth=4                " default shift width for indents
set expandtab                   " replace tabs with ${tabstop} spaces
set smarttab                    " smart tabs according to context

set autoindent
set smartindent
" " }}}

" Visual " {{{
syntax on                       " enable syntax

set background=dark             " adapt color to dark background

" set mouse=a                     " enable mouse
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
:au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" " }}}

" Key mappings " {{{

" Toggle line numbers for easy copying:
nmap <leader>n :set number! list!<CR>

cmap w!! w !sudo tee >/dev/null %   " Map w!! with sudo
" " }}}

" AutoCommands " {{{
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                           setf markdown
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}                 set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                         call ReloadAllSnippets()

autocmd FileType python setlocal tabstop=8 shiftwidth=4 softtabstop=4
" " }}}

" Scripts and Bundles " {{{
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
let g:snips_author = 'huxuan'
let g:snips_email = 'i(at)huxuan.org'
let g:tex_flavor = 'latex'
Bundle "huxuan/vim-snippets"

Bundle 'evanmiller/nginx-vim-syntax'
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx

filetype plugin indent on       " automatically detect file types.
" }}}
