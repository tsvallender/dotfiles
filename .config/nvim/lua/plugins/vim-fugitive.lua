return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git);
    vim.keymap.set('n', '<leader>ds', ':Gvdiffsplit!<CR>');
    vim.keymap.set('n', '<leader>gl', ':diffget //2<CR>'); -- 'Get left' window
    vim.keymap.set('n', '<leader>gr', ':diffget //3<CR>'); -- 'Get right' window
  end
}
