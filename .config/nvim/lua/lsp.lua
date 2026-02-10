local lsps = {
  { "ruby_lsp" },
  { "cssls" },
  { "yamlls", {
            yaml = {
              schemas = {
                ["https://www.rubyschema.org/honeybadger.json"] = "honeybadger.yml",
                ["https://www.rubyschema.org/i18n-tasks.json"] = "i18n-tasks.yml",
                ["https://www.rubyschema.org/lefthook.json"] = "lefthook.yml",
                ["https://www.rubyschema.org/mongoid.json"] = "mongoid.yml",
                ["https://www.rubyschema.org/pghero.json"] = "pghero.yml",
                ["https://www.rubyschema.org/rorvswild.json"] = "rorvswild.yml",
                ["https://www.rubyschema.org/rubocop.json"] = ".rubocop.yml",
                ["https://www.rubyschema.org/scout_apm.json"] = "scout_apm.yml",
                ["https://www.rubyschema.org/shoryuken.json"] = "shoryuken.yml",
                ["https://www.rubyschema.org/sidekiq.json"] = "sidekiq.yml",
                ["https://www.rubyschema.org/standard.json"] = ".standard.yml",
                ["https://www.rubyschema.org/vite.json"] = "vite.yml",
                ["https://www.rubyschema.org/i18n/locale.json"] = "locale/*.yml",
                ["https://www.rubyschema.org/kamal/deploy.json"] = "deploy.yml",
                ["https://www.rubyschema.org/packwerk/package.json"] = "package.yml",
                ["https://www.rubyschema.org/rails/cable.json"] = "cable.yml",
                ["https://www.rubyschema.org/rails/cache.json"] = "cache.yml",
                ["https://www.rubyschema.org/rails/database.json"] = "database.yml",
                ["https://www.rubyschema.org/rails/queue.json"] = "queue.yml",
                ["https://www.rubyschema.org/rails/recurring.json"] = "recurring.yml", ["https://www.rubyschema.org/rails/storage.json"] = "storage.yml",
              },
            },
  }},
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
