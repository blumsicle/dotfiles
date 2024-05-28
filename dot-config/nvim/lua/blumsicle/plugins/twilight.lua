return {
	"folke/twilight.nvim",
	config = function()
		local twilight = require("twilight")
		local set = vim.keymap.set

		twilight.setup({})

		set("n", "<leader>nt", "<cmd>Twilight<cr>", { desc = "Toggle Twilight" })
	end,
}
