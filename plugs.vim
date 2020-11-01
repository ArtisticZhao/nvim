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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc


    " ============= colortheme =============
    Plug 'connorholyday/vim-snazzy'
    Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'
        set background=dark
        " -- snazzy
        " color snazzy
        " -- molokai
        " let g:molokai_original = 1
        " let g:rehash256 = 1
        " -- solarized
        " colorscheme solarized
        " -- gruvbox
        let g:gruvbox_sign_colum='bg'
        colorscheme gruvbox


    " ============= vision     =============
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_powerline_fonts = 1
        let g:airline_theme="papercolor"
        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''

        " change the tabline display format.
        " this format only show the short dir when filename is not unique
        let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
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

    Plug 'luochen1990/rainbow'
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

    Plug 'ntpeters/vim-better-whitespace'
        let g:better_whitespace_enabled=1
        nnoremap ]w :NextTrailingWhitespace<CR>
        nnoremap [w :PrevTrailingWhitespace<CR>

    Plug 'machakann/vim-highlightedyank'
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}


    " ============= speed      =============
    Plug 'preservim/nerdcommenter'
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

    Plug 'junegunn/vim-easy-align'
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)


    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        " enable auto nohlsearch
        let g:incsearch#auto_nohlsearch = 1
        map n  <Plug>(incsearch-nohl-n)
        map N  <Plug>(incsearch-nohl-N)
        map *  <Plug>(incsearch-nohl-*)
        map #  <Plug>(incsearch-nohl-#)
        map g* <Plug>(incsearch-nohl-g*)
        map g# <Plug>(incsearch-nohl-g#)
        " fuzzy find
        function! s:config_fuzzyall(...) abort
          return extend(copy({
          \   'converters': [
          \     incsearch#config#fuzzy#converter(),
          \     incsearch#config#fuzzyspell#converter()
          \   ],
          \ }), get(a:, 1, {}))
        endfunction
        noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
        noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))

    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch-easymotion.vim'
        let g:EasyMotion_do_mapping = 0 " Disable default mappings
        " Turn on case-insensitive feature
        let g:EasyMotion_smartcase = 1
        " Need one more keystroke, but on average, it may be more comfortable.
        nmap s <Plug>(easymotion-overwin-f2)
        " JK motions: Line motions
        map <Leader>j <Plug>(easymotion-j)
        map <Leader>k <Plug>(easymotion-k)
        " incsearch.vim x fuzzy x vim-easymotion
        function! s:config_easyfuzzymotion(...) abort
          return extend(copy({
          \   'converters': [incsearch#config#fuzzy#converter()],
          \   'modules': [incsearch#config#easymotion#module()],
          \   'keymap': {"\<CR>": '<Over>(easymotion)'},
          \   'is_expr': 0,
          \   'is_stay': 1
          \ }), get(a:, 1, {}))
        endfunction
        noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


    " ============= function   =============
    Plug 'mbbill/undotree'
        map <LEADER>ut :UndotreeToggle<CR>

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
        let g:fzf_preview_window = 'right:50%'
        let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
        nmap <c-p> :Files<cr>
        nmap <m-f> :Ag<cr>
        " ------------- define AgIn to use Ag in dir
        function! s:ag_in(bang, ...)
          if !isdirectory(a:1)
            throw 'not a valid directory: ' .. a:1
          endif
          call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'right:50%'), a:bang)
          " If you don't want preview option, use this
          " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
        endfunction
        command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)
        " -------------- open linux documents in fzf by ag
        map <F10> :AgIn! /home/lilacsat/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek/Documentation<cr>

    Plug 'voldikss/vim-floaterm'
        " Set floaterm window's background to black
        hi Floaterm guibg=black
        " Set floating window border line color to cyan, and background to orange
        hi FloatermBorder guibg=cyan guifg=orange

    Plug 'mhinz/vim-startify'
    Plug 'junegunn/vim-peekaboo'                                " Show registers
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'Raimondi/delimitMate'                                 " auto [ { ' ...


    " ============= plug 4 git =============
    Plug 'airblade/vim-gitgutter'
        highlight GitGutterAdd    guifg=#009900 ctermfg=2
        highlight GitGutterChange guifg=#0c7d9d ctermfg=3
        highlight GitGutterDelete guifg=#ff2222 ctermfg=1
        " highlight GitGutterAddLineNr          guifg=#009900 ctermfg=2
        " highlight GitGutterChangeLineNr       guifg=#0c7d9d ctermfg=3
        " highlight GitGutterDeleteLineNr       guifg=#ff2222 ctermfg=1
        " not allow gitgutter overwrite other symbol
        let g:gitgutter_sign_allow_clobber = 0
        let g:gitgutter_map_keys = 0
        " use configured color not use color in colortheme
        let g:gitgutter_override_sign_column_highlight = 1
        let g:gitgutter_preview_win_floating = 1
        let g:gitgutter_sign_added = '▉'
        let g:gitgutter_sign_modified = '▉'
        let g:gitgutter_sign_removed = '▂'
        let g:gitgutter_sign_removed_first_line = '▔'
        let g:gitgutter_sign_modified_removed = '▒'

        nmap ]h <Plug>(GitGutterNextHunk)
        nmap [h <Plug>(GitGutterPrevHunk)
        nmap <LEADER>gf :GitGutterFold<cr>
        call plug#end()



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

