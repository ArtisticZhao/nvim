-- leap.nvim
-- undotree
-- vim-visual-multi
-- nerdcommenter
-- wildfire.vim
-- vim-sandwich
-- align.nvim

return {
----------- leap.nvim -----------
  { "tpope/vim-repeat" },
  { "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    keys = {
      {'m', '<Plug>(leap-forward-to)', mode = {'x', 'o', 'n'}, desc = "leap forward"},
      {'M', '<Plug>(leap-backward-to)', mode = {'x', 'o', 'n'}, desc = "leap forward"},
    },
    config = function ()
      require('leap').add_default_mappings()
      require('leap').opts.highlight_unlabeled_phase_one_targets = true
    end
  },
  { "ggandor/flit.nvim",
    dependencies = { "ggandor/leap.nvim", "tpope/vim-repeat" },
    keys = {
      {'f', mode = {'n', 'x', 'o'}},
      {'F', mode = {'n', 'x', 'o'}},
      {'t', mode = {'n', 'x', 'o'}},
      {'T', mode = {'n', 'x', 'o'}},
    },
    opts = {
      -- disable find in multiline
      multiline = false
    },
  },

----------- yanky -----------
  { "gbprod/yanky.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("yanky").setup({
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
      vim.keymap.set("n", "<leader>y", ":Telescope yank_history<CR>")
      vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)gvy")
      vim.keymap.set({"n", "x"}, "y", "<Plug>(YankyYank)")
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
