local G = {}

G.g = vim.g
G.b = vim.b
G.o = vim.o
G.fn = vim.fn
G.api = vim.api

-- function G.map(maps)
--     for _,map in pairs(maps) do
--         G.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
--     end
-- end

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

function G.hi(hls)
    for group,color in pairs(hls) do
        local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
        local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
        local sp = color.sp and ' cterm=' .. color.sp or ''
        G.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
    end
end

function G.cmd(cmd)
    G.api.nvim_command(cmd)
end

function G.exec(c)
    G.api.nvim_exec(c)
end

function G.eval(c)
    return G.api.nvim_eval(c)
end

return G
