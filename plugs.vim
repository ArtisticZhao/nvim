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
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'ap/vim-buftabline'
    Plug 'connorholyday/vim-snazzy'                             " color theme
    Plug 'luochen1990/rainbow'
    Plug 'machakann/vim-highlightedyank'
    " ==== function ====
    Plug 'preservim/nerdcommenter'
    Plug 'mbbill/undotree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/vim-peekaboo'                                " Show registers
    Plug 'machakann/vim-highlightedyank'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'Raimondi/delimitMate'                                 " auto [ { ' ...
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'
    Plug 'mhinz/vim-startify'
    " ==== plug 4 git ====
    Plug 'airblade/vim-gitgutter'
call plug#end()


" ==============================================
" ============== airline =======================
" ==============================================
let g:airline_powerline_fonts = 1
let g:airline_theme="papercolor"
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.maxlinenr = ''
" enable tabline to show buffers
let g:airline#extensions#tabline#enabled = 1
" show buffers' index
let g:airline#extensions#tabline#buffer_idx_mode = 1
" quickly jump to buffers
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" ==============================================
" ============== Semshi ========================
" ==============================================
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold      gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161     guibg=#d7005f
hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160     guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160     guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign


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
"
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
" ============== cxx highlight =================
" ==============================================
" hi LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#AD7FA8 cterm=none gui=none
" hi LspCxxHlGroupNamespace ctermfg=Yellow guifg=#BBBB00 cterm=none gui=none
" hi LspCxxHlGroupMemberVariable ctermfg=White guifg=White
let g:lsp_cxx_hl_use_text_props = 1
" Preprocessor Skipped Regions:
"
" This is used for false branches of #if or other preprocessor conditions
hi default link LspCxxHlSkippedRegion Comment

" This is the first and last line of the preprocessor regions
" in most cases this contains the #if/#else/#endif statements
" so it is better to let syntax do the highlighting.
hi default link LspCxxHlSkippedRegionBeginEnd Normal


" Syntax Highlighting:
"
" Custom Highlight Groups
hi default LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#AD7FA8 cterm=none gui=none
hi default LspCxxHlGroupNamespace ctermfg=Yellow guifg=#BBBB00 cterm=none gui=none
hi default LspCxxHlGroupMemberVariable ctermfg=White guifg=White

hi default link LspCxxHlSymUnknown Normal

" Type
hi default link LspCxxHlSymClass Type
hi default link LspCxxHlSymStruct Type
hi default link LspCxxHlSymEnum Type
hi default link LspCxxHlSymTypeAlias Type
hi default link LspCxxHlSymTypeParameter Type

" Function
hi default link LspCxxHlSymFunction Function
hi default link LspCxxHlSymMethod Function
hi default link LspCxxHlSymStaticMethod Function
hi default link LspCxxHlSymConstructor Function

" EnumConstant
hi default link LspCxxHlSymEnumMember LspCxxHlGroupEnumConstant

" Preprocessor
hi default link LspCxxHlSymMacro Macro

" Namespace
hi default link LspCxxHlSymNamespace LspCxxHlGroupNamespace

" Variables
hi default link LspCxxHlSymVariable Normal
hi default link LspCxxHlSymParameter Normal
hi default link LspCxxHlSymField LspCxxHlGroupMemberVariable

" clangd-only groups
" A static member variable
hi default link LspCxxHlSymUnknownStaticField Normal
" Seems to be when a type alias refers to a primitive
hi default link LspCxxHlSymPrimitive Type
" Equivalent to TypeAlias
hi default link LspCxxHlSymTypedef Type
" Equivalent to TypeParameter
hi default link LspCxxHlSymTemplateParameter Type
" Equivalent to EnumMember
hi default link LspCxxHlSymEnumConstant LspCxxHlGroupEnumConstant
" A type dependent on a template
" E.g. T::A, A would be a dependent type
hi default link LspCxxHlSymDependentType Type
" A name dependent on a template, usually a function but can also be a variable?
hi default link LspCxxHlSymDependentName Function
" C++20 concepts, maybe type is sufficient for now....
hi default link LspCxxHlSymConcept Type


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

