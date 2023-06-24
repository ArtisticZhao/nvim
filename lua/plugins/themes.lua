-- mhartington/oceanic-next
-- glepnir/zephyr-nvim
return {

  --{ "glepnir/zephyr-nvim",
    --config = function()
      --vim.cmd.colorscheme 'zephyr'
      ---- highlight group for LineNr
      --vim.cmd[[hi LineNr ctermfg=gray guifg=silver]]
      --vim.cmd[[hi CursorLineNr ctermfg=blue guifg=#61AFEF cterm=bold gui=bold]]
      --vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
    --end,
  --},


  { "mhartington/oceanic-next",
    config = function()
      vim.cmd.colorscheme 'OceanicNext'

      vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
      vim.cmd[[hi LineNr guibg=NONE ctermbg=NONE]]
      vim.cmd[[hi SignColumn guibg=NONE ctermbg=NONE]]
      vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
     end,
  },
}
