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
  -- Gruvbox theme
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
  -- Telescope: fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- File tree
  "nvim-tree/nvim-tree.lua",
  -- Treesitter
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
  -- Completion framework
  "hrsh7th/nvim-cmp",
  -- LSP setup
  "neovim/nvim-lspconfig",
  -- Icons for Treesitter/nvim-tree
  "nvim-tree/nvim-web-devicons",
  -- LSP completion
  "sar/cmp-lsp.nvim",
  -- Treesitter completion
  "ray-x/cmp-treesitter",
  -- Git blame popup
  "rhysd/git-messenger.vim",
  -- Debugger
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  -- Vi motion within camelcase, underscore, etc
  "chaoren/vim-wordmotion",
  -- Git
  "tpope/vim-fugitive",
  -- Edit parens etc.
  "tpope/vim-surround",
  -- Rails utilities
  "tpope/vim-rails",
  -- Auto input 'end's
  "rrethy/nvim-treesitter-endwise",
  -- Blow shit up
  "Eandrju/cellular-automaton.nvim",
  -- Auto disable search highlight
  "romainl/vim-cool",
  -- Focus on current buffer
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        tmux = { enabled = true },
      }
    }
  }
})

