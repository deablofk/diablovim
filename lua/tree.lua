-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- put true if want nvim tree to focus on the tree on start
require("nvim-tree").setup {
	update_focused_file = {
		enable = true,
	},
	-- on_attach = on_attach,
}

local function open_nvim_tree()
	require("nvim-tree.api").tree.toggle({
		focus = false,
	})
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree }) -- the configuration of toggle dont work without using this callback, idk

-- require("lsp-file-operations").setup() -- thats may not work i cant test 
require("lsp-file-operations").setup {
  -- debug = true
}
