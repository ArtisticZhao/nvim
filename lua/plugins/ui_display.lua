-- yanky.nvim              |  yank enhance
-- rainbow-delimiters      |  rainbow buckets
-- indent-blankline.nvim   |  indent indicator
-- vim-better-whitespace   |  highlight whitespace on tail
-- vim-illuminate          |  highlight under cursor
-- nvim-colorizer.lua      |  色彩标签
-- nvim-scrollbar          |  display a scrollbar

return {
----------- yanky.nvim -----------
  { "gbprod/yanky.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
          ignore_registers = { "_" },
        },
        system_clipboard = {
          sync_with_ring = true,
        },
        -- keep cursor postion
        preserve_cursor_position = {
          enabled = true,
        },
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
      })
      -- yank highlight
      vim.keymap.set({"n", "x"}, "y", "<Plug>(YankyYank)")
      -- yank ring
      vim.keymap.set("n", "<leader>yn", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<leader>yp", "<Plug>(YankyCycleBackward)")
      -- yank history
      vim.keymap.set("n", "<leader>yh", ":Telescope yank_history<CR>")
      -- put highlight
      vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)gvy")
      require("telescope").load_extension("yank_history")
    end
  },

  { "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
--------- indent-blankline.nvim --------- 缩进对齐显示
  { "lukas-reineke/indent-blankline.nvim",
    enable=false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require("ibl").setup()
    end,
  },

--------- vim-better-whitespace ---------
  { "ntpeters/vim-better-whitespace",
    event = { "BufReadPost", "BufNewFile", },
    keys = {
      { "<leader>sw", '<cmd>StripWhitespace<cr>', desc = 'Deleta all white space on tail.' },
    },
  },

--------- RRethy/vim-illuminate    ---------
  { "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile", },
  },

--------- nvim-colorizer.lua    ---------
  { "norcalli/nvim-colorizer.lua",
    ft = 'lua',
    opts = {
      "lua",
    },
  },

----------- nvim-scrollbar -----------
  { "petertriho/nvim-scrollbar",
    dependencies = { 'lewis6991/gitsigns.nvim', 'folke/tokyonight.nvim', },
    config = function ()
      local colors = require("tokyonight.colors").setup()
      require("scrollbar").setup({
          handle = {
              color = colors.bg_highlight,
          },
          marks = {
              Search = { color = colors.orange },
              Error = { color = colors.error },
              Warn = { color = colors.warning },
              Info = { color = colors.info },
              Hint = { color = colors.hint },
              Misc = { color = colors.purple },
          }
      })
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },

}
