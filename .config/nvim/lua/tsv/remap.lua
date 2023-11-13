vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Text input
vim.keymap.set('n', '<leader>pt', ":pu!=strftime('%R')<CR>");
vim.keymap.set('n', '<leader>pd', ":pu!=strftime('%F')<CR>");
vim.keymap.set('n', '<leader>pD', ":pu!=strftime('%c')<CR>");

-- Telescope
local builtin = require('telescope.builtin')
local telescope = require('telescope')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {}) -- Open files
vim.keymap.set('n', '<leader>ts', builtin.live_grep, {})  -- Grep files
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})    -- Neovim buffers
vim.keymap.set('n', '<leader>tm', builtin.man_pages, {}) -- man pages
vim.keymap.set('n', '<leader>tp', builtin.registers, {}) -- Paste from registers
vim.keymap.set('n', '<leader>tt', builtin.resume, {}) -- Last open Telescope
vim.keymap.set('n', '<leader>to', builtin.oldfiles, {}) -- Recently opened files
-- Git functionality (tg prefix)
vim.keymap.set('n', '<leader>tgf', builtin.git_files, {})
vim.keymap.set('n', '<leader>tgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>tgh', builtin.git_bcommits, {}) -- Current buffer's commits
vim.keymap.set('n', '<leader>tgb', builtin.git_branches, {}) -- CR: checkout, C-t: track, C-r: rebase, C-a: create, C-s: switch, C-d: delete, C-y: merge
vim.keymap.set('n', '<leader>tgs', builtin.git_stash, {}) -- List stash, apply with CR
-- LSP functionality (tl prefix)
vim.keymap.set('n', '<leader>tlr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>tli', builtin.lsp_incoming_calls, {})
vim.keymap.set('n', '<leader>tlo', builtin.lsp_outgoing_calls, {})
vim.keymap.set('n', '<leader>tld', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>tlt', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>tls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>tlm', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>tlw', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>tlD', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tlK', vim.lsp.buf.signature_help, {})
vim.keymap.set('n', '<leader>tlq', vim.diagnostic.setloclist, {})
vim.keymap.set('n', 'P', vim.diagnostic.open_float, {})
vim.keymap.set('n', 'H', function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>tlf", vim.lsp.buf.format) -- Format code

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Custom Telescope commands for Rails
vim.keymap.set('n', '<leader>trj', function()
    builtin.find_files({ search_dirs = { "app/javascript", "app/assets/javascripts" } })
end, { desc = "Open Rails Javascripts" } )
vim.keymap.set('n', '<leader>trsj', function()
    builtin.live_grep({ search_dirs = { "app/javascript", "app/assets/javascripts" } })
end, { desc = "Grep Rails Javascripts" } )
vim.keymap.set('n', '<leader>trm', function()
    builtin.find_files({ search_dirs = { "app/models" } })
end, { desc = "Open Rails Models" } )
vim.keymap.set('n', '<leader>trsm', function()
    builtin.live_grep({ search_dirs = { "app/models" } })
end, { desc = "Grep Rails Models" } )
vim.keymap.set('n', '<leader>trc', function()
    builtin.find_files({ search_dirs = { "app/controllers" } })
end, { desc = "Open Rails Controllers" } )
vim.keymap.set('n', '<leader>trsc', function()
    builtin.live_grep({ search_dirs = { "app/controllers" } })
end, { desc = "Grep Rails Controllers" } )
vim.keymap.set('n', '<leader>trv', function()
    builtin.find_files({ search_dirs = { "app/views" } })
end, { desc = "Open Rails Views" } )
vim.keymap.set('n', '<leader>trsv', function()
    builtin.live_grep({ search_dirs = { "app/views" } })
end, { desc = "Grep Rails Views" } )

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git);
vim.keymap.set('n', '<leader>ds', ':Gvdiffsplit!<CR>');
vim.keymap.set('n', '<leader>gl', ':diffget //2<CR>'); -- 'Get left' window
vim.keymap.set('n', '<leader>gr', ':diffget //3<CR>'); -- 'Get right' window

-- Nvim-tree
vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeToggle, {})


