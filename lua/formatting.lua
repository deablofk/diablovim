local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
	debug = false,
	sources = {
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black.with({
			extra_args = { "--line-length=120" }
		}),
		-- null_ls.builtins.formatting.isort,
	},
	on_attach = function(client, bufnr)
		-- if client.supports_method("textDocument/formatting") then
		-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr})
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function ()
		-- 			vim.lsp.buf.format({async = false})
		-- 		end
		-- 	})
		-- end
	end,
}
