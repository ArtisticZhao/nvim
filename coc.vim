"                               _   _   _
"   ___ ___   ___      ___  ___| |_| |_(_)_ __   __ _ ___
"  / __/ _ \ / __|____/ __|/ _ \ __| __| | '_ \ / _` / __|
" | (_| (_) | (_|_____\__ \  __/ |_| |_| | | | | (_| \__ \
"  \___\___/ \___|    |___/\___|\__|\__|_|_| |_|\__, |___/
"                                               |___/

" ==============================================
" ============== COC plugs list ================
" ==============================================
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-vimlsp',
            \'coc-explorer',
            \'coc-snippets',
            \'coc-python',
            \'coc-highlight',
            \'coc-translator',
            \'coc-marketplace',
            \'coc-tag',
            \'coc-word',
            \'coc-syntax'
            \]

" ==============================================
" ============== COC recommand vim settings ====
" ==============================================
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" use tab at line header to get correct indent
inoremap <silent><expr> <TAB>
      \ Is_emptyline() ? "\<esc>cc" :
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-d> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-d> coc#refresh()
else
  inoremap <silent><expr> <c-d> coc#refresh()
endif
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <l>d to show documentation in preview window.
nnoremap <silent> <LEADER>d :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" =================================================
" ==================== coc-explorer ===============
" =================================================
nnoremap <leader>e :CocCommand explorer<CR>


" =================================================
" ==================== coc-snippets ===============
" =================================================
" Use <C-d> for trigger snippet expand.
imap <c-d> <Plug>(coc-snippets-expand)
" Use <C-d> for select text for visual placeholder of snippet.
vmap <c-d> <Plug>(coc-snippets-select)
" Use <C-d> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-d>'
" Use <C-e> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-e>'
" Use <C-d> for both expand and jump (make expand higher priority.)
imap <c-d> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" ==============================================
" ============== coc-highlight =================
" ==============================================
set termguicolors
autocmd CursorHold * silent call CocActionAsync('highlight')


" ==============================================
" ============== coc-translator ================
" ==============================================
" popup
nmap <Leader>tr <Plug>(coc-translator-p)
vmap <Leader>tr <Plug>(coc-translator-pv)
