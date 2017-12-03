" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
call vundle#end()

set nocompatible	" Vi Improved
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number		" Absolute line number 
set relativenumber	" Relative line numbers 

" Enable syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Have Vim jump to the last position when" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Have Vim load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


" Key mappings
imap jk <Esc>
colorscheme earthy
