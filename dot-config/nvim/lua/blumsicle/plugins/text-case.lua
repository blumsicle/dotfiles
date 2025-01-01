return {
	"johmsalas/text-case.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local textcase = require("textcase")
		local set = vim.keymap.set

		textcase.setup({})

		set({ "n", "x" }, "ga.", "<cmd>TextCaseOpenTelescope<cr>", { desc = "Telescope text case" })
	end,
}
