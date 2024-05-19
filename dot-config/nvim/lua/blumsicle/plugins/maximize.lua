return {
	"declancm/maximize.nvim",
	config = function()
		local maximize = require("maximize")
		local set = vim.keymap.set

		maximize.setup({})

		set("n", "<leader>sm", require("maximize").toggle, { desc = "Maximize/minimize a split" })
	end,
}
