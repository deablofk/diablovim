M = {}
M.plugins = {
	-- packer
	'wbthomason/packer.nvim',

	-- LSP STUFF
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'folke/neodev.nvim',
	'mfussenegger/nvim-jdtls',
	'ray-x/lsp_signature.nvim',

	-- FORMATTING, DIAGNOSTIC, ETC
	'jose-elias-alvarez/null-ls.nvim',
	'jay-babu/mason-null-ls.nvim',
	'numToStr/Comment.nvim',

	-- AUTO COMPLETION
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',

	-- SNIPPETS
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',
	'windwp/nvim-autopairs',

	--FUZZY FINDER
	'nvim-telescope/telescope.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope-fzf-native.nvim',

	-- SYNTAX HIGHLIGHT  | VISUAL STUFF
	'nvim-treesitter/nvim-treesitter',
	'lukas-reineke/indent-blankline.nvim',
	'norcalli/nvim-colorizer.lua',
	'nvim-lualine/lualine.nvim',
	'RRethy/vim-illuminate',
	'weilbith/nvim-code-action-menu',
	-- 'navarasu/onedark.nvim',
	-- "mcchrish/zenbones.nvim",
	-- 'rktjmp/lush.nvim',
	-- 'agude/vim-eldar',
	-- 'NLKNguyen/papercolor-theme',
	-- 'maxmx03/solarized.nvim',
	'blazkowolf/gruber-darker.nvim',
	'morhetz/gruvbox',

	-- GIT
	'lewis6991/gitsigns.nvim',

	-- FOLDER TREE
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'antosha417/nvim-lsp-file-operations',

	-- ORGANIZATION
	'vimwiki/vimwiki',

	-- REST NEOVIM
	'rest-nvim/rest.nvim',

	-- DATABASE MANAGEMENT
	-- 'thibthib18/mongo-nvim',
	-- 'tpope/vim-dadbod',
	-- 'kristijanhusak/vim-dadbod-ui',
	-- 'kristijanhusak/vim-dadbod-completion',
}
return M
