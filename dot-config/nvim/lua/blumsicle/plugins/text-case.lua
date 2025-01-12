return {
	"johmsalas/text-case.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local textcase = require("textcase")
		local set = vim.keymap.set

		textcase.setup({
			prefix = "gb",
		})

		set({ "n", "x" }, "gb.", "<cmd>TextCaseOpenTelescope<cr>", { desc = "Telescope text case" })
	end,
}
