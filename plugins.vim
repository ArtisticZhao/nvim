" #########################################################################################
"                              PLUGINS SETTINGS: plugins & language settings
" #########################################################################################
"
" ============= Auto load for first time uses ==
if empty(glob('~/.config/nvim/plugged'))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================================
" ============== plugins =======================
" ==============================================
call plug#begin('~/.config/nvim/plugged')
    Plug 'yianwillis/vimcdoc'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale', {'for': ['verilog']}

    " ====== colortheme ======
    " Plug 'connorholyday/vim-snazzy'
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'morhetz/gruvbox'
    " Plug 'patstockwell/vim-monokai-tasty'
    " ====== treesitter ======
    Plug 'glepnir/zephyr-nvim'
    " Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'romgrk/nvim-treesitter-context'
    " ====== vision ======
    Plug 'lukas-reineke/indent-blankline.nvim'
    " Plug 'xiyaowong/nvim-cursorword'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'akinsho/bufferline.nvim'
    " Plug 'luochen1990/rainbow'
    Plug 'sakshamgupta05/vim-todo-highlight'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/vim-peekaboo'
    Plug 'airblade/vim-gitgutter'
    Plug 'skywind3000/vim-quickui'
    " speed
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    Plug 'gcmt/wildfire.vim'
    Plug 'machakann/vim-sandwich'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'lambdalisue/suda.vim'
        let g:suda_smart_edit = 1
    Plug 'easymotion/vim-easymotion'
    " enhance
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
        nnoremap <LEADER>tm :TableModeToggle<CR>
    Plug 'lfv89/vim-interestingwords'
    " functions
    Plug 'mbbill/undotree',
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'
    " telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'ferrine/md-img-paste.vim', {'for': ['markdown']}

    " latex
    Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}

    " tools
    " Plug 'ZSaberLv0/ZFVimDirDiff', {'on': 'ZFDirDiff'}
    Plug 'lyokha/vim-xkbswitch'
    Plug 'zhaocai/DirDiff.vim'
    " Plug 'will133/vim-dirdiff'
call plug#end()


" ==============================================
" ============== colorscheme   =================
" ==============================================
set background=dark
" -- snazzy
" color snazzy
" -- molokai
" colorscheme vim-monokai-tasty
" -- solarized
" colorscheme solarized
" -- gruvbox
" let g:gruvbox_sign_colum='bg'
" colorscheme gruvbox
" -- zephyr
colorscheme zephyr
" highlight group for LineNr
hi LineNr ctermfg=gray guifg=silver
hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold
" -- nvcode-color-schemes
" colorscheme nvcode
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
highlight Normal guibg=None ctermbg=None

" list chars colors.
" highlight group for "eol"、"extends"、"precedes"
hi NonText ctermfg=247 guifg=#A73111 cterm=bold gui=bold
" highlight group for "space", "nbsp", "tab", "trail"
hi SpecialKey ctermfg=77 guifg=#292A2D

" ==============================================
" ============== plugins configs ===============
" ==============================================
" -------------- neoclide/coc.nvim
source ~/.config/nvim/coc.vim

" -------------- nvim-treesitter/nvim-treesitter
lua <<EOF
require("nvim-treesitter.install").prefer_git = true  -- Download parsers use git instead of curl.
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "python", "cpp", "bash", "bibtex", "cmake", "latex", "scala", "verilog", "vim", "yaml"},
    sync_install = false,
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
    }
}
EOF
" fold with treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

hi TreesitterContext guibg=#59788E

" -------------- lukas-reineke/indent-blankline.nvim
lua <<EOF
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF
" -------------- vim-airline/vim-airline vim-airline/vim-airline-themes
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" change the tabline display format.
" this format only show the short dir when filename is not unique
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" disable tabline to show buffers
let g:airline#extensions#tabline#enabled = 0
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


" -------------- bufferline.nvim
" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{
options = {
    numbers = function(opts)
        return string.format('%s', opts.ordinal)
    end,
    left_mouse_command = "buffer %d",
    }
}
EOF
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" -------------- glepnir/galaxyline.nvim
" function! ConfigStatusLine()
"   lua require('plugins.status-line')
" endfunction
"
" augroup status_line_init
"   autocmd!
"   autocmd VimEnter * call ConfigStatusLine()
" augroup END

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
au Filetype verilog let b:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', '"""':'"""', "'''":"'''"}

" don't map the <c-h> to backspace in insert mode
let g:AutoPairsMapCh = 0


" -------------- lfv89/vim-interestingwords
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>i :call InterestingWords('n')<cr>
vnoremap <silent> <leader>i :call InterestingWords('v')<cr>
nnoremap <silent> <leader>I :call UncolorAllWords()<cr>

nnoremap <silent> <leader>n :call WordNavigation(1)<cr>
nnoremap <silent> <leader>N :call WordNavigation(0)<cr>


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

" -------------- skywind3000/vim-quickui
source ~/.config/nvim/menu.vim

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


" -------------- nvim-telescope/telescope.nvim
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


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


" -------------- lervag/vimtex
let g:vimtex_view_method= 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
let g:vimtex_compiler_progname = 'nvr'
let g:Tex_GotoError=0

" 隐藏一些常见错误
let g:vimtex_quickfix_ignore_filters = [
            \'.*Package fontspec Warning.*',
            \]

let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'

" -------------- remap to put -> in C files
au filetype c inoremap <buffer> ` ->
au filetype verilog inoremap <buffer> ` <=

" -------------- call figlet
map tx :r !figlet

