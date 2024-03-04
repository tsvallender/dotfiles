return {
  "rhysd/git-messenger.vim",
  config = function()
    vim.keymap.set('n', '<leader>gm', ':GitMessenger<CR>');
  end
}
