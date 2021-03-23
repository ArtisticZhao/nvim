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
" cmd color
let &t_ut=''
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

" don't higlight search when sourcing .vimrc
let @/ = ""

" set tags file
set tags=./.tags;,.tags


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

" find word under cursor use Incsearch plugin
nmap <c-f> /<c-r><c-w><cr>
imap <c-f> <esc>/<c-r><c-w><cr>
" find selected string with escape mode
vnoremap <silent> <c-f> :<C-u>call EscapedSearch()<CR>/<C-R>=@/<CR><CR>n
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
" open split window
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sh :set nosplitright<CR>:vsplit<CR>
map <LEADER>sk :set nosplitbelow<CR>:split<CR>
map <LEADER>sj :set splitbelow<CR>:split<CR>
" move around splited windows
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
" switch two splited windows
map <LEADER>st <c-w><c-r>
" change width and height of splited windows
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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " vision
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'ntpeters/vim-better-whitespace'
    " speed
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    " enhance
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'

    Plug 'ZSaberLv0/ZFVimDirDiff'
call plug#end()

source ~/.config/nvim/coc.vim

" ==============================================
" ============== plugins configs ===============
" ==============================================

" -------------- vim-airline/vim-airline vim-airline/vim-airline-themes
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


" -------------- luochen1990/rainbow
let g:rainbow_active = 1
    " \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    " \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
let g:rainbow_conf = {
    \   'operators': '_->_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \       'verilog_systemverilog': {
    \           'parentheses': ['start=/begin/ end=/end/'],
    \       },
    \   }
    \}


" -------------- ntpeters/vim-better-whitespace
let g:better_whitespace_enabled=1
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>
nnoremap <leader>sw :StripWhitespace<CR>
vnoremap <leader>sw :'<,'>StripWhitespace<CR>


" -------------- preservim/nerdcommenter
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


" -------------- junegunn/vim-easy-align
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


" -------------- haya14busa/incsearch.vim haya14busa/incsearch-fuzzy.vim
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
" color snazzy
" -- molokai
" let g:molokai_original = 1
" let g:rehash256 = 1
" -- solarized
" colorscheme solarized
" -- gruvbox
" let g:gruvbox_sign_colum='bg'
" colorscheme gruvbox



" ==============================================
" ============== Path configure ================
" ==============================================
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'


