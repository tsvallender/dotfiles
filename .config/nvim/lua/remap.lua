-- File browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Text input
vim.keymap.set('n', '<leader>pt', ":pu!=strftime('%R')<CR>");
vim.keymap.set('n', '<leader>pd', ":pu!=strftime('%F')<CR>");
vim.keymap.set('n', '<leader>pD', ":pu!=strftime('%c')<CR>");


vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle, {})
