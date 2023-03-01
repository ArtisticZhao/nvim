-- nvim-treesitter
-- zephyr-nvim
return {
  { "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "vim", "lua", "verilog", "python", "help", "json" },
      highlight = {
        enable = true,
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.install").prefer_git = true  -- Download parsers use git instead of curl.
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  { "glepnir/zephyr-nvim",
    lazy = true,
  },
}
