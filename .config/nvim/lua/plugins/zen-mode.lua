return {
  "folke/zen-mode.nvim",
  opts = {
    plugins = {
      tmux = { enabled = true },
    }
  },
  config = function()
    vim.keymap.set('n', '<leader>zz', "<cmd>ZenMode<cr>", {})
  end
}
