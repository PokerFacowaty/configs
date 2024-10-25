-- Autocompletion config
local cmp = require('cmp')
cmp.setup({
  sources = {
  {name = 'nvim_lsp'},
},
  snippet = {
    expand = function(args)
    -- Neovim 0.10 needed to use vim.snippet
    vim.snippet.expand(args.body)
  end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
})
