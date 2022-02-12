syntax on
 
" turn hybrid line numbers on
set number relativenumber 
set tabstop=2
set history=1000
set shiftwidth=2
set nocompatible
set clipboard=unnamedplus
set hidden
set encoding=UTF-8

filetype off
nnoremap <silent> <C-f> :Files<CR> 
nnoremap <silent> <C-b> :Buffers<CR> 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" keep plugin commans between vundle #begin/end

Plugin 'VundleVim/Vundle.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tmsvg/pear-tree'
Plugin 'preservim/nerdtree'
Plugin 'vim-syntastic/syntastic'
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
Plugin 'ervandew/supertab'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
let g:fzf_layout = { 'down': '~25%' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'morhetz/gruvbox'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mattn/emmet-vim'
call vundle#end()

"autocmd vimenter * ++nested colorscheme gruvbox
"set background=dark    " Setting dark mode

filetype plugin indent on

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python compile upon pressing F2
autocmd FileType python map <buffer> <F2> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType c map <buffer> <F2> :w<CR>:exec '!gcc' shellescape(@%,1) '&& clear && ./a.out'<CR>
autocmd FileType c imap <buffer> <F2> <esc>:w<CR>:exec '!gcc' shellescape(@%,1) '&& clear && ./a.out'<CR>
