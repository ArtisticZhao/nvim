-- mhartington/oceanic-next
-- glepnir/zephyr-nvim

-- indent-blankline.nvim
-- vim-interestingwords
-- vim-better-whitespace
-- todo-comments.nvim


return {
--------- zephyr.nvim ---------
-- { "glepnir/zephyr-nvim",
--   config = function()
--     vim.cmd.colorscheme 'zephyr'
--     -- highlight group for LineNr
--     vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
--     vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
--     vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
--   end,
-- },

--------- OceanicNext ---------
  { "mhartington/oceanic-next",
    config = function()
      vim.cmd.colorscheme 'OceanicNext'
      vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
      vim.cmd[[hi LineNr guibg=NONE ctermbg=NONE]]
      vim.cmd[[hi SignColumn guibg=NONE ctermbg=NONE]]
      vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
     end,
  },

--------- indent-blankline.nvim --------- 缩进对齐显示
  { "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "NvimTree", },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

--------- vim-interestingwords ---------
  { "Mr-LLLLL/interestingwords.nvim",
    keys = {
      { '<leader>i', desc = "Interstringwords" },
      { '<leader>i', mode = "v", desc = "Interstringwords" },
      { '<leader>I', desc = "Clear all interestingwords" },
      { '<leader>m', desc = "Toggle search interestingwords" },
      { '<leader>M', desc = "Cancel all search interestingwords" },
    },
    opts = {
      colors = { '#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', '#aeee00', '#b88823', '#ffa724', '#ff2c4b' },
      search_count = true,
      navigation = true,
      search_key = "<leader>m",
      cancel_search_key = "<leader>M",
      color_key = "<leader>i",
      cancel_color_key = "<leader>I",
    },

  },
--------- vim-better-whitespace ---------
  { "ntpeters/vim-better-whitespace",
    event = { "BufReadPost", "BufNewFile", },
    keys = {
      { "<leader>sw", '<cmd>StripWhitespace<cr>', desc = 'Deleta all white space on tail.' },
    },
  },

--------- todo-comments.nvim    ---------
  { "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile", },
    keys = {
      { '<leader>tt', '<cmd>TodoTelescope keywords=TODO,FIX,WARN,NOTE<cr>', desc = 'telescope todo list' },
      { '<leader>tl', '<cmd>TodoQuickFix<cr>', desc = 'quickfix todo list' },
      { ']t', '<cmd>lua require("todo-comments").jump_next()<cr>', desc = 'Next todo comment' },
      { '[t', '<cmd>lua require("todo-comments").jump_prev()<cr>', desc = 'Previous todo comment' },
    },
    opts = {
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "WARN" } },
    },
  },
}
