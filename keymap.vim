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
nmap <CR> :a<CR><CR>.<CR>
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
" open a quickfix windows for the last search
nmap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" find selected string with escape mode
vnoremap <silent> <c-f> :<C-u>call EscapedSearch()<CR>/<C-R>=@/<CR><CR>n
" n for search down N for search up
nmap <silent> n /<CR>zz
nmap <silent> N ?<CR>zz
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
map Q :Bdelete<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bNext<cr>
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
" show highlight group name
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


