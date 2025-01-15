return {
  "mfussenegger/nvim-dap",
  config = function()
    vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
    vim.keymap.set('n', '<leader>dc', require('dap').continue)
    vim.keymap.set('n', '<leader>di', require('dap').step_into)
    vim.keymap.set('n', '<leader>do', require('dap').step_over)
    vim.keymap.set('n', '<leader>dr', require('dap').repl.open)
    vim.keymap.set('n', '<leader>dx', require('dap').terminate)
    vim.keymap.set('n', '<leader>dt', require('dapui').toggle)
  end
}
