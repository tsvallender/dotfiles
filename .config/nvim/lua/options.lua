local set = vim.opt
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

vim.cmd [[ let g:conjure#filetype#scheme = "conjure.client.guile.socket" ]]

set.autoindent = true
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
vim.keymap.set('n', 'qq',
  function()
    vim.opt.autoindent = not vim.opt.autoindent:get()
    vim.opt.expandtab = not vim.opt.expandtab:get()
    if vim.opt.tabstop:get() == 2 then
      vim.opt.tabstop = vim.opt.tabstop._info.default
    else
      vim.opt.tabstop = 2
    end
    if vim.opt.shiftwidth:get() == 2 then
      vim.opt.shiftwidth = vim.opt.shiftwidth._info.default
    else
      vim.opt.shiftwidth = 2
    end
    if vim.opt.softtabstop:get() == 2 then
      vim.opt.softtabstop = vim.opt.softtabstop._info.default
    else
      vim.opt.softtabstop = 2
    end
  end
)
-- Strip trailing spaces on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

