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
}
