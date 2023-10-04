
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { "<leader>xx", mode = "n",
        function() require("trouble").open("document_diagnostics") end,
        desc = "Open diagnostics documents"
      },
      { "<leader>xw", mode = "n",
        function() require("trouble").open("workspace_diagnostics") end,
        desc = "Open diagnostics workspace"
      },
      { "]d", mode = "n",
        function() require("trouble").next({skip_groups = true, jump = true}) end,
        desc = "Jump Next diagnostics"
      },
      { "[d", mode = "n",
        function() require("trouble").previous({skip_groups = true, jump = true}) end,
        desc = "Jump Previous diagnostics"
      },
    },
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<leader>a", mode = "n", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    },
    config = function ()
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '[a', '<cmd>AerialPrev<CR>', {buffer = bufnr, desc = "Previous Aerial"})
          vim.keymap.set('n', ']a', '<cmd>AerialNext<CR>', {buffer = bufnr, desc = "Next Aerial"})
        end
      })
    end,
  },
  -- LSP
  { 'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      lsp_zero.extend_lspconfig()
      -- -- (Optional) configure lua language server
      -- local lua_opts = lsp_zero.nvim_lua_ls()
      -- require('lspconfig').lua_ls.setup(lua_opts)
      --
      -- lsp_zero.setup_servers({'pyright', 'clangd'})
    end,
  },

  { 'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
  },


  { "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {'VonHeikemen/lsp-zero.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "clangd",
          "pyright",
          "matlab_ls",
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) configure lua language server
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
          clangd = function ()
            require('lspconfig').clangd.setup({
              cmd = { "clangd", "-header-insertion=never" },
            })
          end,
          pyright = function()
            print("in pyright")
            require('lspconfig').pyright.setup({
              pyright = {
                completion = {
                  importSupport = true,
                  snippetSupport = true,
                }
              }
            })
          end,
        },
      }
    end,
  },

  { "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  { 'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind.nvim",

      -- complete from snippets
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lsp_zero = require('lsp-zero')
      local cmp_action = lsp_zero.cmp_action()
      cmp.setup({
        -- snippets
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<CR>'] = cmp.mapping.confirm({select = false}),
          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        -- source config
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = 'nvim_lsp_signature_help' },
            { name = "buffer" },
            { name = 'luasnip' },
          }, {
            { name = "path" },
            { name = "nvim_lua" },
            { name = "calc" },
        }),
      })

      -- Use buffer source for `/` and `?`
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      ----- UIs
      local lspkind = require('lspkind')
      cmp.setup {
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            }),
          }),
        }
      }
      -- Customization for Pmenu
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
      vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
      -- gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
      -- blue
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
      -- light blue
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
      -- pink
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
      -- front
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
      vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
      vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
      ----- Auto add buckets
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
    end,
  },

  { "L3MON4D3/LuaSnip",
    version = "2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function ()
      local luasnip = require("luasnip")
      -- luasnip.config.set_config({
      --   enable_autosnippets = true,
      --   store_selection_keys = "`",
      -- })
      -- enable undo, for enable autosnippet
      -- local auto_expand = luasnip.expand_auto
      -- luasnip.expand_auto = function (...)
      --   vim.o.undolevels = vim.o.undolevels
      --   auto_expand(...)
      -- end
      -- keymaps

      vim.keymap.set({"i", "s"}, "<C-d>", function() luasnip.expand_or_jump() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-e>", function() luasnip.jump(-1) end, {silent = true})

      -- load vscode like snippets
      -- be sure to load this first since it overwrites the snippets table.
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
}
