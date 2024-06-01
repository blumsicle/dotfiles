return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"ansiblels",
				"bashls",
				"clangd",
				"dockerls",
				"gopls",
				"jsonls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"terraformls",
				"tsserver",
				"vimls",
				"zls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"black",
				"gofumpt",
				"goimports",
				"golangci-lint",
				"golines",
				"isort",
				"prettier",
				"pylint",
				"stylua",
			},
		})
	end,
}
