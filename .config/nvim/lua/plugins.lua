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

require("lazy").setup({
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
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-rails",
  "rrethy/nvim-treesitter-endwise",
  "Eandrju/cellular-automaton.nvim",
  "romainl/vim-cool",
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        tmux = { enabled = true },
      }
    }
  }
})

