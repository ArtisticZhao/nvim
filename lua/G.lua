local G = {}

function G.icon()
  return {
        error = '✘ ',
        warn = '▲ ',
        info = ' ',
        hint = ' '
      }
end

function G.noremap(mode, key, func, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, key, func, opts)
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


--- @berief get OS type
--- @returns 'mac' 'wsl' 'win' linux'
function G.whichOS()
  local uname = vim.loop.os_uname().sysname

  -- 检查是否在 WSL 下运行
  if uname == "Linux" then
    local handle = io.popen("cat /proc/version")
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result:match("Microsoft") then
        return 'wsl'
      else
        return 'linux'
      end
    end
  elseif uname == "Darwin" then
    return 'mac'
  else
    vim.notify("failed to detect system type!", vim.log.levels.ERROR)
    return 'other'
  end
end

function G.cmd(cmd)
  vim.api.nvim_command(cmd)
end


function G.isZTE()
    local username
    local the_os = G.whichOS()
    if the_os == 'wsl' then -- WSL process
      -- work on wsl, decide by git user.email
      local handle = io.popen("git config --global user.email")
      if handle then
        local result = handle:read("*a")
        handle:close()
        local git_email =  result:match( "^%s*(.-)%s*$" )  -- 去掉前后的空白字符
        if git_email then
          if git_email:match('zte.com.cn') ~= nil then
            return true
          end
          return false
        else
          vim.notify("isZTE cannot detect by WSL git config!", vim.log.levels.ERROR)
          return false
        end
      else
        vim.notify("isZTE cannot detect by WSL git config!", vim.log.levels.ERROR)
        return false
      end
    elseif the_os == 'win' then  -- Windows
        username = os.getenv("USERNAME")
    else  -- Unix-like
        local handle = io.popen("whoami")
        if handle then
            username = handle:read("*a")
            handle:close()
            -- 去除末尾的换行符
            username = username:gsub("\n", "")
        end
    end
    if username then
        -- 判断是否包含八个连续的数字
        if username:match('%d%d%d%d%d%d%d%d') ~= nil then
            return true
        end
    end
    return false
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
