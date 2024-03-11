vim.g.mapleader = " "
require('options')
require('plugins') -- Install plugins with Lazy
require('completion') -- Completion
require('lsp') -- LSP
require('remap') -- Keymaps
require('tree') -- Nvim-tree
require('appearance') -- Appearance

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    }
  }
}
