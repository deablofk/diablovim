local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local handler = require("lsp_handler")
local mason_lspconfig = require("mason-lspconfig")

local formatters = {'google-java-format', 'prettier'}
local servers = { 'clangd', 'gopls', 'pyright', 'rust_analyzer', 'tsserver', 'html', 'cssls', 'jsonls', 'jdtls', 'intelephense' }

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
		-- disable jdtls, it will be managed by nvim-jdtls plugin
		if server_name ~= 'jdtls' then
			require('lspconfig')[server_name].setup {
				capabilities = capabilities,
				on_attach = handler.on_attach,
				settings = servers[server_name],
			}
		end
  end,
}