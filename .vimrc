" General " {{{
set nocompatible               " be iMproved
" " }}}

" Formatting " {{{
" " }}}

" Visual " {{{
" " }}}

" Key mappings " {{{
" " }}}

" AutoCommands " {{{
" " }}}

" Scripts and Bundles " {{{
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on      " Automatically detect file types.
" }}}
