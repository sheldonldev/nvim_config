" coc extentions "
let g:coc_global_extensions = [
            \ 'coc-emmet',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-prettier',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-python',
            \ 'coc-yaml',
            \ 'coc-eslint',
            \ 'coc-stylelint',
            \ 'coc-snippets',
            \ 'coc-highlight',
            \ 'coc-phpls',
            \ 'coc-java',
            \ 'coc-explorer',
            \ 'coc-marketplace',
            \ ]

" === Explorer === "

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
nmap <leader>e :CocCommand explorer<CR>

" Explorer preset "
let g:coc_explorer_global_presets = {
\   '.config/nvim': {
\     'root-uri': '~/.config/nvim',
\   },
\   'hub/doc': {
\     'root-uri': '~/Documents/hub/doc'
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

" Use preset argument to open it "
nmap <leader>ef :CocCommand explorer --preset floating<CR>
nmap <leader>ev :CocCommand explorer --preset .config/nvim<CR>
nmap <leader>ed :CocCommand explorer --preset hub/doc<CR>

" List all presets "
nmap <leader>el :CocList explPresets


" === for scss extention === "
autocmd FileType scss setl iskeyword+=@-@


" === for prettier extention === "
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" === for other === "
" Add status line support, for integration with other plugin, checkout `:h coc-status` "
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use tab for trigger completion with characters ahead and navigate. "
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin. "
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position. "
" Coc only does snippet and additional edit on confirm. "
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics "
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

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

" Highlight symbol under cursor on CursorHold "
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word "
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s). "
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder "
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph "
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line "
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line "
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python "
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer "
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer "
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer "
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
