return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = true,
    })
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
      ["ruby_lsp"] = function()
        require("lspconfig").ruby_lsp.setup({
          cmd = {"/home/tsv/.rbenv/shims/ruby-lsp"},
          on_attach = function(client, buffer)
            setup_diagnostics(client, buffer)
            add_ruby_deps_command(client, buffer)
          end,
        })
      end
    })
    vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, bufopts)
    vim.keymap.set('n', '<leader>la', function() vim.lsp.buf.code_action() end, bufopts)
    vim.keymap.set('n', '<leader>lK', vim.lsp.buf.signature_help, {})
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, {})
    vim.keymap.set('n', 'E', vim.diagnostic.open_float, {})
    vim.keymap.set('n', 'H', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) -- Format code
  end
}
