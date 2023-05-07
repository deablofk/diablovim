require("nvim-tree").setup {
	update_focused_file = {
		enable = true,
	},
	-- on_attach = on_attach,
}

require("nvim-tree.api").tree.open()
require("lsp-file-operations").setup()
