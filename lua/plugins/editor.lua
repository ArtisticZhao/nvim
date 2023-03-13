return {
  { "nvim-lua/plenary.nvim", lazy = true },
----------- telescope.nvim -----------
  { "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
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
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
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
}
