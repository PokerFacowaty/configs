local treeApi = require("nvim-tree.api")
local commentApi = require("Comment.api")
local telescope = require("telescope.builtin")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- <leader> is Space in Normal mode
vim.g.mapleader = " "

-- nvim-tree
map("n", "<C-k>e", treeApi.tree.toggle)

-- Comment
map("n", "<C-_>", commentApi.toggle.linewise.current)
map("i", "<C-_>", commentApi.toggle.linewise.current)
-- This works and I have no clue how to do it with the dot syntax
map("v", "<C-_>", '<Plug>(comment_toggle_blockwise_visual)')

-- Diagnostics
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- Simplified window switching
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Same a terminal
map("t", "<C-h>", "<cmd>wincmd h<CR>")
map("t", "<C-j>", "<cmd>wincmd j<CR>")
map("t", "<C-k>", "<cmd>wincmd k<CR>")
map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- Telescope
map('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
