--- Basic stuff
local set = vim.opt
set.autoindent = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.mouse='r'

--- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "nvim-tree/nvim-tree.lua",
  "nvim-treesitter/nvim-treesitter",
  {
    "Exafunction/codeium.vim",
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  "hrsh7th/nvim-cmp",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-tree/nvim-web-devicons",
  "sar/cmp-lsp.nvim",
  "ray-x/cmp-treesitter",
  "rhysd/git-messenger.vim",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "chaoren/vim-wordmotion",
})

require("tsv.remap")

--- Appearance
set.cursorline = true
vim.o.background = "dark"
require("gruvbox").setup({
  transparent_mode = true,
})
vim.cmd([[colorscheme gruvbox]])

-- Improve terminal setup
vim.api.nvim_command("autocmd TermOpen * startinsert")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")
vim.keymap.set('t', '<esc>', "<C-\\><C-n>")

-- Git
vim.g.fugitive_gitlab_domains = {'https://git.foxsoft.co.uk'}

-- Strip trailing spaces
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  filters = {
    dotfiles = true,
  },
})

-- Treesitter
require'nvim-treesitter.configs'.setup {
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Completion and LSP
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'treesitter' },
  })
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require"lspconfig".ruby_ls.setup{}

