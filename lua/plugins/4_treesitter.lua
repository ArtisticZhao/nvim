-- nvim-treesitter
-- nvim-treesitter-context
return {
  { "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSUpdateSync", "TSInstall" },
    opts = {
      ensure_installed = {
        "c",
        "cmake",
        "cpp",
        "json",
        "lua",
        "matlab",
        "python",
        "verilog",
        "vim",
        "vimdoc",
      },
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

  { "nvim-treesitter/nvim-treesitter-context",
    version = false,
  },

}
