local treeApi = require("nvim-tree.api")
local commentApi = require("Comment.api")

vim.keymap.set("n", "<C-k>e", treeApi.tree.toggle)

vim.keymap.set("n", "<C-_>", commentApi.toggle.linewise.current)
vim.keymap.set("i", "<C-_>", commentApi.toggle.linewise.current)
-- This works and I have no clue how to do it with the dot syntax
vim.keymap.set("v", "<C-_>", '<Plug>(comment_toggle_blockwise_visual)')

vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
