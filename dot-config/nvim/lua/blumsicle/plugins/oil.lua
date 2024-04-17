return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		local set = vim.keymap.set

		oil.setup({})

		set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
	end,
}
