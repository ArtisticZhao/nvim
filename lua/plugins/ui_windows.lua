-- dashboard-nvim    |  start up window
-- neo-tree.nvim     |  file explorer
-- toggleterm.nvim   |  terminal window
-- which-key.nvim    |  key register helper window
-- nvim-notify       |  notification display window

return {
--------- dashboard-nvim ---------
  { 'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}},
    opts = {
      shortcut_type = 'number',
    },
  },

--------- neo-tree.nvim --------- 目录树
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
      render = "wrapped-compact",
      timeout = 5000,
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

}
