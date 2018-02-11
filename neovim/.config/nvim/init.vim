" Plug
filetype on

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
"Plug 'pangloss/vim-javascript'
""Plug 'mxw/vim-jsx'
""Plug 'mattn/emmet-vim'
"Plug 'bronson/vim-trailing-whitespace'

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-jedi'
"Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
call plug#end()

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
set nowrap
set laststatus=2

" Tab settings per syntax
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype sass setlocal ts=2 sw=2 sts=0 expandtab

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
vmap jk <Esc>
let mapleader = ","
nmap <C-Up> ddkP
nmap <C-Down> ddp
nmap <space> :

"Tabs
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tj :tablast<CR>
nnoremap tk :tabfirst<CR>

colorscheme earthy

" ALE
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file


" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.pyc$', '\.sqlite3', '\.db']

nnoremap <Leader>f :NERDTreeToggle<Enter>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#enable_branch = 1
"let g:airline#enable_syntastic = 1
let g:airline_powerline_fonts = 1

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

"" Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_refresh_always = 1
"let g:deoplete#max_processes = 4
"
"" Jedi
let g:jedi#show_call_signatures = 2
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures_delay = 0

" Syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


