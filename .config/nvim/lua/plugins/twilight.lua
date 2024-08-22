return {
  "folke/twilight.nvim",
  opts = {
    dimming = {
      alpha = 0.1,
      inactive = true,
      color = { "#ffffff" },
    },
  },
  config = function()
    vim.keymap.set('n', '<leader>zt', "<cmd>Twilight<cr>", {})
  end
}
