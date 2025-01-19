return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local set = vim.keymap.set

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				go = { "goimports", "golines", "gofumpt" },
				html = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				toml = { "taplo" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				yaml = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 2000,
			},
			format_after_save = {},
		})

		set({ "n", "x" }, "<leader>nf", function()
			conform.format()
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
