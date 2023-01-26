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
            \'coc-highlight',
            \'coc-tag',
            \'coc-syntax',
            \'coc-yank',
            \'coc-snippets',
            \'coc-pyright',
            \]

" ==============================================
" ============== COC recommand vim settings ====
" ==============================================
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>d to show documentation in preview window.
nnoremap <silent> <leader>d :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" =================================================
" ==================== coc-snippets ===============
" =================================================
" Use <C-d> for trigger snippet expand.
imap <c-d> <Plug>(coc-snippets-expand)
" Use <C-d> for select text for visual placeholder of snippet.
vmap <c-d> <Plug>(coc-snippets-select)
" Use <C-d> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-d>'
" Use <C-d> for both expand and jump (make expand higher priority.)
imap <c-d> <Plug>(coc-snippets-expand-jump)
