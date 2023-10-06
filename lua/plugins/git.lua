return {
  { "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs =  package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        -- stylua: ignore start
        map("n", "]g", gs.next_hunk, "Next Hunk")
        map("n", "[g", gs.prev_hunk, "Prev Hunk")
        map("n", "<leader>gl", "<CMD>Gitsigns toggle_current_line_blame<CR>", "Git toggle line blame")
        map('n', '<leader>gp', gs.preview_hunk, "Preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Preview Blame Line")

        -- set color
        vim.cmd [[
          highlight GitSignsAdd    guifg=#A2C698 guibg=NONE
          highlight GitSignsChange guifg=#7098C7 guibg=NONE
          highlight GitSignsDelete guifg=#DB686B guibg=NONE
        ]]
      end,
    },

  },
}
