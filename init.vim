"          __     _____ __  __ ____   ____
"          \ \   / /_ _|  \/  |  _ \ / ___|
"           \ \ / / | || |\/| | |_) | |
"           _\ V /  | || |  | |  _ <| |___
"          (_)\_/  |___|_|  |_|_| \_\\____|
"
"
"
"      |----------------+--------------------------------------------+-------------|
"      | Category       | Function                                   | KEYMAP      |
"      |----------------+--------------------------------------------+-------------|
"      | Navigation     | Navigation                                 | h j k l     |
"      |                | Speed Navigation                           | J K         |
"      |                | next/prev word (split by space or ,._=...) | w/b         |
"      |                | next/prev WORD (split only with sp)        | W/B         |
"      |                | end of word/WORD                           | e/E         |
"      |                | jump matchs e.g. { -> }                    | %           |
"      |                | Find backward/forward a char               | f[x]/F[x]   |
"      |                | Find next/prev f[x]                        | ;/,         |
"      |----------------+--------------------------------------------+-------------|
"      | Insertion      | Insert Mode at cursor                      | i           |
"      |                | Insert Mode at line header                 | I           |
"      |                | Insert Mode after cursor                   | a           |
"      |                | Insert Mode at line tail                   | A           |
"      |                | Insert Mode with new line below            | o           |
"      |                | Insert Mode with new line above            | O           |
"      |                | Insert Mode at insert before               | gi          |
"      |----------------+--------------------------------------------+-------------|
"      | Edition        | replace a char                             | r           |
"      |                | replace word under cursor                  | <c-g>       |
"      |                | search word under cursor (i,n,v-mode)      | <c-f>       |
"      |                | Copy to Cilpboard                          | Y           |
"      |                | Paste from Cilpboard                       | P           |
"      |                | indent/indent leftward                     | >/<         |
"      |----------------+--------------------------------------------+-------------|
"      | Files          | Write file(turn to n-mode when i-mode)     | <c-s>       |
"      |                | Quit                                       | <c-q>       |
"      |                | Open Config File                           | <sp>RC      |
"      |                | Spell Check                                | <sp>SC      |
"      |                | Go to file                                 | gf          |
"      |----------------+--------------------------------------------+-------------|
"      | Split Windows  | split windows to                           | <sp>s[hjkl] |
"      |                | Splited Windows Navigation                 | <c-[hjkl]>  |
"      |                | toggle terminal                            | <c-t>       |
"      |----------------+--------------------------------------------+-------------|
"      | Align          | Align by = (v-mode muti-lines)             | <sp>ga[=]   |
"      |----------------+--------------------------------------------+-------------|
"      | Table Mode     | toggle table mode                          | <sp>tm      |
"      | (use '!'       | table header                               | !A!B!C!     |
"      | represent'\|') | Dividing line                              | !!(i-mode)  |
"      |                | Delete Column                              | <l>tdc      |
"      |                | Insert Column before                       | <l>tiC      |
"      |                | Insert Column after                        | <l>tic      |
"      |----------------+--------------------------------------------+-------------|
"      | coc-Snippets   | expand or jump to next placeholder         | <c-d>       |
"      |                | jump to previous placeholder               | <c-e>       |
"      |----------------+--------------------------------------------+-------------|
"      | Nerd-Commenter | comment                                    | <sp>cc      |
"      |                | uncomment                                  | <sp>cu      |
"      |                | toggle comment (also work in i-mode)       | <c-/>       |
"      |----------------+--------------------------------------------+-------------|
"
"   TODO:
"     - <sp>rc open file in current buffer if empty;
"     - resize window -> move the split line



" ==============================================
" ============= Auto load for first time uses ==
" ==============================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ==============================================
" ============== System settings ===============
" ==============================================
set encoding=utf-8
let &t_ut=''  " cmd color
if (getcwd() != '/home/lilacsat/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek')
    set autochdir
else
    echo "Work on kerel dir"
