local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("folke/trouble.nvim") },
	},
	setup = function()
		require("trouble").setup({
			auto_close = true,
			auto_open = false,
			focus = false,
			use_diagnostic_signs = true,
		})

		u.kset("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics" })
		u.kset("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle buffer diagnostics" })
		u.kset("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Toggle symbols" })
		u.kset("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Toggle LSP lists" })
		u.kset("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Toggle location list" })
		u.kset("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Toggle quickfix list" })
	end,
}
