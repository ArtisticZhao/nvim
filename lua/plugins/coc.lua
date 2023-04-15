local G = require('G')
return {
  { "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    config = function()
      require('coc_conf')
      G.map('n', '<F4>', '<cmd>CocCommand clangd.switchSourceHeader<cr>')
    end,
  },
}
