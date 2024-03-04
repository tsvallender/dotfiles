return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, bufopts)
    vim.keymap.set('n', '<leader>lK', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, {})
    vim.keymap.set('n', 'E', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'H', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) -- Format code
  end
}
