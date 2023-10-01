return {
  { 'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
    keys = {
      { '<leader>a', '<cmd>CodeActionMenu<cr>',  desc = "show code actions" },
    },
  },
  { "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("neodev").setup()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
      lspconfig.pyright.setup {}
      lspconfig.clangd.setup {}
      lspconfig.matlab_ls.setup {
        settings = {
          matlab = {
            installPath = '/Applications/MATLAB_R2022b.app',
            matlabConnectionTiming = 'onStart',
            telemetry = true,
          },
        },
        handlers = {
          ['workspace/configuration'] = function(_, _, ctx)
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            return { client.config.settings.matlab }
          end,
        },
      }

      -- config keymap
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go prev diagnosis"})
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go next diagnosis"})
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "list diagnosis"})
      vim.keymap.set('n', '<space>Q', vim.diagnostic.open_float, { desc = "open float window on diagnosis"})

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<space>d', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      ---- UI config
      -- signs
      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

    end,
  },

  { "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "clangd",
          "pyright",
          "matlab_ls",
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

  { "folke/neodev.nvim", opts = {} },

  { "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
