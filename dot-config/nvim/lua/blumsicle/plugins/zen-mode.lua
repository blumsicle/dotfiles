return {
	"folke/zen-mode.nvim",
	config = function()
		local zen_mode = require("zen-mode")
		local set = vim.keymap.set

		zen_mode.setup({
			plugins = {
				twilight = { enabled = false },
			},
		})

		set("n", "<leader>nz", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })
	end,
}
