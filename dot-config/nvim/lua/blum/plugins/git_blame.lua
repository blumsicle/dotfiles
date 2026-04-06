local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("f-person/git-blame.nvim") },
	},
	setup = function()
		require("gitblame").setup({
			date_format = "%r",
			ignored_filetypes = {
				"neo-tree",
				"oil",
			},
			message_template = " <author> • <date> • <summary>",
			schedule_event = "CursorMoved",
			clear_event = "CursorMovedI",
		})

		u.kset("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git blame" })
	end,
}