endif

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" open file with last edit postion
autocmd BufReadPost * normal! g`"


" ==============================================
" ============== Indentation & Backspace =======
" ==============================================
set expandtab     " 将制表符扩展为空格
set tabstop=4     " 设置编辑时制表符占用空格数
set shiftwidth=4  " 设置格式化时制表符占用空格数
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
set nowrap
" See [http://vim.wikia.com/wiki/Highlight_unwanted_spaces]
" - highlight trailing whitespace in red
" - have this highlighting not appear whilst you are typing in insert mode
" - have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches() " for performance


" ==============================================
" ============== Search settings ===============
" ==============================================
set hlsearch
set incsearch       " search when typing
exec "nohlsearch"
set ignorecase
set smartcase
set wrapscan        " tail to head search


" ==============================================
" ============== Key Mappings ==================
" ==============================================
let mapleader=" "
" -------------- Speed Navigation
noremap J 5j
noremap K 5k
" -------------- spell check
map <LEADER>sc :set spell!<CR>
" -------------- save & quit
map <c-q> :q<CR>
map Q :q<cr>
map <c-s> :w<CR>
imap <c-s> <esc>:w<CR>
" -------------- open file under cursor in new tab
noremap gf <c-w>gf
" -------------- Copy to system clipboard
vnoremap Y "+y
nnoremap Y "+yy
noremap  P "+p
" -------------- search select
vnoremap / y/<c-r>"<cr>
" find word under cursor
nnoremap <c-f> /<c-r><c-w><cr>
inoremap <c-f> <esc>/<c-r><c-w><cr>
xnoremap <c-f> y/<c-r>"<cr>
" -------------- replace current word
inoremap <c-g> <esc>:%s/<c-r><c-w>//g<left><left>
nnoremap <c-g> <esc>:%s/<c-r><c-w>//g<left><left>
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
map <c-h> <C-w>h
map <c-j> <C-w>j
map <c-k> <C-w>k
map <c-l> <C-w>l
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize+5<CR>
map <C-right> :vertical resize-5<CR>
" -------------- tabs
map tn :tabe<CR>  " tab new
map th :-tabnext<CR>
map tl :tabnext<CR>
" -------------- place holder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l


" ==============================================
" ============== Key Shortcuts =================
" ==============================================
" 让配置变更立即生效, this configure not work well in neoVIM!
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
noremap <LEADER>R :source $MYVIMRC<CR>
" -------------- open neoVIM configure file in new tab
map <LEADER>rc :tabnew  ~/.config/nvim/init.vim<CR>
" -------------- open device tree only work on kernel dir
function! OpenDeviceTree()
    if getcwd()=="/home/lilacsat/learn_linux/kernel/linux-imx-rel_imx_4.1.15_2.1.0_ga_alientek"
        :tabnew ./arch/arm/boot/dts/imx6ull-alientek-emmc.dts
    else
        echo getcwd()
    endif
endfunction
map <LEADER>dt :call OpenDeviceTree()<CR>
" call figlet
map tx :r !figlet
" no highlight for search
noremap <LEADER><CR> :nohlsearch<CR>


" ==============================================
" ============== Terminal Window ===============
" ==============================================
let g:term_buf = 0
let g:term_win = 0
function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
" CTRL + t to toggle terminal wimdow
nnoremap <C-t> :call Term_toggle(10)<cr>
tnoremap <C-t> <C-\><C-n>:call Term_toggle(10)<cr>
" <ESC> Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
" When switching to terminal windows it goes into insert mode automatically
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" navigate windows in terminal mode
tmap <C-h> <C-\><C-n><C-w>h
tmap <C-j> <C-\><C-n><C-w>j
tmap <C-k> <C-\><C-n><C-w>k
tmap <C-l> <C-\><C-n><C-w>l
" resize window in terminal mode
tmap <C-up> <C-\><C-n>:res +5<CR>i
tmap <C-down> <C-\><C-n>:res -5<CR>i
tmap <C-left> <C-\><C-n>:vertical resize+5<CR>i
tmap <C-right> <C-\><C-n>:vertical resize-5<CR>i


" ==============================================
" ============== Path configure ================
" ==============================================
let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2.7'


" ==============================================
" ============== import settings ===============
" ==============================================
" import plugs' settings
source ~/.config/nvim/plugs.vim
" import coc's settings in vim
source ~/.config/nvim/coc.vim