"            ____  _
"           |  _ \| |_   _  __ _ ___
"           | |_) | | | | |/ _` / __|
"           |  __/| | |_| | (_| \__ \
"           |_|   |_|\__,_|\__, |___/
"                          |___/

" ==============================================
" ============== Plug List =====================
" ==============================================
call plug#begin('~/.vim/plugged')
    " ==== vision ====
    Plug 'vim-airline/vim-airline'
    Plug 'connorholyday/vim-snazzy'                             " color theme
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    " ==== function ====
    Plug 'preservim/nerdcommenter'
    Plug 'mbbill/undotree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/vim-peekaboo'                                " Show registers
    Plug 'machakann/vim-highlightedyank'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'Raimondi/delimitMate'                                 " auto [ { ' ...
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'
    Plug 'mhinz/vim-startify'
    " ==== plug 4 git ====
    Plug 'airblade/vim-gitgutter'
call plug#end()


" ==============================================
" ============== use color theme ===============
" ==============================================
color snazzy
" let g:molokai_original = 1
" let g:rehash256 = 1
" ==============================================
" ============== easy Align ====================
" ==============================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ==============================================
" ============== NERD-Commenter ================
" ==============================================
" KEY MAP: <L>cc comment; <L>cu uncomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" <c-/> to toggle comment; for some reason vim register c-/ as c-_
nmap <silent> <c-_> :call NERDComment("n", "Toggle")<CR>
xmap <silent> <c-_> :call NERDComment("x", "Toggle")<CR>
inoremap <silent> <c-_> <esc>:call NERDComment("n", "Toggle")<CR>i


" ==============================================
" ============== undo-tree =====================
" ==============================================
map <LEADER>ut :UndotreeToggle<CR>


" ==============================================
" ============== GitGutter =====================
" ==============================================
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#0c7d9d ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" highlight GitGutterAddLineNr          guifg=#009900 ctermfg=2
" highlight GitGutterChangeLineNr       guifg=#0c7d9d ctermfg=3
" highlight GitGutterDeleteLineNr       guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_allow_clobber = 0           " not allow gitgutter overwrite other symbol
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▉'
let g:gitgutter_sign_modified = '▉'
let g:gitgutter_sign_removed = '▂'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <LEADER>gf :GitGutterFold<cr>


" ==============================================
" ============== Rainbow =======================
" ==============================================
let g:rainbow_active = 1
	" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
let g:rainbow_conf = {
	\	'operators': '_->_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}


" ==============================================
" ============== fzf.vim =======================
" ==============================================
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
nmap <c-p> :Files<cr>
nmap <m-f> :Ag<cr>


" ==============================================
" ============== floaterm ======================
" ==============================================
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=cyan guifg=orange 

