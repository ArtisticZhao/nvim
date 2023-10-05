-- nvim-notify
-- nvim-web-devicons
-- nui.nvim
-- neo-tree.nvim
-- bufferline.nvim
-- lualine.nvim
-- barbecue.nvim
-- toggleterm.nvim
-- which-key.nvim
-- startup.nvim
-- plenary.nvim
-- telescope.nvim

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
    config = function ()
      require('notify').setup({
        background_colour = "#000000",
      })
    end
  },

--------- neo-tree.nvim --------- 目录树
  "MunifTanjim/nui.nvim",
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree", "NeoTreeFocusToggle", },
    keys = {
      { "<leader>e", "<cmd>NeoTreeFocusToggle<cr>", desc = "neo-tree" },
    },
    config = function ()
      local icon = require('G').icon()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = icon.error, texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = icon.warn, texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = icon.info, texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = icon.hint, texthl = "DiagnosticSignHint"})

      require("neo-tree").setup({
        -- Close Neo-tree if it is the last window left in the tab
        close_if_last_window = true,
        source_selector = {
            winbar = true,
            statusline = false,
        },
      })
    end
  },

--------- bufferline.nvim ---------
  { "moll/vim-bbye", lazy = false },
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
    lazy = false,
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

--------- toggleterm.nvim --------
  { "akinsho/toggleterm.nvim",
    keys = {
      { [[<c-\>]], desc = "open term"},
    },
    config = function()
      vim.cmd[[autocmd TermEnter term://*toggleterm#*
          \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
      require("toggleterm").setup{
          open_mapping = [[<c-\>]],
          start_in_insert = true,
          terminal_mappings = true,
    }
    end,
  },

--------- which-key.nvim ---------
  { "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup{}
    end,
  },

--------- startup.nvim ---------
  { "startup-nvim/startup.nvim",
    dir = "~/projects/startup.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup({theme = "startify"})
    end,
  },

----------- telescope.nvim -----------
  { "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "find in files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
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
