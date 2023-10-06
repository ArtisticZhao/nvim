-- flash.nvim            |  quick jump
-- nvim-ufo              |  code folder
-- interestingwords.nvim |  highlight interested words
-- todo-comments.nvim    |  highlight todo in comments
-- bookmarks.nvim        |  bookmarks

return {
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
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

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

--------- interestingwords.nvim ---------
  { "Mr-LLLLL/interestingwords.nvim",
    keys = {
      { '<leader>i', desc = "Interstringwords" },
      { '<leader>i', mode = "v", desc = "Interstringwords" },
      { '<leader>I', desc = "Clear all interestingwords" },
      { '<leader>m', desc = "Toggle search interestingwords" },
      { '<leader>M', desc = "Cancel all search interestingwords" },
    },
    opts = {
      colors = { "#8CCBEA", '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', '#aeee00', '#b88823', '#ffa724', '#ff2c4b' },
      search_count = true,
      navigation = true,
      search_key = "<leader>m",
      cancel_search_key = "<leader>M",
      color_key = "<leader>i",
      cancel_color_key = "<leader>I",
    },

  },

--------- todo-comments.nvim    ---------
  { "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile", },
    keys = {
      { '<leader>tt', '<cmd>TodoTelescope keywords=TODO,FIX,WARN,NOTE<cr>', desc = 'telescope todo list' },
      { '<leader>tl', '<cmd>TodoQuickFix<cr>', desc = 'quickfix todo list' },
      { ']t', '<cmd>lua require("todo-comments").jump_next()<cr>', desc = 'Next todo comment' },
      { '[t', '<cmd>lua require("todo-comments").jump_prev()<cr>', desc = 'Previous todo comment' },
    },
    opts = {
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "WARN" } },
    },
  },

--------- bookmarks.nvim      ---------
  { "tomasky/bookmarks.nvim",
    dependencies = { 'nvim-telescope/telescope.nvim', },
    event = "VimEnter",
    config = function()
      require('bookmarks').setup({
        sign_priority = 8,  --set bookmark sign priority to cover other sign
        save_file = vim.fn.stdpath("data") .. "/bookmarks",
        keywords =  {
          ["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = " ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(bufnr)
          local bm = require "bookmarks"
          local map = vim.keymap.set
          map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
          map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
          map("n","mn",bm.bookmark_next) -- jump to next mark in local buffer
          map("n","mp",bm.bookmark_prev) -- jump to previous mark in local buffer
          map("n","ml",bm.bookmark_list) -- show marked file list in quickfix window
        end
      })
      require('telescope').load_extension('bookmarks')
      vim.keymap.set('n', '<leader>fm', '<CMD>Telescope bookmarks list<CR>', { desc = 'Telescope bookmarks' })
    end

  },

}
