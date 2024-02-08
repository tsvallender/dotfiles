--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP servers
-- Stimulus
require'lspconfig'.stimulus_ls.setup{}
-- Ruby
require'lspconfig'.ruby_ls.setup{}
-- CSS
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}
-- SQL
require'lspconfig'.sqlls.setup{}
-- JavaScript
require'lspconfig'.eslint.setup{}
-- HTML
require'lspconfig'.html.setup {
  capabilities = capabilities,
}
-- JSON
require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}
-- BASH
require'lspconfig'.bashls.setup{}
-- Cucumber
require'lspconfig'.cucumber_language_server.setup{}
-- Docker
require'lspconfig'.dockerls.setup{}
require'lspconfig'local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("dapui").setup()
dap.adapters.ruby = function(callback, config)
  callback {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "bundle",
      args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
        "-c", "--", "bundle", "exec", config.command, config.script,
      },
    },
  }
end

dap.configurations.ruby = {
  {
    type = "ruby",
    name = "debug current file",
    request = "attach",
    localfs = true,
    command = "ruby",
    script = "${file}",
  },
  {
    type = "ruby",
    name = "run current spec file",
    request = "attach",
    localfs = true,
    command = "rspec",
    script = "${file}",
  },
}

require("nvim-lightbulb").setup({
  autocmd = { enabled = true },
})
