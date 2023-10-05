local G = {}

function G.icon()
  return {
        error = '✘ ',
        warn = '▲ ',
        info = ' ',
        hint = ' '
      }
end

function G.map(key)
  -- ref https://blog.csdn.net/qq_39785418/article/details/123767872
  -- @func: define map function set noremap as default
  -- @Usage: map{'n', '<Leader>w', ':write<CR>'}
  --        map {'n', '<Leader>e', '%', noremap =false}
  --get the extra options 设置默认选项
  local opts = { noremap = true }
  for i, v in pairs(key) do
    if type(i) == 'string' then
      opts[i] = v
    end
  end

  -- basic support for buffer-scoped keybindings
  -- 缓冲区作用域键绑定的基本支持
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end


function G.cmd(cmd)
  vim.api.nvim_command(cmd)
end


function G.ReloadConfig()
  package.loaded['G'] = nil
  package.loaded['profile'] = nil
  package.loaded['keymap'] = nil

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
vim.cmd('command! ReloadConfig lua require(\'G\').ReloadConfig()') -- register ReloadConfig cmd
return G
