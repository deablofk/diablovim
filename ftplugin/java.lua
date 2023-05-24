-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local data_path = vim.fn.stdpath('data')
local jdtls_dir = data_path .. '/mason/packages/jdtls/'
local workspace_dir = data_path .. '/jdtlscache/' .. project_name
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local handler = require('lsp_handler')

local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. jdtls_dir .. 'lombok.jar',
		'-jar', jdtls_dir .. 'plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
		'-configuration', jdtls_dir .. 'config_linux',
		'-data', workspace_dir
	},

	root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

	settings = {
		java = {
			trace = {
				server = "message",
			},
			-- signatureHelp = {
			--     enabled = false
			-- },
			referenceCodeLens = {
				enabled = true
			},
			format = {
				enabled = false,
				settings = {
					profile = "GoogleStyle",
					url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
				},
			},
			saveActions = {
				organizeImports = true
			},
			completion = {
					importOrder = {
							"java",
							"javax",
							"com",
							"org"
			}
			},
			codeGeneration = {
				tostring = {
					listArrayContents = true,
					skipNullValues = true,
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
				hashCodeEquals = {
					useInstanceof = true,
					useJava7Objects = true
				},
				generateComments = true,
				insertLocation = true
			},
			autobuild = {
				enabled = true
			},
			progressReports = {
				enabled = false
			},
			eclipse = {
				downloadSources = true
			},
			maven = {
				downloadSources = true,
				updateSnapshots = true
			},
		}
	},
	capabilities = capabilities,
	on_attach = handler.on_attach,
	init_options = {
		bundles = {}
	},
}

require('jdtls').start_or_attach(config)
vim.keymap.set('n', '<leader>co', ":!gradle classes<CR>", {buffer = vim.api.nvim_get_current_buf(), desc = 'LSP: [C]ommand [O]rganize'})
