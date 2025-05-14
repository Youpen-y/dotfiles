" basic theme setting
"set background=dark
"colorscheme slate
syntax on           " Syntax highlighting
filetype on         " filetype on
set mouse=a         " tell vim to recognize mouse commands in all modes
set showmatch       " Shows matching brackets
set ruler           " Always shows location in file(line#)
set expandtab       " Replace Tab with backspace
set tabstop=4       " Tab = 4 backspace width
set shiftwidth=4    " Level of indentation
set softtabstop=4   " Tab and Backspace operate on 4 space
set smarttab        " Autotabs for certain code

set encoding=utf-8
set fileencoding=utf-8
"let mapleader = " "  " set <leader> key equals to backspace (not use)

""" Keystrokes 
" ctrl+c <=> copy in visual mode
vnoremap <C-c> "+y

" ctrl+v <=> paste in normal mode
nnoremap <C-v> "+p
" ctrl+v <=> paste in insert mode
inoremap <C-v> <C-r>+

" ctrl+a <=> select whole file
nnoremap <C-a> ggvG

" ctrl+s <=> save changes in insert mode and normal mode
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" ctrl+d <=> save and exit
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>

" ctrl+q <=> quit discarding changes
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>
""" Keystrokes end

""" Plugins
" vim-plug manager conf begin
call plug#begin()
Plug 'junegunn/vim-easy-align'  " vim-easy-align: alignment plugin
Plug 'preservim/nerdtree'       " nerdtree: file system explorer for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" vim-plug manager conf end

" NERDTree conf begin
" Map specific key or shortcut to manipulate NERDTree
nnoremap <A-f> :NERDTreeFind<CR> 
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it
"autocmd VimEnter * NERDTree 
" NERDTree conf end

" fzf conf begin
nnoremap <silent> <C-p> :Files<CR> 
" fzf layout
let g:fzf_layout = { 'down': '~40%' }
" text search
nnoremap <silent> <C-f> :Ag<Cr>
" fzf conf end
""" Plugins end
