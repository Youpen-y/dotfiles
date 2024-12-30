syntax on 		" Syntax highlighting
filetype on		" filetype on
set mouse=a		" tell vim to recognize mouse commands in all modes
set showmatch 		" Shows matching brackets
set ruler 		" Always shows location in file(line#)
set smarttab 		" Autotabs for certain code
set shiftwidth=4	" Level of indentation

set encoding=utf-8
set fileencoding=utf-8
let mapleader = " "  " set <leader> key equals to backspace

""" Keystrokes 
" ctrl+c <=> copy in visual mode
vnoremap <C-c> "+y

" ctrl+v <=> paste in normal mode
nnoremap <C-v> "+p
" ctrl+v <=> paste in insert mode
inoremap <C-v> <C-r>+

" ctrl+a <=> select whole file
nnoremap <C-a> ggvG

" Keystrokes for vim
inoremap <C-s> <esc>:w<cr>	" save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>	" save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>	" quit discarding changes
nnoremap <C-q> :qa!<cr>


""" Plugins
" vim-plug manager conf begin
call plug#begin()
Plug 'junegunn/vim-easy-align'  " vim-easy-align: alignment plugin
Plug 'preservim/nerdtree'	" nerdtree: file system explorer for vim
Plug 'neoclide/coc.nvim'	" coc.nvim: c language server
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" vim-plug manager conf end

" NERDTree conf begin
" Map specific key or shortcut to manipulate NERDTree
nnoremap <A-f> :NERDTreeFind<CR> 
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it
autocmd VimEnter * NERDTree 
" NERDTree conf end

""" fzf conf begin
nnoremap <silent> <C-p> :Files<CR> 
" fzf layout
let g:fzf_layout = { 'down': '~40%' }
" text search
nnoremap <silent> <C-f> :Ag<Cr>
""" fzf conf end

" coc-nvim conf start
set termguicolors
""" Customize colors
func! s:my_colors_setup() abort
    " menu color
    hi Pmenu guifg=#2b2b2b ctermfg=235 guibg=#d7e5dc ctermbg=252 gui=NONE cterm=NONE
    hi PmenuSel guifg=#000000 ctermfg=0 guibg=#b7c7b7 ctermbg=248 gui=NONE cterm=NONE
    hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#bcbcbc ctermbg=250 gui=NONE cterm=NONE
    hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#585858 ctermbg=240 gui=NONE cterm=NONE

    " Coc completion menu
    hi CocFloating guifg=#2b2b2b ctermfg=235 guibg=#e8e8e8 ctermbg=253 gui=NONE cterm=NONE
    hi CocMenu guifg=#2b2b2b ctermfg=235 guibg=#d7e5dc ctermbg=252 gui=NONE cterm=NONE
    hi CocMenuSel guifg=#000000 ctermfg=0 guibg=#b7c7b7 ctermbg=248 gui=NONE cterm=NONE
    
    " Coc float window
    hi CocFloatDividingLine guifg=#505050 ctermfg=244 gui=NONE cterm=NONE
    hi CocFloatActive guifg=#2b2b2b ctermfg=235 guibg=#f0f0f0 ctermbg=255 gui=NONE cterm=NONE
    hi CocInfoFloat guifg=#2b5d63 ctermfg=23 guibg=#e8f0f0 ctermbg=255 gui=NONE cterm=NONE
    hi CocErrorFloat guifg=#cc3333 ctermfg=167 guibg=#ffe6e6 ctermbg=224 gui=NONE cterm=NONE
    hi CocWarningFloat guifg=#c07f00 ctermfg=172 guibg=#fff3d9 ctermbg=230 gui=NONE cterm=NONE
    hi CocHintFloat guifg=#485e9e ctermfg=61 guibg=#f0f4ff ctermbg=189 gui=NONE cterm=NONE

    " Coc hints
    hi CocInlayHint guifg=#505050 ctermfg=244 guibg=#f0f0f0 ctermbg=255 gui=NONE cterm=NONE
    hi CocHintSign guifg=#505050 ctermfg=244 guibg=#f0f0f0 ctermbg=255 gui=NONE cterm=NONE
    hi CocHintVirtualText guifg=#505050 ctermfg=244 guibg=#f0f0f0 ctermbg=255 gui=NONE cterm=NONE

    " doc hints window
    hi CocDocumentation guifg=#2b2b2b ctermfg=235 guibg=#f5f5f5 ctermbg=255 gui=NONE cterm=NONE
endfunc
augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup ENDi

" Trigger the function at startup
call s:my_colors_setup()




" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config

function! CheckBackspace() abort
    let col = col('.') - 1
    let prev_char = getline('.')[col - 1]
    let next_char = getline('.')[col]
    return !col || prev_char =~# '\s' || next_char =~# '\s'
endfunction
" tab: choose next
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" shift + tab: choose last
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" enter: enter the completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
       call CocActionAsync('doHover')
    else
	call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


let mapleader = " "  " set <leader> key equals to backspace
" space + f: format whole file(file saved)
nmap <leader>f <Plug>(coc-format-selected)
" space + f: format chosen parts
xmap <leader>f <Plug>(coc-format-selected)


