
vim.o.shiftwidth  = 2    -- 设置格式化时制表符占用空格数
vim.o.wrap = true

-- First, let's define a helper function to simplify things
local function buf_inoremap(lhs, rhs)
    vim.api.nvim_buf_set_keymap(0, 'i', lhs, rhs, {noremap = true, silent = true})
end

-- Now let's use that function to set the keymaps
-- replace a placeholder
buf_inoremap(',f', '<Esc>/<++><CR>:nohlsearch<CR>c4l')
-- bold
buf_inoremap(',b', '**** <++><Esc>F*hi')
-- delete line
buf_inoremap(',s', '~~~~ <++><Esc>F~hi')
-- italy
buf_inoremap(',i', '** <++><Esc>F*i')
-- code
buf_inoremap(',d', '`` <++><Esc>F`i')
buf_inoremap(',c', '```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA')
-- picture
buf_inoremap(',p', '![](<++>) <++><Esc>F[a')
-- url
buf_inoremap(',u', '[](<++>) <++><Esc>F[a')
-- headers
buf_inoremap(',1', '#<Space><Enter><++><Esc>kA')
buf_inoremap(',2', '##<Space><Enter><++><Esc>kA')
buf_inoremap(',3', '###<Space><Enter><++><Esc>kA')
buf_inoremap(',4', '####<Space><Enter><++><Esc>kA')
-- spliter
buf_inoremap(',l', '--------<Enter>')
