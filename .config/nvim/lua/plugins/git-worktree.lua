return {
  "ThePrimeagen/git-worktree.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require('telescope').load_extension("git_worktree")
    vim.keymap.set('n', '<leader>tw', require('telescope').extensions.git_worktree.git_worktrees, {})
    vim.keymap.set('n', '<leader>tc', require('telescope').extensions.git_worktree.create_git_worktree, {})
  end
}
