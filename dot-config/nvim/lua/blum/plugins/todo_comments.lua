local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("folke/todo-comments.nvim") },
	},
	setup = function()
		require("todo-comments").setup({
			signs = false,
			highlight = {
				keyword = "bg",
			},
		})

		u.kset("n", "]t", function()
			require("todo-comments").jump_next()
		end, { desc = "Next todo comment" })
		u.kset("n", "[t", function()
			require("todo-comments").jump_prev()
		end, { desc = "Previous todo comment" })
		u.kset("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Toggle todo list" })
	end,
}
