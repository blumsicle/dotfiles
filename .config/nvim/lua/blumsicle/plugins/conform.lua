return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local set = vim.keymap.set

		conform.setup({
			formatters_by_ft = {
				json = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
		})

		set({ "n", "v" }, "<leader>nf", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
