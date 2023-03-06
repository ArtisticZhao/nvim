--=================================================--
--         __     _____ __  __ ____   ____         --
--         \ \   / /_ _|  \/  |  _ \ / ___|        --
--          \ \ / / | || |\/| | |_) | |            --
--          _\ V /  | || |  | |  _ <| |___         --
--         (_)\_/  |___|_|  |_|_| \_\\____|        --
--=================================================--


---- ============== Indentation & Backspace =======
vim.o.expandtab   = true -- 将制表符扩展为空格
vim.o.tabstop     = 4    -- 设置编辑时制表符占用空格数
vim.o.shiftwidth  = 4    -- 设置格式化时制表符占用空格数
vim.o.softtabstop = 4    -- 把连续数量的空格视为一个tab
vim.opt.autoindent = true
vim.opt.smartindent = true


---- ============== Display =======================
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.scrolloff      = 5
vim.opt.wrap           = false
vim.opt.showcmd        = true
---- 空白字符显示
vim.opt.showbreak = ↪
vim.opt.listchars = { space='⋅', nbsp='␣', eol='↲', trail='•', extends='»', precedes='«', tab='→  ' }
vim.opt.list      = true


---- ============== Search settings ===============
vim.opt.incsearch  = true
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.wrapscan   = true   -- 循环搜索


---- ============== folding =======================
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false


---- ============== MISC    =======================
vim.o.fileencodings = "utf-8,cp936" -- 文件编码, 自动检测GBK
vim.o.mouse         = "a"           -- 鼠标操作
vim.opt.virtualedit = 'block'       -- v-mode can select anywhere

vim.g.python3_host_prog = '/opt/homebrew/bin/python3.10'
