# prx's nvim (nvim-lite + Ember Ridge)

Based on [radleylewis/nvim-lite](https://github.com/radleylewis/nvim-lite) (commit `ce4b709`, Aug 2026). Same single `init.lua`, same native `vim.pack`, same plugins and keymaps, with these changes:

- **Ember Ridge colorscheme** (`colors/ember-ridge.lua`) replaces melange. It uses the same colors as foot, sway and fuzzel, and it's transparent so foot's 0.85 alpha shows through. Set `vim.g.ember_ridge_transparent = false` at the top of `init.lua` for a solid background. The lualine theme is in `lua/lualine/themes/`.
- **Python**: pyright for types and completion, and ruff for linting and format-on-save.
- **C/C++**: clangd with clang-tidy and background indexing, plus clang-format on save. It uses the project's `.clang-format` when there is one, otherwise LLVM style with 4-space indents.
- **Tools come from xbps instead of Mason**, so `xbps-install -Su` keeps them current and nothing gets built with npm or pip behind your back. Mason is still there for anything Void doesn't package.
- **Servers and formatters only load if they're installed**, so a language you haven't set up yet doesn't throw errors at startup.
- **`<leader>R` runs the current file** in the floating terminal. Python runs `python3 file.py`. C runs `make` if there's a Makefile, otherwise `cc -Wall -Wextra -g` and then the binary. Also covers C++, sh, Lua, Go, Rust and JS.
- 4-space indents for Python/C/C++/Rust and real tabs in Makefiles. The 2-space default is kept elsewhere.
- **Removed obsidian.nvim**: its notes path only works on Artix and Ubuntu and it would crash at startup on Void. Also dropped cpplint (Google-style nagging; clang-tidy covers it).
- `termopen()` swapped for `jobstart({term=true})`, since `termopen()` is deprecated in 0.12.

## Install (Void)

```sh
# editor + build bits (tree-sitter-cli and a C compiler compile the parsers)
sudo xbps-install -S neovim tree-sitter-cli git gcc make curl tar unzip \
    ripgrep fzf fd wl-clipboard

# language tools
sudo xbps-install -S python3 pyright ruff \
    clang-tools-extra \
    lua-language-server StyLua efm-langserver \
    bash-language-server shellcheck shfmt

# config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
cp -r nvim ~/.config/nvim
nvim
```

The first time you open it, `vim.pack` asks to install the plugins, so press `y`. The Treesitter parsers compile in the background for a minute after that. Restart nvim once they're done. `:checkhealth vim.lsp` shows which servers are attached.

Keep the `nvim-pack-lock.json` that gets created with your dotfiles. It pins every plugin to an exact commit, so a second machine gets the same versions. Update plugins with `:lua vim.pack.update()`.

**Adding a language** (Go, for example): `sudo xbps-install go gopls gofumpt`. That's all, because gopls and gofumpt are already wired in. For a language that isn't wired in yet, add a `vim.lsp.config(...)` line, add its name to `enable_installed({...})` and add a line in the efm `languages` table.

**C projects with a build system**: clangd finds headers through `compile_commands.json`. Use `bear -- make` (`xbps-install bear`) or CMake's `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON`. Single files work without it.

## Keymap cheat sheet

Leader is **Space**. Press it and wait, and mini.clue shows what comes next.

**Files and search (fzf-lua)**

| Key | Action |
|---|---|
| `<leader>e` | Toggle file tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fx` / `fX` | Diagnostics (file / workspace) |

**Code (LSP)**

| Key | Action |
|---|---|
| `K` | Hover docs |
| `<leader>gd` | Go to definition (picker) |
| `<leader>gD` | Go to definition (jump) |
| `<leader>gS` | Definition in a vertical split |
| `<leader>fr` | References |
| `<leader>fi` | Implementations |
| `<leader>ft` | Type definitions |
| `<leader>fs` / `fw` | Symbols (file / workspace) |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>oi` | Organize imports |
| `<leader>d` / `D` | Diagnostic under cursor / on line |
| `<leader>nd` / `pd` | Next / previous diagnostic |
| `<leader>q` | All diagnostics in a list |
| `<leader>td` | Toggle diagnostics |
| *save* | Formats Python, C, Lua and shell |

**Completion (blink.cmp)**

| Key | Action |
|---|---|
| `<C-j>` / `<C-k>` | Next / previous item |
| `<CR>` | Accept |
| `<C-Space>` | Open / close menu |
| `<Tab>` / `<S-Tab>` | Jump through snippet fields |

**Run and terminal**

| Key | Action |
|---|---|
| `<leader>R` | Save and run current file |
| `<leader>t` | Toggle floating terminal |
| `<Esc>` (in terminal) | Normal mode |
| `<C-q>` (in terminal) | Close it |

**Git (mini.diff / mini.git)**

| Key | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` | Stage hunk (operator, e.g. `<leader>hsip`) |
| `<leader>hp` | Toggle diff overlay |
| `<leader>hb` | Blame / show at cursor |

**Editing**

| Key | Action |
|---|---|
| `<A-j>` / `<A-k>` | Move line or selection |
| `<` / `>` (visual) | Indent and keep selection |
| `<leader>p` (visual) | Paste without losing the register |
| `<leader>x` | Delete without yanking |
| `<leader>c` | Clear search highlight |
| `gc` / `gcc` | Comment selection / line |
| `sa` / `sd` / `sr` | Add / delete / replace surrounding (mini.surround) |
| `<leader>pa` | Copy file path |

**Windows and buffers**

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move between splits |
| `<leader>sv` / `sh` | Split vertical / horizontal |
| `<C-arrows>` | Resize split |
| `<leader>bn` / `bp` | Next / previous buffer |
