

This `init.lua` configuration file for Neovim does the following:

#### **1. Basic Settings**
- Configures essential editor behavior:
  - Line numbers (absolute and relative).
  - Tab settings (`tabstop`, `shiftwidth`, `expandtab`, `smartindent`).
  - UI enhancements like `cursorline` and `termguicolors`.
  - Disables line wrapping.

#### **2. Key Mappings**
- Adds custom keybindings for efficient navigation:
  - `<leader>n`: Clear search highlights.
  - `<leader>w`: Save file.
  - `<leader>q`: Quit Neovim.
  - `<leader>r`: Run `make` for build systems.
  - `<leader>c`: Run `make clean` to clean builds.
  - `<leader>c1`: Insert a predefined C++ template.

#### **3. Plugin Manager Setup**
- Uses `packer.nvim` to manage plugins:
  - Syntax highlighting (`nvim-treesitter`).
  - LSP support (`nvim-lspconfig`).
  - Autocompletion (`nvim-cmp` and `LuaSnip`).
  - Git integration (`vim-fugitive` and `vim-gitgutter`).
  - File explorer (`NERDTree`).
  - Status line (`lualine`).

#### **4. Autocompletion Configuration**
- Sets up `nvim-cmp` for autocompletion with snippet integration.

#### **5. LSP Setup**
- Configures Language Server Protocol (LSP) for C++ (`clangd`) and Python (`pyright`).

#### **6. Treesitter Setup**
- Enables advanced syntax highlighting for multiple languages.

#### **7. Status Line**
- Configures a visually appealing status line using `lualine` with the "gruvbox" theme.

#### **8. File Templates**
- Automatically inserts a C++ template (`cpp_template.cpp`) when creating new `.cpp` files.

---

### **Alternative `init.lua`**

Here’s a similar configuration file with slight variations:

```lua
-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wrap = false

-- Key mappings
local map = vim.api.nvim_set_keymap
map('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
map('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })
map('n', '<leader>x', ':q<CR>', { noremap = true, silent = true })
map('n', '<leader>b', ':!make build<CR>', { noremap = true, silent = true }) -- Build
map('n', '<leader>z', ':!make clean<CR>', { noremap = true, silent = true }) -- Clean build

-- Plugin manager setup (packer.nvim)
require('packer').startup(function()
  use 'wbthomason/packer.nvim'  -- Packer itself
  use 'neovim/nvim-lspconfig'   -- LSP configurations
  use 'hrsh7th/nvim-cmp'        -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'    -- LSP source for nvim-cmp
  use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
  use 'kyazdani42/nvim-tree.lua' -- File explorer
  use 'hoob3rt/lualine.nvim'    -- Status line
end)

-- LSP setup
require('lspconfig').tsserver.setup{}  -- JavaScript/TypeScript LSP

-- Treesitter setup
require('nvim-treesitter.configs').setup({
  ensure_installed = { "javascript", "typescript", "lua" },
  highlight = {
    enable = true,
  },
})

-- Status line setup
require('lualine').setup({
  options = { theme = 'tokyonight' }
})

-- Auto-insert template for JavaScript
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.js",
    command = "0r ~/.config/nvim/templates/js_template.js"
})
```

---

### **Short README**

#### **Neovim Configuration with Lua**
This repository contains a customizable `init.lua` configuration file for Neovim, tailored for modern development needs.

#### **Features:**
1. **Editor Enhancements:**
   - Relative line numbers, syntax highlighting, and UI improvements.
2. **Plugin Management:**
   - Manages plugins using `packer.nvim` for features like LSP, Git integration, autocompletion, and file explorers.
3. **Language Support:**
   - Pre-configured for C++, Python, JavaScript, and TypeScript with LSP and Treesitter.
4. **Build System Integration:**
   - Custom key mappings for running and cleaning builds.
5. **Templates:**
   - Automatically inserts file templates for new files.

customizable init.lua configuration filcustomizable init.lua configuration file for Neovim, tailored for modern development needs.e for Neovim, tailored for modern development needs.#### **Getting Started:**
1. Clone the repository:
   ```bash
   git clone https://github.com/secured-git/nvim-config.git ~/.config/nvim
   ```
2. Install `packer.nvim`:
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```
3. Open Neovim and run `:PackerSync` to install plugins.

#### **Dependencies:**
- Neovim 0.8 or later
- `make` (if using build commands)
- LSP servers (e.g., `clangd`, `pyright`, `tsserver`)

#### **Customizing Templates:**
Add your templates to `~/.config/nvim/templates/` and modify file patterns in `init.lua`.

---
