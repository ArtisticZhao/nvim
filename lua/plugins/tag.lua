return {
  { "preservim/tagbar",
    keys = {
      { "<F8>", "<cmd>TagbarToggle<cr>", desc = "Toggle tagbar" },
    },
    config = function()
      vim.g.tagbar_type_verilog = {
        ctagstype = 'verilog',
        kinds = {
          "m:module",
          "i:instance",
        },
      }
    end,
  },
}
