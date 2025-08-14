return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")
		local set = vim.keymap.set

		auto_session.setup({
			suppress_dirs = {
				"~",
				"~/Desktop",
				"~/Documents",
				"~/Downloads",
				"~/Library",
				"~/Movies",
				"~/Music",
				"~/Pictures",
				"~/Public",
			},
		})

		set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
		set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session for auto session root dir" })
	end,
}
