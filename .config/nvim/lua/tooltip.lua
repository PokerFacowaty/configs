local buffer = vim.api.nvim_create_buf(true, false)
vim.api.nvim_buf_set_name(buffer, "tooltip.txt")
local tipswindow = vim.api.nvim_open_win(
                    buffer, false, {
                      height = 10, vertical = false, split = 'below'
                    })
vim.api.nvim_win_set_height(tipswindow, 5)

