-- Autocompletion config

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    pre_select = true,
    jump_to_mark = "<c-n>"
  },
  clients = { tabnine = { enabled = false } },
  display = {
    icons = { mode = "short" },
    pum = { fast_close = false },
    preview = { border = "single" }
  },
  completion = {
    skip_after = { " ", "{", "}", "[", "]", "(", ")" },
  },
}
