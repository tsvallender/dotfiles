return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      keymaps = {
        replace = { n = '<leader>sr' },
        qflist = { n = '<leader>sq' },
        syncLocations = { n = '<leader>ss' },
        syncLine = { n = '<leader>sl' },
        close = { n = '<leader>sc' },
        historyOpen = { n = '<leader>st' },
        historyAdd = { n = '<leader>sa' },
        refresh = { n = '<leader>sf' },
        openLocation = { n = '<leader>so' },
        gotoLocation = { n = '<enter>' },
        pickHistoryEntry = { n = '<enter>' },
        abort = { n = '<leader>sb' },
        help = { n = 'g?' },
        toggleShowCommand = { n = '<leader>sp' },
        swapEngine = { n = '<leader>se' },
      },
    })
  end
}
