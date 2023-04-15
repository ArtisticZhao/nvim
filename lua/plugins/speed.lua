-- nerdcommenter
-- wildfire.vim
-- vim-sandwich
-- align.nvim
return {
--------- nerdcommenter   --------- 快速注释
  { "preservim/nerdcommenter",
    keys = {
      {"<leader>cc", mode={'n', 'v'}, },
      {"<leader>cu", mode={'n', 'v'}, },
    },
  },
--------- wildfire.vim    --------- tab键快速选择textobj
  { "gcmt/wildfire.vim",
    keys = {
      {"<tab>"},
      {"<s-tab>"},
    },
    config = function()
      vim.g.wildfire_objects = { "i>", [[i']], [[i"]], [[i)]], "i]", "i}", "ip", "it" }
      vim.cmd[[map <tab> <Plug>(wildfire-fuel)]]
      vim.cmd[[vmap <s-tab> <Plug>(wildfire-water)]]
      require('G').map{'n', '<enter>', ':a<enter><enter>.<enter>'  }  -- add an empty line
    end,
  },
--------- vim-sandwich    --------- 更快增删改成对的符号
  { "machakann/vim-sandwich",
    event = { "BufReadPost", "BufNewFile" },
  },

--------- align.nvim      --------- 对齐
  { "Vonr/align.nvim",
    version = false,
    keys = {
      { "aa", mode = "x", desc = "align to a char"  },
      { "as", mode = "x", desc = "align to 2 chars" },
      { "aw", mode = "x", desc = "align to a word"  },
      { "ar", mode = "x", desc = "align to string"  },
    },
    config = function()
      -- align_to_char(length, reverse, preview, marks)
      -- align_to_string(is_pattern, reverse, preview, marks)
      -- align(str, reverse, marks)
      -- operator(fn, opts)
      -- Where]
      --      length: integer
      --      reverse: boolean
      --      preview: boolean
      --      marks: table (e.g. {1, 0, 23, 15})
      --      str: string (can be plaintext or Lua pattern if is_pattern is true)

      local NS = { noremap = true, silent = true }

      vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
      vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
      vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
      vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews
    end,
  },
}
