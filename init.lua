-- THIS CONFIG FILE REQUIRE DEPENDENCIES:
-- GIT
-- GCC or CLANG
-- MAKE

-- install packer if not installed
local bootstrap = require("bootstrap")
local firstInstall = bootstrap.bootstrap_packer()

require("packer").startup(function(use)
	for i, x in pairs(require("plugins").plugins) do
		use(x)
	end
	if firstInstall then
		require('packer').sync()
	end
end)


require("completion")
require("formatting")
require("lspserverconfig")
require("options")
require("signature")
require("keymaps")
require("tree")
require("highlight")

--vim.cmd('autocmd User PackerCompileDone lua configure()')


require("nvim-autopairs").setup()
require("Comment").setup()
require("telescope").setup()
pcall(require("telescope").load_extension, 'fzf')

require("lualine").setup{
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
		component_separators = '|',
		section_separators = '',
	}
}
require("indent_blankline").setup {
	show_current_context = true,
	show_current_context_start = false,
}

require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}

require('nvim-treesitter.configs').setup {
	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vim', 'java' },

	highlight = { enable = true, disable = { 'html' } },
	indent = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-backspace>',
		},
	},
}
