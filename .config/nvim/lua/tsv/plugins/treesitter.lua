return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup({
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      endwise = {
        enable = true,
      },
      ensure_installed = {
        "ruby",
        "javascript",
        "json",
        "html",
        "bash",
        "css",
        "go",
        "dockerfile",
        "lua",
        "gitignore",
        "yaml",
        "embedded_template",
      }
    })
  end
}

