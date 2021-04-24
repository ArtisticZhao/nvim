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
set showbreak=↪
set listchars=tab:▸\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
"eol:↲,

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
noremap L g_
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
xmap <c-s> <esc>:w<CR>
vmap <c-s> <esc>:w<CR>
" -------------- Copy to system clipboard
vnoremap Y "+y
nnoremap Y "+yy
noremap  P "+p
" Don't lose clipboard when pasting
vnoremap p pgvy
" -------------- search & select
" find word under cursor use Incsearch plugin
nmap <c-f> /<c-r><c-w><cr>
imap <c-f> <esc>/<c-r><c-w><cr>
" open a quickfix windwos for the last search
nmap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
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
vnoremap <silent> <c-h> :call EscapedSearch()<CR>:call CmdLine("%s".'/'.@/.'/'.@/)<CR>
nnoremap <silent> <c-h> viw:call EscapedSearch()<CR>:call CmdLine("%s".'/'.@/.'/'.@/)<CR>
" nnoremap <c-h> <esc>:%s/<c-r><c-w>//g<left><left> asd
" xnoremap <c-h> y<esc>:%s/<c-r>"//g<left><left> asd
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
" put a placeholder
imap <c-p> <++>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" -------------- spell check
map <LEADER>sc :set spell!<CR>
" -------------- split window
" open split window
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sh :set nosplitright<CR>:vsplit<CR>
map <LEADER>sk :set nosplitbelow<CR>:split<CR>
map <LEADER>sj :set splitbelow<CR>:split<CR>
map <LEADER>s= <c-w>=
" move around splited windows
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
" switch two splited windows
map <LEADER>sr <c-w><c-r>
" change width and height of splited windows
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> <c-w>10>
map <C-right> <c-w>10<
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
    Plug 'yianwillis/vimcdoc'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " colortheme
    " Plug 'connorholyday/vim-snazzy'
    " Plug 'altercation/vim-colors-solarized'
    Plug 'morhetz/gruvbox'
    Plug 'patstockwell/vim-monokai-tasty'
    " vision
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/vim-peekaboo'
    Plug 'airblade/vim-gitgutter'
    " speed
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    Plug 'gcmt/wildfire.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'lambdalisue/suda.vim'
    Plug 'easymotion/vim-easymotion'
        let g:suda_smart_edit = 1
    " enhance
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
        nnoremap <LEADER>tm :TableModeToggle<CR>
    Plug 'lfv89/vim-interestingwords'
    " functions
    Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'

    " markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}
    Plug 'ferrine/md-img-paste.vim', {'for': ['markdown']}
    " latex
    Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}
    " tools
    Plug 'ZSaberLv0/ZFVimDirDiff', {'on': 'ZFDirDiff'}
call plug#end()


" ==============================================
" ============== colorscheme   =================
" ==============================================
set background=dark
" -- snazzy
" color snazzy
" -- molokai
colorscheme vim-monokai-tasty
" -- solarized
" colorscheme solarized
" -- gruvbox
" let g:gruvbox_sign_colum='bg'
" colorscheme gruvbox

highlight Normal guibg=None ctermbg=None
" ==============================================
" ============== plugins configs ===============
" ==============================================
" -------------- neoclide/coc.nvim
source ~/.config/nvim/coc.vim


" -------------- vim-airline/vim-airline vim-airline/vim-airline-themes
let g:airline_powerline_fonts = 1
" let g:airline_theme="deus"
let g:airline_theme='monokai_tasty'
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


" -------------- gcmt/wildfire.vim
map <tab> <Plug>(wildfire-fuel)
vmap <s-tab> <Plug>(wildfire-water)


" -------------- jiangmiao/auto-pairs
au Filetype c       let b:AutoPairs={'(':')', '[':']', '{':'}', "'":"'", '"':'"', '"""':'"""', "'''":"'''"}
au Filetype verilog let b:AutoPairs={'(':')', '[':']', '{':'}', "'":"'", '"':'"', '"""':'"""', "'''":"'''"}
" don't map the <c-h> to backspace in insert mode
let g:AutoPairsMapCh = 0


" -------------- mbbill/undotree
map <LEADER>ut :UndotreeToggle<CR>


" -------------- airblade/vim-gitgutter
" use configured color not use color in colortheme
let g:gitgutter_override_sign_column_highlight = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#0c7d9d ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" light signcolumn transparent
highlight SignColumn ctermbg=252 guibg=none
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
" jump to git gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nnoremap zg :GitGutterFold<cr>


" -------------- junegunn/fzf
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5 } }
nmap <c-p> :Files<cr>
nmap <m-f> :Ag<cr>


" -------------- voldikss/vim-floaterm
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=cyan guifg=orange
" Set keymap
tnoremap <silent> <c-q> <c-\><c-n>:FloatermKill<cr>
" Esc in terminal
tnoremap <silent> <c-d> <c-\><c-n>
" CTRL + t to toggle terminal wimdow
nnoremap <silent> <m-t> :FloatermToggle quick<cr>
tnoremap <silent> <m-t> <C-\><C-n>:FloatermToggle quick<cr>
" call lazygit in floaterm
nnoremap <C-g> :FloatermNew! --height=0.8 --width=0.9 --wintype=floating --name=lg --position=topleft --autoclose=2 lazygit<cr>


" -------------- easymotion/vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" Need one more keystroke, but on average, it may be more comfortable.
nmap m <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <c-j> <Plug>(easymotion-j)
map <c-k> <Plug>(easymotion-k)


" -------------- ferrine/md-img-paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

" -------------- remap to put -> in C files
au filetype c inoremap <buffer> ` ->
au filetype verilog inoremap <buffer> ` <=

" -------------- call figlet
map tx :r !figlet





" ==============================================
" ============== Path configure ================
" ==============================================
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'
