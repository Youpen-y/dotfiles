" basic theme setting
"set background=dark
"colorscheme slate
syntax on			" Syntax highlighting
filetype on			" filetype on
set mouse=a			" tell vim to recognize mouse commands in all modes
set showmatch		" Shows matching brackets
set ruler			" Always shows location in file(line#)
set noexpandtab		" Tab is real tab, not backspace
set tabstop=4		" Tab = 4 backspace width
set shiftwidth=4	" Level of indentation
"set softtabstop=4	" Tab and Backspace operate on 4 space
"set smarttab		" Autotabs for certain code

set encoding=utf-8
set fileencoding=utf-8
let mapleader = " "  " set <leader> key equals to backspace (not use)

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
Plug 'preservim/nerdtree'	" nerdtree: file system explorer for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/git-messenger.vim' 
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
nnoremap <silent> <Leader>f :Files<CR>		
nnoremap <silent> <Leader>b :Buffers<CR>	
nnoremap <silent> <Leader>l :Lines<CR>	
nnoremap <silent> <Leader>g :GFiles?<CR>
nnoremap <silent> <Leader>h :History<CR>
" search with riggrep
if executable('rg')
	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
	let $FZF_DEFAULT_OPTS = '--height 40% --layout=reverse --border'
endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'yoffset': 0.1 } }

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" fzf conf end

" git-messenger conf begin
nnoremap <C-g> :GitMessenger<CR>
""" Plugins end
