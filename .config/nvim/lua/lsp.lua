--- ***
--- LSP Configuration
--- ***
local lsp_zero = require('lsp-zero')

-- This is only ran when a language server is active in the file
local lsp_attach = function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
	vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

local lspconfig = require('lspconfig')

-- Language servers
-- to be found here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- npm i -g bash-language-server
lspconfig.bashls.setup{}

-- clangd needs to be installed and in PATH
lspconfig.clangd.setup{}

-- pip install django-template-lsp
-- (pipx) if the system doesn't like global packages
lspconfig.djlsp.setup{}

-- npm install @microsoft/compose-language-service
lspconfig.docker_compose_language_service.setup{}

-- npm install -g dockerfile-language-server-nodejs
lspconfig.dockerls.setup{}

-- npm install -g vscode-langservers-extracted
lspconfig.eslint.setup{}

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup{}

-- https://github.com/LuaLS/lua-language-server/releases/latest
lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } -- So that it doesn't complain about undefined global "vim"
      }
    }
  }
}

-- pip(x) install "python-lsp-server[all]" (highly recommended)
-- apt install python3-pylsp and all suggested packages on Debian
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true
        },
        flake8 = {
          enabled = true
        },
        mypy = {
          enabled = true
        }
      }
    }
  }
}

-- npm install -g typescript typescript-language-server
lspconfig.ts_ls.setup{}
