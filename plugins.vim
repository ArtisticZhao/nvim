" #########################################################################################
"                              PLUGINS SETTINGS: plugins & language settings
" #########################################################################################


call plug#begin('~/.config/nvim/plugged')
" ==== treesiter: 更好的代码解析
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'glepnir/zephyr-nvim'
" ==== coc.nvim:  更好的补全
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ==== vision:    花狸狐笑
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'kyazdani42/nvim-web-devicons'                 " Recommended (for coloured icons)
    Plug 'akinsho/bufferline.nvim'                      " buffer 状态栏
    Plug 'kyazdani42/nvim-tree.lua'                     " 文件管理器
    Plug 'lukas-reineke/indent-blankline.nvim'          " 缩紧对齐显示
    Plug 'lfv89/vim-interestingwords'                   " 高亮感兴趣的单词
    Plug 'folke/todo-comments.nvim'                     " 高亮todo等
" ==== telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
" ==== speed up
    Plug 'preservim/nerdcommenter'                      " 快速注释
    Plug 'gcmt/wildfire.vim'                            " tab键快速选择textobj
    Plug 'machakann/vim-sandwich'                       " 更快增删改成对的符号
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " 多光标
    Plug 'Vonr/align.nvim'
" ==== enhancement
    Plug 'moll/vim-bbye'                                " 只是关闭buffer但是不推出vim
    Plug 'lewis6991/gitsigns.nvim'                      " git集成
" ==== just for verilog
    Plug 'antoinemadec/vim-verilog-instance', {'for': ['verilog']}
call plug#end()

source ~/.config/nvim/coc.vim

" ==============================================
" ============== colorscheme   =================
" ==============================================
" ----    Plug 'glepnir/zephyr-nvim'
    set background=dark
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
        hi SignColumn ctermbg=NONE guibg=NONE
    endif
    highlight Normal guibg=None ctermbg=None

    " list chars colors.
    " highlight group for "eol"、"extends"、"precedes"
    hi NonText ctermfg=247 guifg=#A73111 cterm=bold gui=bold
    " highlight group for "space", "nbsp", "tab", "trail"
    hi SpecialKey ctermfg=77 guifg=#292A2D


" ==============================================
" ============== plugins configurations ========
" ==============================================
" ----    Plug 'nvim-treesitter/nvim-treesitter'
lua << EOF
    require("nvim-treesitter.install").prefer_git = true  -- Download parsers use git instead of curl.
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {"vim", "lua", "verilog"},
        sync_install = false,
        highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = true,
        },
    }
EOF
" ======================================================================


" ----    Plug 'vim-airline/vim-airline'
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
" ======================================================================


" ----    Plug 'akinsho/bufferline.nvim'
    set termguicolors
lua << EOF
    require("bufferline").setup{
        options = {
            numbers = function(opts)
                return string.format('%s', opts.ordinal)
            end,
            left_mouse_command = "buffer %d",
            close_command = "Bdelete! %d",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "",
                    highlight = "Directory",
                    separator = true -- use a "true" to enable the default, or set your own character
                }
            },
        },
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
" ======================================================================

" ----    Plug 'kyazdani42/nvim-tree.lua'     " 文件管理器
lua << EOF
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup()
EOF
    nnoremap <leader>e <cmd>NvimTreeToggle<cr>
" ======================================================================

" ----    Plug 'lukas-reineke/indent-blankline.nvim'
lua << EOF
    require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    }
EOF
" ======================================================================

" ----    Plug 'lfv89/vim-interestingwords'
    let g:interestingWordsDefaultMappings = 0
    nnoremap <silent> <leader>i :call InterestingWords('n')<cr>
    vnoremap <silent> <leader>i :call InterestingWords('v')<cr>
    nnoremap <silent> <leader>I :call UncolorAllWords()<cr>
    let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
    let g:interestingWordsTermColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
" ======================================================================

" ----    Plug 'folke/todo-comments.nvim'
" TODO:
" FIXME:
lua << EOF
    require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
EOF
    nnoremap <leader>tt <cmd>:TodoTelescope keywords=TODO,FIX<cr>
    nnoremap <leader>tl <cmd>:TodoQuickFix<cr>
" ======================================================================

" ----    Plug 'nvim-telescope/telescope.nvim'
    " Find files using Telescope command-line sugar.
    nnoremap <c-p>      <cmd>Telescope find_files<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" ======================================================================

" ----    Plug 'preservim/nerdcommenter'                      " 快速注释
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
" ======================================================================

" ----    Plug 'gcmt/wildfire.vim'
    map <tab> <Plug>(wildfire-fuel)
    vmap <s-tab> <Plug>(wildfire-water)
" ======================================================================



" ----    Plug 'Vonr/align.nvim'
lua << EOF
    -- align_to_char(length, reverse, preview, marks)
    -- align_to_string(is_pattern, reverse, preview, marks)
    -- align(str, reverse, marks)
    -- operator(fn, opts)
    -- Where:
    --      length: integer
    --      reverse: boolean
    --      preview: boolean
    --      marks: table (e.g. {1, 0, 23, 15})
    --      str: string (can be plaintext or Lua pattern if is_pattern is true)

    local NS = { noremap = true, silent = true }

    vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
    vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
    vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
    vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews
EOF
" ======================================================================

" ----    Plug 'lewis6991/gitsigns.nvim'
lua << EOF
    require('gitsigns').setup()
EOF
" ======================================================================

