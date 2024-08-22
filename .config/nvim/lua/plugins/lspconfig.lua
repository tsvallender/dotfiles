local util = require "lspconfig/util"

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp = require("lspconfig")
    lsp.ruby_lsp.setup({})
    lsp.rust_analyzer.setup({
      cmd = { "/home/tsv/bin/rust-analyzer" }
    })
    vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, bufopts)
    vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, bufopts)
    vim.keymap.set('n', '<leader>lK', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, {})
    vim.keymap.set('n', 'E', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'H', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) -- Format code
  end
}
