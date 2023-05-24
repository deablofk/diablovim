local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local handler = require("lsp_handler")
local mason_lspconfig = require("mason-lspconfig")

-- use mason to select what lsp servers and formatters you will use
-- maintain jdtls, because nvim-jdtls is configured to use the mason jdtls path
local formatters = {'google-java-format', 'prettier'}
local servers = {'clangd', 'gopls', 'pyright', 'rust_analyzer', 'tsserver', 'html', 'cssls', 'jsonls', 'jdtls', 'intelephense', 'lua_ls'}

require("neodev").setup()
require("mason").setup()

mason_lspconfig.setup{
	ensure_installed = servers
}

require("mason-null-ls").setup{
	ensure_installed = formatters
}

mason_lspconfig.setup_handlers {
  function(server_name)
		if server_name ~= 'jdtls' then
			require('lspconfig')[server_name].setup {
				capabilities = capabilities,
				on_attach = handler.on_attach,
				settings = servers[server_name],
			}
		end
  end,
}
