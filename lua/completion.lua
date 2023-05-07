local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

luasnip.config.set_config({
	region_check_events = "InsertEnter",
	delete_check_events = "TextChanged,InsertLeave"
})

local cmp_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},

	mapping = cmp.mapping.preset.insert {
		['<C-f'] = cmp.mapping.scroll_docs(-4),
		['<C-d'] = cmp.mapping.scroll_docs(4),
		['<C-Space'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
		['<Tab>'] = cmp.mapping( function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else 
				fallback()
			end
		end, {'i', 's'}),
		['<S-Tab>'] = cmp.mapping( function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),
	},

	sources = {
	    { name = 'nvim_lsp' },
	    { name = 'nvim_lua' },
	    { name = 'buffer' },
	    { name = 'path' },
	    { name = 'luasnip' },
	},

	formatting = {
		format = function(entry, item)
			item.kind = string.format("%s %s", cmp_icons[item.kind], item.kind)
			return item
		end
	},

	experimental = {
		ghost_text = true
	},

	window = {
		completion = {
			border = "rounded"
		}
	}
}
