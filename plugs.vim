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
    Plug 'vim-airline/vim-airline'
    Plug 'connorholyday/vim-snazzy'                             " color theme
    Plug 'preservim/nerdcommenter'
    Plug 'mbbill/undotree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/vim-peekaboo'                                " Show registers
    Plug 'machakann/vim-highlightedyank'
    " Plug 'honza/vim-snippets'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    " ==== plug 4 git ====
    " Plug 'tpope/vim-fugitive'
    " Plug 'rbong/vim-flog'
call plug#end()


" ==============================================
" ============== Semshi ========================
" ==============================================
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign


" ==============================================
" ============== use color theme ===============
" ==============================================
" color snazzy
let g:molokai_original = 1
let g:rehash256 = 1
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
" C++20 concepts, maybe type is sufficient for now...
hi default link LspCxxHlSymConcept Type
