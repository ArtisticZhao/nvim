-- mhartington/oceanic-next
-- glepnir/zephyr-nvim
-- indent-blankline.nvim
-- interestingwords.nvim
-- vim-better-whitespace
-- todo-comments.nvim
-- vim-illuminate
-- nvim-colorizer.lua     色彩标签

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
  -- { "mhartington/oceanic-next",
  --   config = function()
  --     vim.cmd.colorscheme "OceanicNext"
  --     vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
  --     vim.cmd[[hi LineNr guibg=NONE ctermbg=NONE]]
  --     vim.cmd[[hi SignColumn guibg=NONE ctermbg=NONE]]
  --     vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
  --    end,
  -- },

--------- tokyonight.nvim ---------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme "tokyonight"
      vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
      vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
      vim.cmd[[highlight Visual guibg=#5f87af gui=none guifg=NONE]]
      vim.cmd[[hi def IlluminatedWordText gui=underline]]
      vim.cmd[[hi def IlluminatedWordRead gui=underline]]
      vim.cmd[[hi def IlluminatedWordWrite gui=underline]]
    end
  },

--------- indent-blankline.nvim --------- 缩进对齐显示
  { "lukas-reineke/indent-blankline.nvim",
    enable=false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require("ibl").setup()
      -- local highlight = {
      --   "RainbowRed",
      --   "RainbowYellow",
      --   "RainbowBlue",
      --   "RainbowOrange",
      --   "RainbowGreen",
      --   "RainbowViolet",
      --   "RainbowCyan",
      -- }
      -- local hooks = require "ibl.hooks"
      -- -- create the highlight groups in the highlight setup hook, so they are reset
      -- -- every time the colorscheme changes
      -- -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      -- --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      -- --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      -- --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      -- --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      -- --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      -- --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      -- -- end)
      --
      -- vim.g.rainbow_delimiters = { highlight = highlight }
      -- require("ibl").setup { scope = { highlight = highlight } }
      -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

--------- interestingwords.nvim ---------
  { "Mr-LLLLL/interestingwords.nvim",
    keys = {
      { '<leader>i', desc = "Interstringwords" },
      { '<leader>i', mode = "v", desc = "Interstringwords" },
      { '<leader>I', desc = "Clear all interestingwords" },
      { '<leader>m', desc = "Toggle search interestingwords" },
      { '<leader>M', desc = "Cancel all search interestingwords" },
    },
    opts = {
      colors = { "#8CCBEA", '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', '#aeee00', '#b88823', '#ffa724', '#ff2c4b' },
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

--------- RRethy/vim-illuminate    ---------
  { "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile", },
    after = "folke/tokyonight.nvim",
    config = function ()
    end
  },

--------- nvim-colorizer.lua    ---------
  { "norcalli/nvim-colorizer.lua",
    ft = 'lua',
    opts = {
      "lua",
    },
  },
}
