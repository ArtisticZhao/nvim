"          __     _____ __  __ ____   ____
"          \ \   / /_ _|  \/  |  _ \ / ___|
"           \ \ / / | || |\/| | |_) | |
"           _\ V /  | || |  | |  _ <| |___
"          (_)\_/  |___|_|  |_|_| \_\\____|
"
"
"
"
"   TODO:
"     - coc-word for comments
"     - resize window -> move the split line
"     - git diff files

" #########################################################################################
"                              BASIC SETTINGS: no plugins settings
" #########################################################################################
" ==============================================
" ============== System settings ===============
" ==============================================
" ============== System settings
set novb
set noeb vb t_vb=
set encoding=utf-8
let &t_ut=''  " cmd color
set autochdir
" set mouse=a  " enable mouse click

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" open file with last edit postion
autocmd BufReadPost * normal! g`"

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" let block-v can select anywhere
set virtualedit=block

" ============== Indentation & Backspace =======
set expandtab     " 将制表符扩展为空格
set tabstop=4     " 设置编辑时制表符占用空格数
set shiftwidth=4  " 设置格式化时制表符占用空格数
autocmd FileType yaml set shiftwidth=2
set softtabstop=4 " 把连续数量的空格视为一个tab
set backspace=2   " make bp like normal app

" ============== Display =======================
set number
set relativenumber
set cursorline
set showcmd
set wildmenu
set scrolloff=5
" define wrap rules
set nowrap
" show tab and space
set list

" ============== Search settings ===============
exec "nohlsearch"
set hlsearch
set incsearch       " search when typing
set ignorecase
set smartcase
set wrapscan        " tail to head search

" ==============================================
" ============== Key Mappings ==================
" ==============================================
" -------------- set space as leader key
let mapleader=" "
" -------------- Speed Navigation
noremap J 5j
noremap K 5k
noremap H ^
noremap L $
" -------------- Navigation on i-mode
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
" -------------- add empty row
noremap <cr> o<esc>
" -------------- change to uppercase
noremap ` ~
" -------------- save & quit
map <c-q> :q<CR>
map <c-s> :w<CR>
imap <c-s> <esc>:w<CR>
" -------------- Copy to system clipboard
vnoremap Y "+y
nnoremap Y "+yy
noremap  P "+p
" -------------- search & select
" search selected words
vnoremap / y/<c-r>"<cr>
" find word under cursor use Incsearch plugin
nmap <c-f> /<c-r><c-w><cr>
imap <c-f> <esc>/<c-r><c-w><cr>
xmap <c-f> y/<c-r>"<cr>
" n for search down N for search up
nnoremap <silent> n /<CR>zz
nnoremap <silent> N ?<CR>zz
" next/prev fx Fx
nnoremap - ,
nnoremap = ;
" no highlight for search
noremap <LEADER><CR> :nohlsearch<CR>
" -------------- replace current word
" nnoremap <c-h> <esc>:%s/<c-r><c-w>//g<left><left>
" xnoremap <c-h> y<esc>:%s/<c-r>"//g<left><left>
" replace tab with space
nnoremap <leader><tab> <esc>:%ret! 4<cr>
" -------------- Indentation
noremap < <<
noremap > >>
" keep visual mode after indent
vnoremap > >gv
vnoremap < <gv
" -------------- buffers
" close buffer
map Q :bd<cr>
" -------------- place holder
imap <c-p> <++>  " put a placeholder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" -------------- spell check
map <LEADER>sc :set spell!<CR>
" -------------- split window
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sh :set nosplitright<CR>:vsplit<CR>
map <LEADER>sk :set nosplitbelow<CR>:split<CR>
map <LEADER>sj :set splitbelow<CR>:split<CR>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize+5<CR>
map <C-right> :vertical resize-5<CR>
" -------------- VIMRC
" Open neoVIM configure file in new tab
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" Reload VIMRC
noremap <LEADER>R :source $MYVIMRC<CR>


" #########################################################################################
"                              PLUGINS SETTINGS: plugins & language settings
" #########################################################################################
" ============= Auto load for first time uses ==
if empty(glob('~/.config/nvim/plugged'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" load functions script
source ~/.config/nvim/funcs.vim

" ==============================================
" ============== plugins =======================
" ==============================================
call plug#begin('~/.config/nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " coc
        " import coc's settings in vim
        source ~/.config/nvim/coc.vim

    " ============= colortheme =============
    Plug 'connorholyday/vim-snazzy'
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'morhetz/gruvbox'

    " ============= vision     =============
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_powerline_fonts = 1
        let g:airline_theme="deus"
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
        let g:AutoPairsMapCh = 0  " don't map the <c-h> to backspace in insert mode

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

" ==============================================
" ============== MarkDown ======================
" ==============================================
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}
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

    autocmd FileType markdown set wrap
    " find a placeholder
    autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
    autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
    " bold
    autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
    " delete line
    autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
    " italic
    autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
    " code in line
    autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
    " code block
    autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
    autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
    autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
    autocmd Filetype markdown inoremap ,l --------<Enter>
    " place a 'more'
    autocmd Filetype markdown inoremap ,m <!--more-->
call plug#end()

" -------------- remap to put -> in C files
au filetype c inoremap <buffer> ` ->
au filetype verilog inoremap <buffer> ` <=



" -------------- call figlet
map tx :r !figlet


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


" ==============================================
" ============== Path configure ================
" ==============================================
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'

