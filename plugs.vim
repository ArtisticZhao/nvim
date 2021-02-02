"            ____  _
"           |  _ \| |_   _  __ _ ___
"           | |_) | | | | |/ _` / __|
"           |  __/| | |_| | (_| \__ \
"           |_|   |_|\__,_|\__, |___/
"                          |___/

" ==============================================
" ============== Plug List =====================
" ==============================================
call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc
        " import coc's settings in vim
        source ~/.config/nvim/coc.vim


    " ============= vision     =============
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_powerline_fonts = 1
        let g:airline_theme="luna"
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
        " disable whitespace check by airline
        let g:airline#extensions#whitespace#enabled = 0
        " enable/disable coc integration >
        let g:airline#extensions#coc#enabled = 1
        " languageclient error_symbol >
        let airline#extensions#coc#error_symbol = ''
        " languageclient warning_symbol >
        let airline#extensions#coc#warning_symbol = ''
        " languageclient show_line_numbers >
        let airline#extensions#coc#show_line_numbers = 1
        " languageclient open_lnum_symbol >
        let airline#extensions#coc#open_lnum_symbol = '['
        " languageclient close_lnum_symbol >
        let airline#extensions#coc#close_lnum_symbol = ']'

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
            \       'verilog_systemverilog': {
            \           'parentheses': ['start=/begin/ end=/end/'],
            \       },
            \	}
            \}

    Plug 'ntpeters/vim-better-whitespace'
        let g:better_whitespace_enabled=1
        nnoremap ]w :NextTrailingWhitespace<CR>
        nnoremap [w :PrevTrailingWhitespace<CR>
        nnoremap <leader>sw :StripWhitespace<CR>
        vnoremap <leader>sw :'<,'>StripWhitespace<CR>

    " use coc-yank
    " Plug 'machakann/vim-highlightedyank'


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
        let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '/': {
            \     'pattern':         '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups':   ['!Comment'] },
            \ ']': {
            \     'pattern':       '[[\]]',
            \     'left_margin':   0,
            \     'right_margin':  0,
            \     'stick_to_left': 0
            \   },
            \ ')': {
            \     'pattern':       '[()]',
            \     'left_margin':   0,
            \     'right_margin':  0,
            \     'stick_to_left': 0
            \   },
            \ 'd': {
            \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
            \     'left_margin':  0,
            \     'right_margin': 0
            \   }
            \ }

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
        nmap m <Plug>(easymotion-overwin-f2)
        " JK motions: Line motions
        map <c-j> <Plug>(easymotion-j)
        map <c-k> <Plug>(easymotion-k)
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

    Plug 'jiangmiao/auto-pairs'
        au Filetype c       let b:AutoPairs={'(':')', '[':']', '{':'}', "'":"'", '"':'"', '"""':'"""', "'''":"'''"}
        au Filetype verilog let b:AutoPairs={'(':')', '[':']', '{':'}', "'":"'", '"':'"', '"""':'"""', "'''":"'''"}

    Plug 'gcmt/wildfire.vim'
        map <tab> <Plug>(wildfire-fuel)
        vmap <s-tab> <Plug>(wildfire-water)

    Plug 'machakann/vim-sandwich'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}


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
        " Set keymap
        tnoremap <silent> <c-q> <c-\><c-n>:FloatermKill<cr>
        " CTRL + t to toggle terminal wimdow
        nnoremap <silent> <m-t> :FloatermToggle quick<cr>
        tnoremap <silent> <m-t> <C-\><C-n>:FloatermToggle quick<cr>
        " call lazygit in floaterm
        nnoremap <C-g> :FloatermNew! --height=0.8 --width=0.9 --wintype=floating --name=lg --position=topleft --autoclose=2 lazygit<cr>

    Plug 'airblade/vim-gitgutter'
        " use configured color not use color in colortheme
        let g:gitgutter_override_sign_column_highlight = 1
        highlight GitGutterAdd    guifg=#009900 ctermfg=2
        highlight GitGutterChange guifg=#0c7d9d ctermfg=3
        highlight GitGutterDelete guifg=#ff2222 ctermfg=1
        " WARNING: those 4 settings above need to reconfig after set Colortheme!!!
        " not allow gitgutter overwrite other symbol
        let g:gitgutter_sign_allow_clobber = 0
        let g:gitgutter_map_keys = 0
        let g:gitgutter_preview_win_floating = 1
        let g:gitgutter_sign_added = '┃'
        let g:gitgutter_sign_modified = '┃'
        let g:gitgutter_sign_removed = '▂'
        let g:gitgutter_sign_removed_first_line = '▔'
        let g:gitgutter_sign_modified_removed = '▒'

        nmap ]h <Plug>(GitGutterNextHunk)
        nmap [h <Plug>(GitGutterPrevHunk)
        nnoremap zg :GitGutterFold<cr>

    " auto sudo read/write file
    Plug 'lambdalisue/suda.vim'
        let g:suda_smart_edit = 1

    Plug 'liuchengxu/vista.vim'
        noremap <LEADER>v :Vista!!<CR>
        noremap <leader>fv :silent! Vista finder coc<CR>
        let g:vista_default_executive = 'ctags'  " ['ale', 'coc', 'ctags', 'lcn', 'nvim_lsp', 'vim_lsc', 'vim_lsp']
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        let g:vista#renderer#enable_icon = 1
        let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }

        let g:vista_ctags_cmd = {
        \ 'ctags': '--extra=+q --fields=+i -n',
        \ }

        function! NearestMethodOrFunction() abort
          return get(b:, 'vista_nearest_method_or_function', '')
        endfunction

        set statusline+=%{NearestMethodOrFunction()}

        " By default vista.vim never run if you don't call it explicitly.
        "
        " If you want to show the nearest function in your statusline automatically,
        " you can add the following line to your vimrc
        " autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

    Plug 'mhinz/vim-startify'
    Plug 'junegunn/vim-peekaboo'                                " Show registers
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'will133/vim-dirdiff'
    Plug 'ZSaberLv0/ZFVimDirDiff'

    " ============= verilog    =============
    Plug 'WeiChungWu/vim-SystemVerilog', { 'for' :['verilog'] }
    " Plug 'vhda/verilog_systemverilog.vim'
        " au filetype verilog_systemverilog set foldmethod=syntax
    " Plug 'vimtaku/hl_matchit.vim'
    "     let g:hl_matchit_hl_groupname = 'HiMatchit'
    "     hi HiMatchit        ctermfg=231 guifg=#ffffff ctermbg=161     guibg=#d7005f

    " ============= clang      =============
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    " ============= python     =============
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for' :['python']}
    Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python'] }
    Plug 'tweekmonster/braceless.vim', { 'for' :['python'] }
    " ============= markdown   =============
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
        " set to 1, nvim will open the preview window after entering the markdown buffer
        " default: 0
        let g:mkdp_auto_start = 0

        " set to 1, the nvim will auto close current preview window when change
        " from markdown buffer to another buffer
        " default: 1
        let g:mkdp_auto_close = 1

        " set to 1, the vim will refresh markdown when save the buffer or
        " leave from insert mode, default 0 is auto refresh markdown as you edit or
        " move the cursor
        " default: 0
        let g:mkdp_refresh_slow = 0

        " set to 1, the MarkdownPreview command can be use for all files,
        " by default it can be use in markdown file
        " default: 0
        let g:mkdp_command_for_global = 0

        " set to 1, preview server available to others in your network
        " by default, the server listens on localhost (127.0.0.1)
        " default: 0
        let g:mkdp_open_to_the_world = 0

        " use custom IP to open preview page
        " useful when you work in remote vim and preview on local browser
        " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
        " default empty
        let g:mkdp_open_ip = ''

        " specify browser to open preview page
        " default: ''
        let g:mkdp_browser = ''

        " set to 1, echo preview page url in command line when open preview page
        " default is 0
        let g:mkdp_echo_preview_url = 0

        " a custom vim function name to open preview page
        " this function will receive url as param
        " default is empty
        let g:mkdp_browserfunc = ''

        " options for markdown render
        " mkit: markdown-it options for render
        " katex: katex options for math
        " uml: markdown-it-plantuml options
        " maid: mermaid options
        " disable_sync_scroll: if disable sync scroll, default 0
        " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
        "   middle: mean the cursor position alway show at the middle of the preview page
        "   top: mean the vim top viewport alway show at the top of the preview page
        "   relative: mean the cursor position alway show at the relative positon of the preview page
        " hide_yaml_meta: if hide yaml metadata, default is 1
        " sequence_diagrams: js-sequence-diagrams options
        " content_editable: if enable content editable for preview page, default: v:false
        " disable_filename: if disable filename header for preview page, default: 0
        let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0
            \ }

        " use a custom markdown style must be absolute path
        " like '/Users/username/markdown.css' or expand('~/markdown.css')
        let g:mkdp_markdown_css = ''

        " use a custom highlight style must absolute path
        " like '/Users/username/highlight.css' or expand('~/highlight.css')
        let g:mkdp_highlight_css = ''

        " use a custom port to start server or random for empty
        let g:mkdp_port = ''

        " preview page title
        " ${name} will be replace with the file name
        let g:mkdp_page_title = '「${name}」'

        " recognized filetypes
        " these filetypes will have MarkdownPreview... commands
        let g:mkdp_filetypes = ['markdown']
    " Plug 'suan/vim-instant-markdown', {'for': ['markdown']}
    Plug 'ferrine/md-img-paste.vim', {'for': ['markdown']}
        autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
        " there are some defaults for image directory and image name, you can change them
        let g:mdip_imgdir = 'img'
        let g:mdip_imgname = 'image'
    " ============= colortheme =============
    Plug 'connorholyday/vim-snazzy'
    Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'

call plug#end()


" ==============================================
" ============== colortheme   ==================
" ==============================================
set background=dark
" -- snazzy
color snazzy
" -- molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
" -- solarized
" colorscheme solarized
" -- gruvbox
" let g:gruvbox_sign_colum='bg'
" colorscheme gruvbox

" use configured color not use color in colortheme
let g:gitgutter_override_sign_column_highlight = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#0c7d9d ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" transparent background
hi Normal guibg=NONE ctermbg=NONE

" hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A
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


autocmd FileType python BracelessEnable +indent +highlight +fold-slow
