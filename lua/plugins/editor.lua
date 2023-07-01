return {
  { "nvim-lua/plenary.nvim", lazy = true },
----------- telescope.nvim -----------
  { "nvim-telescope/telescope.nvim",
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope",
    keys = {
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "find in files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
    },
  },
----------- leap.nvim -----------
  {
    "ggandor/leap.nvim",
    keys = {
      { "m", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "M", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gm", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
----------- auto-pairs -----------
  { "jiangmiao/auto-pairs",
    event = { "BufReadPre", "InsertEnter", "BufNewFile" },
  },
----------- undotree -----------
  { "mbbill/undotree",
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },
----------- vim-visual-multi -----------
  { "mg979/vim-visual-multi",
    keys = {
      { "<c-n>",  desc = "assign visual multi" },
    },
  },

}
