-- indent-blankline.nvim
-- vim-interestingwords
-- vim-better-whitespace
-- todo-comments.nvim
return {
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
  { "lfv89/vim-interestingwords",
    keys = {
      { '<leader>i', desc = "Interstring Words" },
      { '<leader>i', mode = 'v', desc = "Interstring Words" },
    },
    config = function()
      vim.g.interestingWordsDefaultMappings = 0
      vim.g.interestingWordsRandomiseColors = 1
      require('G').map{'n', '<leader>i', ':call InterestingWords(\'n\')<cr>'}
      require('G').map{'v', '<leader>i', ':call InterestingWords(\'v\')<cr>'}
      require('G').map{'n', '<leader>I', ':call UncolorAllWords()<cr>'}
    end,
  },
--------- vim-better-whitespace ---------
  "ntpeters/vim-better-whitespace",

--------- todo-comments.nvim    ---------
  { "folke/todo-comments.nvim",
    lazy = false,
    keys = {
      { '<leader>tt', '<cmd>TodoTelescope keywords=TODO,FIX<cr>', desc = 'telescope todo list' },
      { '<leader>tl', '<cmd>TodoQuickFix<cr>', desc = 'quickfix todo list' },
    },
    config = function()
      require("todo-comments").setup {}
    end,
  },
}
