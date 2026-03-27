# ArtisticZhao's Neovim Config for macOS

Personal Neovim config based on `lazy.nvim`.

## Install Neovim

```sh
brew install neovim
```

## Requirements

- [node.js](https://nodejs.org/en/)
- `pynvim`

```sh
python3 -m pip install pynvim --user
```

- `universal-ctags`

```sh
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

## Layout

- `init.lua`: bootstrap and core entry
- `lua/plugins/*.lua`: plugin specs grouped by topic
- `snippets_vsc/`: local VS Code snippets for LuaSnip
- `backup/`: old config fragments, not active

## Plugin Manager

- Manager: `lazy.nvim`
- Lockfile: `lazy-lock.json`

## Language Servers

Current LSP setup is defined in [lua/plugins/cmp_lsp.lua](/Users/az/.config/nvim/lua/plugins/cmp_lsp.lua).

Installed via Mason:

- `lua_ls`
- `clangd`
- `jsonls`
- `pyright`
- `matlab_ls`

## Lua / Neovim Workspace

This repo includes a project-level [`.luarc.json`](/Users/az/.config/nvim/.luarc.json) for `lua_ls`.

It exists to make LuaLS understand that this repository is a Neovim config, especially:

- treat runtime as `LuaJIT`
- recognize `vim` as a valid global
- disable `checkThirdParty` noise

If `lua_ls` starts reporting `Undefined global 'vim'` again, first check whether `.luarc.json` is still present and whether `:LspRestart lua_ls` fixes it.

## Diagnostics Shortcuts

Current useful mappings:

- `gl`: show diagnostics under cursor
- `[d`: jump to previous diagnostic
- `]d`: jump to next diagnostic
- `<leader>xx`: open diagnostics in Trouble
- `<leader>xX`: open buffer diagnostics in Trouble

## Notes

- Treesitter uses a custom parser install directory under `stdpath("data") .. "/treesitter"`.
- Dashboard provides `e -> Scratch`, which opens a normal unnamed buffer that can still be saved later.
- The dashboard MRU list is intentionally capped at `9`.

## Validation

Useful local checks:

```sh
luac -p lua/plugins/cmp_lsp.lua
```

```sh
nvim --headless '+qa'
```
