" load ~/.vimrc and ~/.vim"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
source ~/.config/nvim/plug-config/coc.vim

" disable python2 "
let g:loaded_python_provider = 0


" --- Integrated Terminal --- "

" open new split panes to right and below "
set splitright
set splitbelow

" turn terminal to normal mode with escape "
tnoremap <Esc> <C-\><C-n>

" open terminal "
function! OpenTerminal()
    split term://zsh
    resize 5
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>


" --- Plugins --- "

" disable some color for polyglot "
let g:polyglot_disabled = [
            \'css',
            \'cs',
            \'markdown',
            \'reactjavascript',
            \'reacttypescript',
            \'php'
            \]

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()


" --- Plug Settings --- "


" === color scheme === "
colorscheme gruvbox
set background=dark


" === relative number === "
set number relativenumber


" === NERDTree === "
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open "
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle "
nnoremap <silent> <leader>e :NERDTreeToggle<CR>


" === fzf === "

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Ignore node_moduales "
" requires silversearcher-ag "
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


