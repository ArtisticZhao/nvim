"          __     _____ __  __ ____   ____
"          \ \   / /_ _|  \/  |  _ \ / ___|
"           \ \ / / | || |\/| | |_) | |
"           _\ V /  | || |  | |  _ <| |___
"          (_)\_/  |___|_|  |_|_| \_\\____|
"
"
"
"       |-----------------+--------------------------------------------+------------------|
"       | Category        | Function                                   | KEYMAP           |
"       |-----------------+--------------------------------------------+------------------|
"       | Navigation      | Navigation                                 | h j k l          |
"       |                 | Navigation in i-mode                       | <c-[hjkl]>       |
"       |                 | Speed Navigation                           | J K              |
"       |                 | <Home> <End>                               | H L              |
"       |                 | next/prev word (split by space or ,._=...) | w/b              |
"       |                 | next/prev WORD (split only with sp)        | W/B              |
"       |                 | end of word/WORD                           | e/E              |
"       |                 | jump matchs e.g. { -> }                    | %                |
"       |                 | Find backward/forward a char               | f[x]/F[x]        |
"       |                 | Find next/prev f[x]                        | =/-              |
"       |-----------------+--------------------------------------------+------------------|
"       | Folding         | toggle folding                             | za               |
"       |                 | open/close folding                         | zo zc            |
"       |                 | fold all/ unfold all                       | zM zR            |
"       |                 | toggle fold git diff                       | zg               |
"       |-----------------+--------------------------------------------+------------------|
"       | Insertion       | Insert Mode at cursor                      | i                |
"       |                 | Insert Mode at line header                 | I                |
"       |                 | Insert Mode after cursor                   | a                |
"       |                 | Insert Mode at line tail                   | A                |
"       |                 | Insert Mode with new line below            | o                |
"       |                 | Insert Mode with new line above            | O                |
"       |                 | Insert Mode at insert before               | gi               |
"       |-----------------+--------------------------------------------+------------------|
"       | Edition         | replace a char                             | r                |
"       |                 | replace word under cursor                  | <c-h>            |
"       |                 | search word under cursor (i,n,v-mode)      | <c-f>            |
"       |                 | Copy to Cilpboard                          | Y                |
"       |                 | Paste from Cilpboard                       | P                |
"       |                 | indent/indent leftward                     | >/<              |
"       |                 | Select all                                 | <c-a>            |
"       |                 | change upper/lowercase                     | `                |
"       |                 | add empty row (n-mode)                     | <enter>          |
"       |                 | replace tab with space                     | <sp><tab>        |
"       |-----------------+--------------------------------------------+------------------|
"       | code navigation | go to defination                           | gd               |
"       |                 | goto/goback defination in ctags            | <c-]> <c-t>      |
"       |-----------------+--------------------------------------------+------------------|
"       | Files           | Write file(turn to n-mode when i-mode)     | <c-s>            |
"       |                 | Quit                                       | <c-q>            |
"       |                 | Open Config File                           | <sp>rc           |
"       |                 | Spell Check                                | <sp>sc           |
"       |                 | Go to file                                 | gf               |
"       |-----------------+--------------------------------------------+------------------|
"       | Split Windows   | split windows to                           | <sp>s[hjkl]      |
"       |                 | Splited Windows Navigation                 | <sp>[hjkl]       |
"       |                 | toggle terminal                            | <m-t>            |
"       |-----------------+--------------------------------------------+------------------|
"       | terminal        | toggle terminal                            | <m-t>            |
"       |-----------------+--------------------------------------------+------------------|
"       | Buffer          | jump buffer X(buffer index)                | <sp>X            |
"       |-----------------+--------------------------------------------+------------------|
"       |-----------------+--------------------------------------------+------------------|
"       | easy align      | Align by = (v-mode muti-lines)             | <sp>ga[=]        |
"       |                 | align by first space                       | <sp>ga1<sp>      |
"       |-----------------+--------------------------------------------+------------------|
"       | unto tree       | toggle unto tree                           | <sp>ut           |
"       |-----------------+--------------------------------------------+------------------|
"       | Table Mode      | toggle table mode                          | <sp>tm           |
"       | (use '!'        | table header                               | !A!B!C!          |
"       | represent'\|')  | Dividing line                              | !!(i-mode)       |
"       |                 | Delete Column                              | <l>tdc           |
"       |                 | Insert Column before                       | <l>tiC           |
"       |                 | Insert Column after                        | <l>tic           |
"       |-----------------+--------------------------------------------+------------------|
"       | coc-Snippets    | expand or jump to next placeholder         | <c-d>            |
"       |                 | jump to previous placeholder               | <c-e>            |
"       |-----------------+--------------------------------------------+------------------|
"       | Nerd-Commenter  | comment                                    | <sp>cc           |
"       |                 | uncomment                                  | <sp>cu           |
"       |                 | toggle comment (also work in i-mode)       | <c-/>            |
"       |-----------------+--------------------------------------------+------------------|
"       | git             | stage/unstage on coc-explorer              | <</>>            |
"       |                 | open lazygit                               | <c-g>            |
"       |                 | open graph of commit & branch              | <sp>gb           |
"       |                 | next/prev hunk                             | [h ]h            |
"       |                 | git fold to only show hunks                | zg               |
"       |-----------------+--------------------------------------------+------------------|
"       | fzf             | search file in current directory           | <c-p>            |
"       |                 | search content in file                     | <m-f>            |
"       |                 | search linux kernel doc                    | <F10>            |
"       |-----------------+--------------------------------------------+------------------|
"       | easymotion      | m<char><char><label>                       |                  |
"       |                 | fuzzy search & easymotion                  | <sp>/            |
"       |-----------------+--------------------------------------------+------------------|
"       | incsearch       | fuzzy search                               | z/ or z?         |
"       |-----------------+--------------------------------------------+------------------|
"       | wildfire        | select in "'[(                             | <tab>            |
"       |-----------------+--------------------------------------------+------------------|
"       | sandwich        | add sround in v-mode                       | sa<pairs>        |
"       |                 | add sround with motion                     | eg saiw<pairs>   |
"       |                 | delete sround                              | sdb/sd<pairs>    |
"       |                 | replace sround                             | srb<pairs>       |
"       |                 | replace sround                             | sr<pairs><pairs> |
"       |-----------------+--------------------------------------------+------------------|
"       | multi-cursor    | select word                                | <c-n>            |
"       |                 | create cursor                              | <c-up/down>      |
"       |                 | skip current                               | q                |
"       |-----------------+--------------------------------------------+------------------|
"       | coc-translator  | translate                                  | <l>tr            |
"       | coc-yank        | yank history                               | <l>y             |
"       |-----------------+--------------------------------------------+------------------|
"       | MarkDown        | paste copyed image                         | <l>p             |
"       |-----------------+--------------------------------------------+------------------|
"
"   TODO:
"     - coc-word for comments
"     - resize window -> move the split line
"     - git diff files



