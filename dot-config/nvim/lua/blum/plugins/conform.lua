local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("stevearc/conform.nvim") },
	},
	setup = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				go = { "gci", "goimports", "golines", "gofumpt" },
				json = { "prettier" },
				jsonc = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "ruff_fix", "ruff_format" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 2000,
			},
			format_after_save = {},
		})
	end,
}
