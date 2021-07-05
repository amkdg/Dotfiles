# https://github.com/amkdg/Dotfiles

set nocompatible
filetype off


" General
syntax on
set number
set relativenumber
set showcmd


" Formatting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set list listchars=tab:\ \ ,trail:·    " Visualize tabs and trailing whitespace
set backspace=indent,eol,start


" Search
set hlsearch
set incsearch


" Basic autocompletion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>


" Keybinds
nmap <l-p> "+p    " Paste from clipboard


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'wadackel/vim-dogrun'
Plugin 'Kjwon15/vim-transparent'

call vundle#end()
filetype plugin indent on


" Appearance
colorscheme dogrun
