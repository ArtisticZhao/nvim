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
    Plug 'connorholyday/vim-snazzy'                 " color theme
    Plug 'preservim/nerdcommenter'
    Plug 'mbbill/undotree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/vim-peekaboo'                    " Show registers
    Plug 'machakann/vim-highlightedyank'
    Plug 'honza/vim-snippets'
call plug#end()


" ==============================================
" ============== use color theme snazzy ========
" ==============================================
color snazzy


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
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" ==============================================
" ============== undo-tree =====================
" ==============================================
map <LEADER>ut :UndotreeToggle<CR>

