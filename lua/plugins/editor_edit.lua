-- nerdcommenter      |  quick comment
-- neogen             |  generate comment for doxygen
-- nvim-surround      |  add delete change surroundings
-- wildfire.nvim      |  quick select textobj
-- vim-visual-multi   |  multiple cursors
-- align.nvim         |  quick aligning
-- nvim-autopairs     |  auto pair
-- undotree           |  undo tree

return {
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

----------- neogen -----------
  { "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<F3>", mode = "n", "<CMD>Neogen<CR>", desc = "Neogen doxygen comments." },
    },
    config = function ()
      require('neogen').setup({ snippet_engine = "luasnip" })
    end
  },

--------- nvim-surround    --------- 更快增删改成对的符号
  { "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },

--------- wildfire.vim    --------- tab键快速选择textobj
  { "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup({
        keymaps = {
          init_selection = "<TAB>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
        filetype_exclude = { "qf" }, --keymaps will be unset in excluding filetypes
      })
    end,
  },

----------- vim-visual-multi -----------
  { "mg979/vim-visual-multi",
    keys = {
      { "<c-n>",  desc = "assign visual multi" },
    },
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
      { "aa", mode = "x", '<cmd>lua require("align").align_to_char(1, true)<cr>',             desc = "align to a char"  },
      { "aw", mode = "x", '<cmd>lua require("align").align_to_string(false, true, true)<cr>', desc = "align to a word"  },
      { "ar", mode = "x", '<cmd>lua require("align").align_to_string(true, true, true)<cr>',  desc = "align to string"  },
      { "as", mode = "x", '<cmd>lua require("align").align_to_char(2, true, true)<cr>',       desc = "align to 2 chars" },
    },
  },

--------- nvim-autopairs      --------- 自动补全括号
  { 'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },

----------- undotree -----------
  { "mbbill/undotree",
    lazy = false,
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },

}
