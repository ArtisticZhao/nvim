function CWD()
  local dir = vim.fn.expand('%:p:h')
  vim.api.nvim_command('cd ' .. dir)
  require("notify")('Changed working directory to: ' .. dir)
end

vim.api.nvim_command('command! -nargs=0 CWD lua CWD()')

vim.api.nvim_create_user_command('GBK', 'set fileencoding=cp936', {})
vim.api.nvim_create_user_command('UTF8', 'set fileencoding=utf-8', {})
vim.api.nvim_create_user_command('Win', 'set ff=dos', {})
vim.api.nvim_create_user_command('Linux', 'set ff=unix', {})
