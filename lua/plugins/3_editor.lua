-- neogen
-- flash.nvim
-- yanky.nvim
-- undotree
-- vim-visual-multi
-- nerdcommenter
-- wildfire.nvim
-- vim-sandwich
-- align.nvim
-- nvim-autopairs

return {
----------- nvim-ufo ----------- folder
  { 'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async', "nvim-treesitter/nvim-treesitter", },
    keys = {
      { "zR", mode ="n", function() require('ufo').openAllFolds() end, desc = "open all folds" },
      { "zM", mode = "n", function() require('ufo').closeAllFolds() end, desc = "close all folds" },
    },
    config = function ()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, 'MoreMsg'})
      return newVirtText
    end
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end,
        fold_virt_text_handler = handler,
      })
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
----------- flash.nvim -----------
  { "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
         -- options used when flash is activated through
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
          -- show jump labels
          jump_labels = false,
          -- set to `false` to use the current line only
          multi_line = false,
          highlight = { backdrop = false },
        },
      },
      highlight = {
        -- show a backdrop with hl FlashBackdrop
        backdrop = false,
      },
      label = {
        style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
        -- show the label before the match
        after = false,
        before = true,
        -- Enable this to use rainbow colors to highlight labels
        -- Can be useful for visualizing Treesitter ranges.
        rainbow = {
          enabled = true,
          -- number between 1 and 9
          shade = 5,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

----------- yanky.nvim -----------
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
  -- { "gcmt/wildfire.vim",
  --   keys = {
  --     {"<tab>", "<Plug>(wildfire-fuel)", mode = {'n', 'x', 'o'}, desc = "wildfire select textobj"},
  --     {"<s-tab>", "<Plug>(wildfire-water)", mode = {'n', 'x', 'o'}, desc = "wildfire select textobj"},
  --     {"<leader><tab>", "<Plug>(wildfire-quick-select)", desc = "wildfire quick select textobj"},
  --   },
  --   config = function()
  --     vim.g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "ip", "it" }
  --   end,
  -- },
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
--------- nvim-autopairs      --------- 自动补全括号
  { 'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
}
