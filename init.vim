" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


filetype on
filetype indent on 
filetype plugin on
filetype plugin indent on

set encoding=utf-8
let &t_ut=''  " cmd color

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

set backspace=2 " make bp like normal app

let mapleader=" "
syntax on

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
noremap R :source $MYVIMRC<CR>

set number
set relativenumber

" speed navi
noremap J 5j
noremap K 5k

set cursorline
set showcmd
set wildmenu

set scrolloff=5

" open configure file
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" spell check 
map <LEADER>sc :set spell!<CR>

" call figlet
map tx :r !figlet

" search
set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>

" save & quit
map Q :q<CR>
map W :w<CR>

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

" ==================terminal window=======================
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


" code folder
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" place holder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Plugs
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
" commenter 
Plug 'preservim/nerdcommenter'
" undo tree
Plug 'mbbill/undotree'
" Auto Complete
" Plug 'Valloric/YouCompleteMe'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/vim-easy-align'
call plug#end()


color snazzy



" ==============================================
" ============== easy Align ====================
" ==============================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ==============================================
" ============== NERD-Commenter ================
" ==============================================
" KEY MAP: <L>cc comment; <L>cu uncomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" ==============================================
" ============== undo-tree =====================
" ==============================================
map <LEADER>ut :UndotreeToggle<CR>


" ==============================================
" ============== coc-config ====================
" ==============================================
let g:coc_global_extensions = [
            \ 'coc-json',
            \'coc-vimlsp',
            \'coc-explorer',
            \'coc-clangd'
            \] 
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-l> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-l> coc#refresh()
else
  inoremap <silent><expr> <c-l> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <l>h to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" =================================================
" ==================== coc-explorer ===============
" =================================================
nnoremap <leader>e :CocCommand explorer<CR>

" =================================================
" ==================== cxx-highlight ==============
" =================================================
let g:lsp_cxx_hl_use_text_props = 1
