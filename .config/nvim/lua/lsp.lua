local lsps = {
  { "ruby_lsp" },
  { "cssls" },
}

for _, lsp in pairs(lsps) do
  local name, config = lsp[1], lsp[2]
  vim.lsp.enable(name)
  if config then
    vim.lsp.config(name, config)
  end
end

--
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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

dap.adapters.rdbg = {
  type = "server",
  host = "localhost",
  port = "3036",
}

dap.configurations.ruby = {
  {
    type = "rdbg",
    name = "Attach to running Rails process",
    request = "attach",
    debugPort = "localhost:3036",
    localfsMap = "/ibat:/home/tsv/iucn/ibat",
  },
}
