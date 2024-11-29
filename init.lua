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
