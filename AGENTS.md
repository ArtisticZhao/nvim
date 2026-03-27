# AGENTS.md

## Purpose

This repository is a personal Neovim config for macOS, using `lazy.nvim` with plugin specs under `lua/plugins/*.lua`.
Future sessions should read this file first to avoid rediscovering local conventions and recent decisions.

## Repo Layout

- `init.lua`
  Bootstraps `lazy.nvim` and loads:
  - `lua/profile.lua`
  - `lua/keymap.lua`
  - `lua/autocmd.lua`
  - `lua/cmd.lua`
- `lua/plugins/*.lua`
  Plugin specs grouped by topic:
  - `cmp_lsp.lua`: LSP, Mason, completion, Trouble, Aerial
  - `editor_edit.lua`: editing helpers
  - `editor_reader.lua`: reading/navigation helpers
  - `git.lua`: git signs
  - `treesitter.lua`: Treesitter + Treesitter Context
  - `ui_*`: theme, lines, windows, display
  - `lang_*`: filetype-specific plugins
- `snippets_vsc/`
  Local VS Code snippet collection loaded by LuaSnip.
- `backup/`
  Old config fragments. Do not treat them as active config.

## Plugin Manager

- Manager: `lazy.nvim`
- Lockfile: `lazy-lock.json`
- Plugin setup uses `require('lazy').setup('plugins')`
- Old `isZTE()` / Git mirror logic was intentionally removed. Do not reintroduce enterprise-specific mirror switching unless explicitly requested.

## Current Treesitter State

Treesitter was recently cleaned up and should be treated as intentionally configured:

- Spec file: `lua/plugins/treesitter.lua`
- `nvim-treesitter` is now `lazy = false`
  Reason: plugin README warns against lazy-loading.
- Parser install dir is custom:
  - configured as `vim.fn.stdpath("data") .. "/treesitter"`
  - prepended to `runtimepath`
- Existing parsers were moved out of the plugin directory into:
  - `~/.local/share/nvim/treesitter/parser`
  - `~/.local/share/nvim/treesitter/parser-info`
- Do not move parsers back into `~/.local/share/nvim/lazy/nvim-treesitter/...`
- `ensure_installed` currently includes:
  - `bash`
  - `c`
  - `cmake`
  - `cpp`
  - `json`
  - `lua`
  - `markdown`
  - `markdown_inline`
  - `matlab`
  - `python`
  - `query`
  - `verilog`
  - `vim`
  - `vimdoc`
- Enabled modules:
  - `highlight`
  - `indent`
- `nvim-treesitter-context` is enabled with conservative options:
  - `max_lines = 3`
  - `multiline_threshold = 3`
  - `trim_scope = "outer"`
  - `mode = "cursor"`

Notes:

- Headless checks in the Codex sandbox reported a parser dir read/write warning even though filesystem permissions looked normal. Treat this as possibly sandbox-related unless reproduced in the user’s real Neovim session.
- After parser changes, the expected maintenance commands are:
  - `:TSUpdate`
  - `:TSInstallInfo`

## Dashboard / Scratch Behavior

Startup screen uses `dashboard-nvim` hyper theme via `lua/plugins/ui_windows.lua`.

Recent session decisions:

- Dashboard now exposes a `Scratch` shortcut on key `e`
- `Scratch` command is defined in `lua/cmd.lua`
- `Scratch` opens a normal unnamed buffer via `:enew`
- It is intentionally **not** a real `nofile` scratch buffer
  Reason: user wants Notepad++-style temporary pages that can still be saved later with `:w filename`
- Current `Scratch` buffer behavior:
  - `bufhidden=hide`
  - `swapfile=false`
  - `buflisted=true`

Dashboard MRU list is intentionally capped at 9 entries:

- `mru = { enable = true, limit = 9 }`
- Reason: avoid `1` vs `10` key-prefix delay in the dashboard number shortcuts

Do not change this back to 10 unless the user explicitly asks.

## Notify Behavior

`nvim-notify` was adjusted to feel closer to VS Code:

- config lives in `lua/plugins/ui_windows.lua`
- `top_down = false`
- `stages = "fade_in_slide_out"`

This should keep notifications stacking from the bottom area rather than top-left style behavior.

## Trouble / Navigation Decisions

`trouble.nvim` was updated from old-style open calls to newer view toggles.
Current mappings include:

- `<leader>xx` diagnostics
- `<leader>xX` buffer diagnostics
- `<leader>xs` symbols
- `<leader>xl` LSP list
- `<leader>xL` location list
- `<leader>xQ` quickfix list

`neo-tree` has these deliberate settings:

- `follow_current_file.enabled = true`
- `group_empty_dirs = true`
- `use_libuv_file_watcher = true`

## Wildfire Decisions

`wildfire.nvim` is intentionally preferred over native Treesitter incremental selection keymaps.

Reason:

- it already provides incremental/decremental selection behavior
- it supports count prefixes
- it handles surrounds more conveniently for this user

Current local decisions:

- main keys:
  - `<Tab>` start/increment selection
  - `<S-Tab>` decrement selection
- custom surrounds include:
  - `()`
  - `{}`
  - `<>`
  - `[]`
  - `""`
  - `''`
  - `` ` ``
- excluded filetypes were expanded to avoid stealing `<Tab>` in UI buffers:
  - `qf`
  - `help`
  - `neo-tree`
  - `TelescopePrompt`
  - `trouble`
  - `dashboard`
  - `lazy`
  - `mason`
  - `notify`
  - `toggleterm`

Avoid enabling native Treesitter `incremental_selection` with overlapping keymaps unless the user explicitly wants to compare/replace Wildfire.

## Which-Key / Discovery

`which-key.nvim` is configured with `preset = "modern"` and explicit group labels for common leader prefixes.
This was added to improve discoverability without changing the user’s key habits.

## User Preference Summary

Observed preferences from this session:

- Prefer low-risk, incremental improvements over wholesale rewrites.
- Wants practical UX parity with familiar tools when possible:
  - VS Code-style notification placement
  - Notepad++-style temporary new page from dashboard
- Dislikes hidden ambiguity in key handling:
  - MRU list changed from 10 to 9 specifically to avoid `1` vs `10` delay.
- Expects plugin changes to avoid stale residual files when possible.
  - Example: Treesitter parser migration should avoid leaving duplicates behind.

## Editing Guidance For Future Sessions

- Prefer changing existing plugin specs rather than introducing new plugins unless there is a clear reason.
- If touching Treesitter again:
  - preserve custom parser directory setup
  - avoid leaving duplicate parser artifacts in old plugin-managed directories
- If touching dashboard again:
  - preserve `e -> Scratch`
  - preserve `mru.limit = 9` unless explicitly changed by user
- If changing scratch behavior:
  - remember user wants saveable unnamed buffers, not strict `nofile`
- If changing notify:
  - preserve bottom-stacking behavior unless requested otherwise

## Validation Guidance

Useful local checks:

- `luac -p <file>`
- `nvim --headless '+qa'`

Be careful interpreting headless failures in the Codex sandbox for files outside the writable workspace, especially under `~/.local/share/nvim`.
