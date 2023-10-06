-- oceanic-next
-- zephyr-nvim
-- tokyonight.nvim

return {
--------- zephyr.nvim ---------
-- { "glepnir/zephyr-nvim",
--   config = function()
--     vim.cmd.colorscheme 'zephyr'
--     -- highlight group for LineNr
--     vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
--     vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
--     vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
--   end,
-- },

--------- OceanicNext ---------
  -- { "mhartington/oceanic-next",
  --   config = function()
  --     vim.cmd.colorscheme "OceanicNext"
  --     vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
  --     vim.cmd[[hi LineNr guibg=NONE ctermbg=NONE]]
  --     vim.cmd[[hi SignColumn guibg=NONE ctermbg=NONE]]
  --     vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
  --    end,
  -- },

--------- tokyonight.nvim ---------
  { "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme "tokyonight"
      vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
      vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
      vim.cmd[[highlight Visual guibg=#5f87af gui=none guifg=NONE]]
      vim.cmd[[hi def IlluminatedWordText gui=underline]]
      vim.cmd[[hi def IlluminatedWordRead gui=underline]]
      vim.cmd[[hi def IlluminatedWordWrite gui=underline]]
    end
  },
}
