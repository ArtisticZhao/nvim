return {
  { "antoinemadec/vim-verilog-instance",
    ft = { "verilog", "systemverilog", },
    keys = {
      { "gb", mode = 'v', desc = "instant a verilog module"}
    },
    config = function()
      vim.g.verilog_instance_keep_comments = 1
      vim.g.verilog_instance_keep_empty_lines = 1
    end,
  },
}
