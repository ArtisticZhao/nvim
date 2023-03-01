return {
  { "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    config = function()
      require('coc_conf')
    end,
  },
}
