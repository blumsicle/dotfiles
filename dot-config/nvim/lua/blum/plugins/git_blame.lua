local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("f-person/git-blame.nvim") },
	},
	setup = function()
		require("gitblame").setup({
			enabled = false,
			date_format = "%Y-%m-%d %H:%M:%S %z",
			ignored_filetypes = {
				"neo-tree",
				"oil",
			},
			message_template = " <author> • <date> • <summary> • <<sha>>",
			schedule_event = "CursorMoved",
			clear_event = "CursorMovedI",
		})

		u.kset("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git blame" })
	end,
}
