"          __     _____ __  __ ____   ____
"          \ \   / /_ _|  \/  |  _ \ / ___|
"           \ \ / / | || |\/| | |_) | |
"           _\ V /  | || |  | |  _ <| |___
"          (_)\_/  |___|_|  |_|_| \_\\____|
"  |----------------------+-------------------|
"  | Function             | Key Map           |
"  |----------------------+-------------------|
"  | Moving               | h j k l           |
"  | Speed Navigate       | J K               |
"  | Quit                 | Q                 |
"  | Write file           | W                 |
"  | Open Config File     | <sp>RC            |
"  | Spell Check          | <sp>SC            |
"  | Go to file           | gf                |
"  | Copy to Cilpboard    | Y(in visual mode) |
"  | splite windows to    | <sp>s[hjkl]       |
"  | Move curse to window | <c-[hjkl]>        |
"  | toggle terminal      | <c-t>             |
"  |----------------------+-------------------|
" ==============================================
" ============== Auto loa for first time uses ==
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
set autochdir

syntax on
filetype on
filetype indent on 
filetype plugin on
filetype plugin indent on


" ==============================================
" ============== Indentation & Backspace =======
" ==============================================
set expandtab     " 将制表符扩展为空格
set tabstop=4     " 设置编辑时制表符占用空格数
set shiftwidth=4  " 设置格式化时制表符占用空格数
set softtabstop=4 " 让 vim 把连续数量的空格视为一个制表符
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


" ==============================================
" ============== Search settings ===============
" ==============================================
set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase


" ==============================================
" ============== Key Mappings ==================
" ==============================================
let mapleader=" "

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
noremap R :source $MYVIMRC<CR>

" speed navi
noremap J 5j
noremap K 5k

" open configure file
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" spell check 
map <LEADER>sc :set spell!<CR>

" call figlet
map tx :r !figlet

" no highlight for search
noremap <LEADER><CR> :nohlsearch<CR>

" save & quit
map Q :q<CR>
map W :w<CR>

" Copy to system clipboard
vnoremap Y "+y

" Indentation
noremap < <<
noremap > >>

" split
map <LEADER>sl :set splitright<CR>:vsplit<CR>
map <LEADER>sh :set nosplitright<CR>:vsplit<CR>
map <LEADER>sk :set nosplitbelow<CR>:split<CR>
map <LEADER>sj :set splitbelow<CR>:split<CR>
map <C-h> <C-w>h  
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize+5<CR>
map <C-right> :vertical resize-5<CR>

" tabs
map tn :tabe<CR>  " tab new
map th :-tabnext<CR>
map tl :tabnext<CR>

" place holder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l


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


" ==============================================
" ============== import settings ===============
" ==============================================
" import plugs' settings 
source ~/.config/nvim/plugs.vim
" import coc's settings in vim
source ~/.config/nvim/coc.vim
