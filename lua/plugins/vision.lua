-- indent-blankline.nvim
-- vim-interestingwords
-- todo-comments.nvim
-- vim-better-whitespace
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
    config = function()
      vim.g.interestingWordsDefaultMappings = 0
      vim.g.interestingWordsRandomiseColors = 1
      require('G').map{'n', '<leader>i', ':call InterestingWords(\'n\')<cr>'}
      require('G').map{'v', '<leader>i', ':call InterestingWords(\'v\')<cr>'}
      require('G').map{'n', '<leader>I', ':call UncolorAllWords()<cr>'}
    end,
  },
}
