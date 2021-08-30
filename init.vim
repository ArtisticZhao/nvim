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
" enable mouse click
set mouse=a

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" open file with last edit postion
autocmd BufReadPost * normal! g`"

" 基于缩进或语法进行代码折叠
set foldmethod=marker
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
" imap <c-f> <esc>/<c-r><c-w><cr>
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
map <LEADER>pl :e ~/.config/nvim/plugins.vim<CR>
" Reload VIMRC
noremap <LEADER>R :source $MYVIMRC<CR>


" ==============================================
" ============== Plugin configure ==============
" ==============================================
source ~/.config/nvim/plugins.vim
" load functions script
source ~/.config/nvim/funcs.vim


" ==============================================
" ============== Path configure ================
" ==============================================
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'
