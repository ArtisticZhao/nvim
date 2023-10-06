-- vim-bbye        |  close buffer
-- bufferline.nvim |  Buffer line
-- lualine.nvim    |  Status line
-- barbecue.nvim   |  Winbar

return {
--------- vim-bbye ---------
  { "moll/vim-bbye", cmd = "Bdelete", },
--------- bufferline.nvim ---------
  { "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
      { "<leader>1", '<cmd>lua require("bufferline").go_to(1, true)<cr>', desc = "Go to buffer 1" },
      { "<leader>2", '<cmd>lua require("bufferline").go_to(2, true)<cr>', desc = "Go to buffer 2" },
      { "<leader>3", '<cmd>lua require("bufferline").go_to(3, true)<cr>', desc = "Go to buffer 3" },
      { "<leader>4", '<cmd>lua require("bufferline").go_to(4, true)<cr>', desc = "Go to buffer 4" },
      { "<leader>5", '<cmd>lua require("bufferline").go_to(5, true)<cr>', desc = "Go to buffer 5" },
      { "<leader>6", '<cmd>lua require("bufferline").go_to(6, true)<cr>', desc = "Go to buffer 6" },
      { "<leader>7", '<cmd>lua require("bufferline").go_to(7, true)<cr>', desc = "Go to buffer 7" },
      { "<leader>8", '<cmd>lua require("bufferline").go_to(8, true)<cr>', desc = "Go to buffer 8" },
      { "<leader>9", '<cmd>lua require("bufferline").go_to(9, true)<cr>', desc = "Go to buffer 9" },
      { "<leader>$", '<cmd>lua require("bufferline").go_to(-1, true)<cr>', desc = "Go to last buffer" },
    },
    opts = {
      options = {
        -- separator_style = 'slant',
        numbers = function(opts)
          return string.format('%s', opts.ordinal)
        end,
        left_mouse_command = "buffer %d",
        close_command = "Bdelete! %d",
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
          }
        },
      },
    },
  },

--------- lualine.nvim ---------
  { "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = 'auto',
        disabled_filetypes = {
          statusline = { 'NvimTree', 'neo-tree', },
        }
      }
    },
  },

--------- barbecue.nvim --------
  { "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },

}
