local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("stevearc/oil.nvim") },
	},
	setup = function()
		require("oil").setup({
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			columns = {
				"icon",
				"permissions",
			},
			lsp_file_methods = {
				enabled = true,
				autosave_changes = "unmodified",
			},
			watch_for_changes = true,
		})
		u.kset("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
	end,
}
