require('profile')  -- 基础配置
require('keymap')   -- 按键配置
require('autocmd')  -- 自动命令
require('cmd')      -- 自定义命令
require('G')


------ lazy.nvim ------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
-- vim.lsp.set_log_level("debug")

-- require('lazy').setup({
--   {'folke/tokyonight.nvim'},
--   {'williamboman/mason.nvim'},
--   {'williamboman/mason-lspconfig.nvim'},
--   {'windwp/nvim-autopairs',
--     event = "InsertEnter",
--     opts = {} -- this is equalent to setup({}) function
--   },
--   {
--     "ray-x/lsp_signature.nvim",
--     event = "VeryLazy",
--     opts = {},
--     config = function(_, opts) require'lsp_signature'.setup(opts) end
--   },
--   {
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'v3.x',
--     lazy = true,
--     config = false,
--   },
--   -- LSP Support
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       {'hrsh7th/cmp-nvim-lsp'},
--     }
--   },
--   -- Autocompletion
--   {
--     'hrsh7th/nvim-cmp',
--     dependencies = {
--       {'L3MON4D3/LuaSnip',
--        'hrsh7th/cmp-nvim-lsp-signature-help',}
--     },
--   },
-- })
-- 
-- -- Set colorscheme
-- vim.opt.termguicolors = true
-- vim.cmd.colorscheme('tokyonight')
-- 
-- ---
-- -- LSP setup
-- ---
-- local lsp_zero = require('lsp-zero')
-- 
-- lsp_zero.on_attach(function(client, bufnr)
--   -- see :help lsp-zero-keybindings
--   -- to learn the available actions
--   lsp_zero.default_keymaps({buffer = bufnr})
-- end)
-- 
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       -- (Optional) configure lua language server
--       local lua_opts = lsp_zero.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   }
-- })
-- 
-- ---
-- -- Autocompletion config
-- ---
-- local cmp = require('cmp')
-- local cmp_action = lsp_zero.cmp_action()
-- 
-- cmp.setup({
--   snippet = {
--     -- REQUIRED - you must specify a snippet engine
--     expand = function(args)
--       -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--       -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--       -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     -- `Enter` key to confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
-- 
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
-- 
--     -- Navigate between snippet placeholder
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
-- 
--     -- Scroll up and down in the completion documentation
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-d>'] = cmp.mapping.scroll_docs(4),
--   })
-- })

------ colorscheme ------
--vim.cmd.colorscheme('zephyr')
---- highlight group for LineNr
--vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
--vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
--vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
