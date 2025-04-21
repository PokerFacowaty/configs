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
})

local lspconfig = require('lspconfig')

local coq = require('coq')

-- Language servers
-- to be found here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- npm i -g bash-language-server
lspconfig.bashls.setup(coq.lsp_ensure_capabilities({}))

-- clangd needs to be installed and in PATH
lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))

-- pip install django-template-lsp
-- (pipx) if the system doesn't like global packages
lspconfig.djlsp.setup(coq.lsp_ensure_capabilities({}))

-- npm install @microsoft/compose-language-service
lspconfig.docker_compose_language_service.setup(coq.lsp_ensure_capabilities({}))

-- npm install -g dockerfile-language-server-nodejs
lspconfig.dockerls.setup(coq.lsp_ensure_capabilities({}))

-- npm install -g vscode-langservers-extracted
lspconfig.eslint.setup(coq.lsp_ensure_capabilities({}))

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup(coq.lsp_ensure_capabilities({}))

-- https://github.com/LuaLS/lua-language-server/releases/latest
lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities{
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } -- So that it doesn't complain about undefined global "vim"
      }
    }
  }
})

-- pip(x) install "python-lsp-server[all]" (highly recommended)
-- apt install python3-pylsp and all suggested packages on Debian
lspconfig.pylsp.setup(coq.lsp_ensure_capabilities{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true
        },
        flake8 = {
          enabled = true
        }
      }
    }
  }
})

-- npm install -g typescript typescript-language-server
lspconfig.ts_ls.setup(coq.lsp_ensure_capabilities{})
