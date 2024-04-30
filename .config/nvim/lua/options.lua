local set = vim.opt
set.autoindent = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.cursorline = true
set.termguicolors = true
set.grepprg = 'rg --vimgrep --smart-case'

-- Improve terminal setup
vim.api.nvim_command("autocmd TermOpen * startinsert")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")
vim.keymap.set('t', '<esc>', "<C-\\><C-n>")

-- Strip trailing spaces on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

