local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("nvim-treesitter/nvim-treesitter-context") },
	},
	setup = function()
		require("treesitter-context").setup({
			max_lines = 3,
			multiline_threshold = 10,
		})

		u.kset("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { desc = "Jump to treesitter context" })
	end,
}
