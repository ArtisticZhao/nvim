-- lsp_signature.nvim
-- trouble.nvim
-- aerial.nvim

-- lsp-zero.nvim
-- nvim-lspconfig
-- mason-lspconfig.nvim
-- mason.nvim

-- nvim-cmp
-- LuaSnip

return {
--------- lsp_signature.nvim   ---------
  { "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_prefix = "󰙎 ",
    },
    config = function(_, opts) require'lsp_signature'.setup(opts) end
  },

--------- trouble.nvim   ---------
  { "folke/trouble.nvim",
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
      -- { "]d", mode = "n",
      --   function() require("trouble").next({skip_groups = true, jump = true}) end,
      --   desc = "Jump Next diagnostics"
      -- },
      -- { "[d", mode = "n",
      --   function() require("trouble").previous({skip_groups = true, jump = true}) end,
      --   desc = "Jump Previous diagnostics"
      -- },
    },
  },

--------- aerial.nvim   ---------
  { 'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons",
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

--------- lsp-zero.nvim   ---------
  { 'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    dependencies = {
       "ray-x/lsp_signature.nvim",
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(client, bufnr)
        vim.keymap.set('n', 'gd',        '<cmd>lua vim.lsp.buf.definition()<cr>',        {buffer = bufnr, desc = "Jumps to the definition"})
        vim.keymap.set('n', 'gD',        '<cmd>lua vim.lsp.buf.declaration()<cr>',       {buffer = bufnr, desc = "Jumps to the declaration"})
        vim.keymap.set('n', 'gI',        '<cmd>lua vim.lsp.buf.implementation()<cr>',    {buffer = bufnr, desc = "Lists all the implementations"})
        vim.keymap.set('n', 'go',        '<cmd>lua vim.lsp.buf.type_definition()<cr>',   {buffer = bufnr, desc = "Jump definition of type"})
        vim.keymap.set('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<cr>',        {buffer = bufnr, desc = "Lists all the references"})
        vim.keymap.set('n', 'gs',        '<cmd>lua vim.lsp.buf.signature_help()<cr>',    {buffer = bufnr, desc = "Displays signature help"})
        vim.keymap.set('n', '<F2>',      '<cmd>lua vim.lsp.buf.rename()<cr>',            {buffer = bufnr, desc = "Lsp rename"})
        vim.keymap.set('n', '<F3>',      '<cmd>lua vim.lsp.buf.code_action()<cr>',       {buffer = bufnr, desc = "Code action"})
        vim.keymap.set('x', '<F3>',      '<cmd>lua vim.lsp.buf.range_code_action()<cr>', {buffer = bufnr, desc = "Code action"})
        vim.keymap.set('n', 'gI',        '<cmd>lua vim.lsp.buf.implementation()<cr>',    {buffer = bufnr, desc = "Lists all the implementations"})
        vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.hover()<cr>',             {buffer = bufnr, desc = "Displays hover information"})
        vim.keymap.set('n', 'gl',        '<cmd>lua vim.diagnostic.open_float()<cr>',     {buffer = bufnr, desc = "Show diagnostic"})
        vim.keymap.set('n', '[d',        '<cmd>lua vim.diagnostic.goto_prev()<cr>',      {buffer = bufnr, desc = "Jump Next diagnostics"})
        vim.keymap.set('n', ']d',        '<cmd>lua vim.diagnostic.goto_next()<cr>',      {buffer = bufnr, desc = "Jump Previous diagnostics"})
        -- -- lsp_signature
        -- require "lsp_signature".on_attach({
        --   bind = true, -- This is mandatory, otherwise border config won't get registered.
        --   hint_prefix = "󰙎 ",
        --   handler_opts = {
        --     border = "rounded"
        --   }
        -- }, bufnr)
      end)
      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })
      lsp_zero.extend_lspconfig()
    end,
  },

--------- nvim-lspconfig   ---------
  { 'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
  },

--------- mason-lspconfig.nvim   ---------
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
          "jsonls",
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
              cmd = { "clangd",
                      "--header-insertion=never",
                      "--all-scopes-completion",
                      "--background-index",
                      "--clang-tidy",
                      "--header-insertion=iwyu",
                      "--completion-style=detailed",
                      "--function-arg-placeholders",
                      "--fallback-style=llvm",
              },
            })
            vim.keymap.set('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<cr>', {desc = "Switch Source Header"})
          end,
          matlab_ls = function ()
            require('lspconfig').matlab_ls.setup({
              settings = {
                matlab = {
                  single_file_support = true,
                  installPath = "/Applications/MATLAB_R2022b.app/"
                }
              }
            })
          end,
          pyright = function()
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
      -- require'lspconfig'.matlab_ls.setup {
      --   settings = {
      --     matlab = {
      --       capabilities = require("cmp_nvim_lsp").default_capabilities(),
      --       single_file_support = true,
      --       installPath = "/Applications/MATLAB_R2022b.app",
      --       matlabConnectionTiming = "onStart",
      --     }
      --   }
      -- }
    end,
  },

--------- mason.nvim   ---------
  { "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

--------- nvim-cmp   ---------
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",

      -- complete from snippets
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
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
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
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

--------- LuaSnip   ---------
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
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets_vsc" } })
    end
  },
}
