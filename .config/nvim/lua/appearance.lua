vim.o.background = "dark"
require("gruvbox").setup({
  transparent_mode = true,
})
vim.cmd([[colorscheme gruvbox]])

local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)
vim.diagnostic.config{
  float={border=_border}
}

-- git-messenger
vim.g.git_messenger_floating_win_opts = {
  border = _border
}
vim.g.git_messenger_include_diff = "current"
