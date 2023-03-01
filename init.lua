require('profile')  -- 基础配置
require('keymap')   -- 按键配置
require('G')

------ auto cmd  ------
-- open file with last edit postion
vim.cmd[[autocmd BufReadPost * normal! g`"]]

------ lazy.nvim ------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
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

require("lazy").setup("plugins")


------ colorscheme ------
vim.cmd.colorscheme('zephyr')
-- highlight group for LineNr
vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
