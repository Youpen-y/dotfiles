syntax on 		" Syntax highlighting
set mouse=a		" tell vim to recognize mouse commands in all modes
set showmatch 		" Shows matching brackets
set ruler 		" Always shows location in file(line#)
set smarttab 		" Autotabs for certain code
set shiftwidth=4	" Level of indentation

set encoding=utf-8
set fileencoding=utf-8

" NERDTree conf begin
" Map specific key or shortcut to manipulate NERDTree
nnoremap <C-f> :NERDTreeFind<CR> 
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree and leave the cursor in it
autocmd VimEnter * NERDTree 
" NERDTree conf end
"
" vim-plug manager conf begin
call plug#begin()
Plug 'junegunn/vim-easy-align'  " vim-easy-align: alignment plugin
Plug 'preservim/nerdtree'	" nerdtree: file system explorer for vim
call plug#end()

" vim-plug manager conf end


" Keystrokes for vim
inoremap <C-s> <esc>:w<cr>	" save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>	" save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>	" quit discarding changes
nnoremap <C-q> :qa!<cr>
