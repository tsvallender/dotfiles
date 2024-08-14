return {
  "vimwiki/vimwiki",
  dependencies = {
    "ElPiloto/telescope-vimwiki.nvim",
  },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/notes",
        syntax = "markdown",
        ext = ".md",
        links_space_char = "_",
        auto_tags = 1,
      },
    }
    vim.g.vimwiki_syntax_plugins = {
      codeblock = {
        ["```lua"] = { parser = "lua" },
        ["```python"] = { parser = "python" },
        ["```javascript"] = { parser = "javascript" },
        ["```bash"] = { parser = "bash" },
        ["```html"] = { parser = "html" },
        ["```css"] = { parser = "css" },
        ["```c"] = { parser = "c" },
        ["```ruby"] = { parser = "ruby" },
      },
    }
    require("telescope").load_extension("vw")
    vim.keymap.set('n', '<leader>vww', require('telescope').extensions.vimwiki.vimwiki, {})
    vim.keymap.set('n', '<leader>vwg', require('telescope').extensions.vimwiki.live_grep, {})
  end
}
