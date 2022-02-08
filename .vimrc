syntax on

" turn hybrid line numbers on
set number relativenumber
set tabstop=2

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" keep plugin commans between vundle #begin/end

Plugin 'VundleVim/Vundle.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tmsvg/pear-tree'
Plugin 'preservim/nerdtree'

call vundle#end()


filetype plugin indent on

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
