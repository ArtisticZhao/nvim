-- leap.nvim
-- undotree
-- vim-visual-multi
-- nerdcommenter
-- wildfire.vim
-- vim-sandwich
-- align.nvim

return {
----------- flash -----------
  { "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        -- show the label before the match
        after = false,
        before = true,
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

----------- yanky -----------
  { "gbprod/yanky.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "shada",
          sync_with_numbered_registers = true,
          cancel_event = "update",
          ignore_registers = { "_" },
        },
        system_clipboard = {
          sync_with_ring = true,
        },
        -- keep cursor postion
        preserve_cursor_position = {
          enabled = true,
        },
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
      })
      -- yank highlight
      vim.keymap.set({"n", "x"}, "y", "<Plug>(YankyYank)")
      -- yank ring
      vim.keymap.set("n", "<leader>yn", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<leader>yp", "<Plug>(YankyCycleBackward)")
      -- yank history
      vim.keymap.set("n", "<leader>yh", ":Telescope yank_history<CR>")
      -- put highlight
      vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)gvy")
      require("telescope").load_extension("yank_history")
    end
  },
----------- undotree -----------
  { "mbbill/undotree",
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },

----------- vim-visual-multi -----------
  { "mg979/vim-visual-multi",
    keys = {
      { "<c-n>",  desc = "assign visual multi" },
    },
  },

--------- nerdcommenter   --------- 快速注释
  { "preservim/nerdcommenter",
    keys = {
      {"<leader>cc", mode={'n', 'v'}, desc = "comment" },
      {"<leader>cu", mode={'n', 'v'}, desc = "uncomment"},
    },
    config = function ()
      -- Add spaces after comment delimiters by default
      vim.g.NERDSpaceDelims = 1
      -- Allow commenting and inverting empty lines (useful when commenting a region)
      vim.g.NERDCommentEmptyLines = 1
      -- Align line-wise comment delimiters flush left instead of following code indentation
      vim.g.NERDDefaultAlign = 'left'
      -- Enable NERDCommenterToggle to check all selected lines is commented or not
      vim.g.NERDToggleCheckAllLines = 1
    end
  },

--------- wildfire.vim    --------- tab键快速选择textobj
  { "gcmt/wildfire.vim",
    keys = {
      {"<tab>", "<Plug>(wildfire-fuel)", mode = {'n', 'x', 'o'}, desc = "wildfire select textobj"},
      {"<s-tab>", "<Plug>(wildfire-water)", mode = {'n', 'x', 'o'}, desc = "wildfire select textobj"},
      {"<leader><tab>", "<Plug>(wildfire-quick-select)", desc = "wildfire quick select textobj"},
    },
    config = function()
      vim.g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "ip", "it" }
    end,
  },

--------- vim-sandwich    --------- 更快增删改成对的符号
  { "machakann/vim-sandwich",
    event = { "BufReadPost", "BufNewFile" },
  },

--------- align.nvim      --------- 对齐
  { "Vonr/align.nvim",
    -- align_to_char(length, reverse, preview, marks)
    -- align_to_string(is_pattern, reverse, preview, marks)
    -- align(str, reverse, marks)
    -- operator(fn, opts)
    -- Where:
    --      length: integer
    --      reverse: boolean
    --      preview: boolean
    --      marks: table (e.g. {1, 0, 23, 15})
    --      str: string (can be plaintext or Lua pattern if is_pattern is true)
    keys = {
      { "aa", '<cmd>lua require("align").align_to_char(1, true)<cr>', mode = "x", desc = "align to a char"  },
      { "as", '<cmd>lua require("align").align_to_char(2, true, true)<cr>', mode = "x", desc = "align to 2 chars" },
      { "aw", '<cmd>lua require("align").align_to_string(false, true, true)<cr>', mode = "x", desc = "align to a word"  },
      { "ar", '<cmd>lua require("align").align_to_string(true, true, true)<cr>', mode = "x", desc = "align to string"  },
    },
  },
--------- align.nvim      --------- 对齐
  { 'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
}
