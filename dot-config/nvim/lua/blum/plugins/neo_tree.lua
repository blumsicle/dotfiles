local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("nvim-neo-tree/neo-tree.nvim"), version = "v3.x" },
		{ src = u.gh("nvim-lua/plenary.nvim") },
		{ src = u.gh("MunifTanjim/nui.nvim") },
		{ src = u.gh("nvim-tree/nvim-web-devicons") },
	},
	setup = function()
		require("nvim-web-devicons").setup({
			default = true,
		})

		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				group_empty_dirs = true,
				hijack_netrw_behavior = "disabled",
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = true,
					hide_gitignored = true,
				},
			},
			window = {
				position = "left",
				width = 32,
			},
		})

		u.kset("n", "<leader>ee", "<cmd>Neotree filesystem reveal left toggle<cr>", { desc = "Toggle file tree" })
	end,
}