" ==============================================
" ============= Auto load for first time uses ==
" ==============================================
if empty(glob('~/.config/nvim/plugged'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ==============================================
" ============== System settings ===============
" ==============================================
set novb
set noeb vb t_vb=
set encoding=utf-8
let &t_ut=''  " cmd color
set autochdir
" enable mouse click
" set mouse=a

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

" ==============================================
" ============== Indentation & Backspace =======
" ==============================================
set expandtab     " 将制表符扩展为空格
set tabstop=4     " 设置编辑时制表符占用空格数
set shiftwidth=4  " 设置格式化时制表符占用空格数
autocmd FileType yaml set shiftwidth=2
set softtabstop=4 " 让vim把连续数量的空格视为一个制表符
set backspace=2   " make bp like normal app


" ==============================================
" ============== Display =======================
" ==============================================
set number
set relativenumber
set cursorline
set showcmd
set wildmenu
set scrolloff=5
" define wrap rules
set nowrap
autocmd FileType markdown set wrap
" show tab and space
set list


" ==============================================
" ============== Search settings ===============
" ==============================================
exec "nohlsearch"
set hlsearch
set incsearch       " search when typing
set ignorecase
set smartcase
set wrapscan        " tail to head search

" -------------- set space as leader key
let mapleader=" "

" ==============================================
" ============== import settings ===============
" ==============================================
" load functions script
source ~/.config/nvim/funcs.vim
" import plugs' settings
source ~/.config/nvim/plugs.vim


" ==============================================
" ============== Key Mappings ==================
" ==============================================

" -------------- Speed Navigation
noremap J 5j
noremap K 5k
noremap H ^
noremap L $
" -------------- B=Navigation on i-mode
imap <c-h> <left>
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>

" -------------- add empty row
noremap <cr> o<esc>

" -------------- change to uppercase
noremap ` ~

" -------------- spell check
map <LEADER>sc :set spell!<CR>

" -------------- save & quit
map <c-q> :q<CR>
map <c-s> :w<CR>
imap <c-s> <esc>:w<CR>

" -------------- Copy to system clipboard
vnoremap Y "+y
nnoremap Y "+yy
noremap  P "+p

" -------------- search & select
" select all
" nmap <c-a> ggVG
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
nnoremap <c-h> <esc>:%s/<c-r><c-w>//g<left><left>
xnoremap <c-h> y<esc>:%s/<c-r>"//g<left><left>
" replace tab with space
nnoremap <leader><tab> <esc>:%ret! 4<cr>
" -------------- Indentation
noremap < <<
noremap > >>
" keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

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

" -------------- buffers
" map tn :tabe<CR>
" map th :-tabnext<CR>
" map tl :tabnext<CR>
map Q :bd<cr>
" -------------- place holder
imap <c-p> <++>  " put a placeholder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" -------------- remap to put -> in C files
au filetype c inoremap <buffer> ` ->
au filetype verilog inoremap <buffer> ` <=

" 让配置变更立即生效, this configure not work well in neoVIM!
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
noremap <LEADER>R :source $MYVIMRC<CR>

" -------------- open neoVIM configure file in new tab
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" -------------- call figlet
map tx :r !figlet


" ==============================================
" ============== MarkDown ======================
" ==============================================
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>


" ==============================================
" ============== Path configure ================
" ==============================================
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'

