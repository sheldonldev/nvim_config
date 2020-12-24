" disable python2 "
let g:loaded_python_provider = 0

" python3 environment "
let g:python3_host_prog = expand("/usr/local/bin/python3")
" let g:python3_host_prog = expand("/opt/anaconda3/envs/default/bin/python3")


" --- integrated terminal --- "
tnoremap <Esc> <C-\><C-n>
nnoremap <A-v> :vsplit term://zsh<CR>
nnoremap <A-b> :split term://zsh <bar> resize 5<CR>


" --- load ~/.vimrc and ~/.vim --- "
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


" === colorizer === "
lua require'colorizer'.setup{}
nnoremap <leader>c  :ColorizerToggle<CR>
nnoremap <leader>ca :ColorizerAttachToBuffer<CR>

" Coc: ------------------------------------------- "
" Completion and ESlint works fine, but some extensions seems
" don't work with vim "
let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-json',
      \ 'coc-tailwindcss',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-jedi',
      \ ]

" Remap: "
" Remap keys for gotos "
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window "
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" navigate diagnostics "
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Remap for rename current word "
nmap <leader>rn <Plug>(coc-rename)

" Code action "
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" for scss "
autocmd FileType scss setl iskeyword+=@-@

" prettier-eslint and prettier-tslint are included with the installation of this extension.
" eslint, tslint, and all peer dependencies required by your specific configuration
" must be installed locally.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  :call CocAction('format')<CR> 

set statusline+=%#StatusLineNC#
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
