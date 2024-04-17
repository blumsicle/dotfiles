return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")
		local set = vim.keymap.set

		todo_comments.setup({})

		set("n", "[t", todo_comments.jump_prev, { desc = "Previous todo comment" })
		set("n", "]t", todo_comments.jump_next, { desc = "Next todo comment" })
	end,
}
