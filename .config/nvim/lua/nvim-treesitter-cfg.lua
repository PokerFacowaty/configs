require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "c", "comment", "csv", "dockerfile", "go",
                       "html", "htmldjango", "javascript", "json", "lua",
                       "python", "typescript", "sql" },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  highlight = {
    enable = true
  }
})
