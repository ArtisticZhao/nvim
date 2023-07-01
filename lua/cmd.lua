function CWD()
  local dir = vim.fn.expand('%:p:h')
  vim.api.nvim_command('cd ' .. dir)
  -- print('Changed working directory to: ' .. dir)
  require("notify")('Changed working directory to: ' .. dir)
end

vim.api.nvim_command('command! -nargs=0 CWD lua CWD()')
