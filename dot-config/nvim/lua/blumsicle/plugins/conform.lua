return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local set = vim.keymap.set

		conform.setup({
			formatters_by_ft = {
				go = { "goimports", "golines", "gofumpt" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				yaml = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
		})

		set({ "n", "x" }, "<leader>nf", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
