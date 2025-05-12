local mason_registry = require("mason-registry")
local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mson/packages/vue-language-server/node_modules/@vue/language-server"

return {
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "non-relative",
		},
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
}
