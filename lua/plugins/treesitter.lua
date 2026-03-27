-- nvim-treesitter
-- nvim-treesitter-context
return {
  { "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
      vim.opt.runtimepath:prepend(parser_install_dir)
      local opts = {
        parser_install_dir = parser_install_dir,
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "matlab",
          "python",
          "query",
          "verilog",
          "vim",
          "vimdoc",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      }
      require("nvim-treesitter.install").prefer_git = true  -- Download parsers use git instead of curl.
      require("nvim-treesitter.configs").setup(opts)
      -- TODO: add local source for inner web.
    end,
  },

  { "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    version = false,
    opts = {
      enable = true,
      max_lines = 3,
      multiline_threshold = 3,
      trim_scope = "outer",
      mode = "cursor",
    },
  },

}
