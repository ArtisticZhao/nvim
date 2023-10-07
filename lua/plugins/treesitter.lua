-- nvim-treesitter
-- nvim-treesitter-context
return {
  { "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSUpdateSync", "TSInstall" },
    config = function()
      local opts = {
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
      }
      if require('G').isZTE() then
        opts.ensure_installed = {}
      end
      require("nvim-treesitter.install").prefer_git = true  -- Download parsers use git instead of curl.
      require("nvim-treesitter.configs").setup(opts)
      -- TODO: add local source for inner web.
    end,
  },

  { "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    version = false,
  },

}
