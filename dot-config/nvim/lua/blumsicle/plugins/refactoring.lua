return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local refactoring = require("refactoring")
		local telescope = require("telescope")
		local set = vim.keymap.set

		refactoring.setup({})

		set("x", "<leader>re", ":Refactor extract ", { desc = "Extract selected block to function" })
		set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract selected block to file" })
		set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract selected block to variable" })
		set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Inline variable" })
		set("n", "<leader>rI", ":Refactor inline_func", { desc = "Inline function" })
		set("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract current block to function" })
		set("n", "<leader>rB", ":Refactor extract_block_to_file", { desc = "Extract current block to file" })

		set(
			{ "n", "x" },
			"<leader>rr",
			telescope.extensions.refactoring.refactors,
			{ desc = "Show list of possible refactors" }
		)
	end,
}
