-- nvim-notify
-- nvim-web-devicons
-- nvim-tree.lua
-- bufferline.nvim
-- lualine.nvim
return {
--------- nvim-notify   --------- 通知插件
  { "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
          vim.notify = require("notify")
    end,
  },
--------- nvim-tree.lua --------- 目录树
  "kyazdani42/nvim-web-devicons",
  { "kyazdani42/nvim-tree.lua",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
      { "<leader>E", "<cmd>NvimTreeFindFileToggle<cr>", desc = "NvimTree Find file" },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    config = function()
      -- disable netrw at the very start of your init.lua (strongly advised)
      vim.g.loaded = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup()
      -- exit vim when nvimtree as the last buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
          end
        end
      })
    end,
  },

--------- bufferline.nvim ---------
  { "moll/vim-bbye", lazy = false },
  { "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>" },
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
    lazy = false,
    opts = {
      options = {
        theme = 'auto',
        disabled_filetypes = {
          statusline = {'NvimTree', },
        }
      }
    },
  },

--------- which-key.nvim ---------
  { "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup{}
    end,
  },
}
