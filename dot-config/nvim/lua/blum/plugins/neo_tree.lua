local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("nvim-neo-tree/neo-tree.nvim"), version = "v3.x" },
		{ src = u.gh("nvim-lua/plenary.nvim") },
		{ src = u.gh("MunifTanjim/nui.nvim") },
		{ src = u.gh("s1n7ax/nvim-window-picker") },
		{ src = u.gh("nvim-tree/nvim-web-devicons") },
	},
	setup = function()
		local neo_tree_width = 40

		require("nvim-web-devicons").setup({
			default = true,
		})
		local events = require("neo-tree.events")
		require("window-picker").setup({
			hint = "statusline-winbar",
			filter_rules = {
				autoselect_one = true,
				include_current_win = false,
				include_unfocusable_windows = false,
				bo = {
					filetype = {
						"neo-tree",
						"neo-tree-popup",
						"notify",
						"qf",
						"trouble",
					},
					buftype = {
						"terminal",
					},
				},
			},
		})

		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			enable_diagnostics = true,
			commands = {
				decrease_width = function(state)
					vim.api.nvim_win_set_width(state.winid, math.max(20, vim.api.nvim_win_get_width(state.winid) - 5))
				end,
				increase_width = function(state)
					vim.api.nvim_win_set_width(state.winid, vim.api.nvim_win_get_width(state.winid) + 5)
				end,
				reset_width = function(state)
					vim.api.nvim_win_set_width(state.winid, neo_tree_width)
				end,
			},
			filesystem = {
				bind_to_cwd = true,
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
				window = {
					mappings = {
						["-"] = { "decrease_width", desc = "decrease_width" },
						["+"] = { "increase_width", desc = "increase_width" },
						["="] = { "reset_width", desc = "reset_width" },
					},
				},
			},
			buffers = {
				bind_to_cwd = false,
				follow_current_file = {
					enabled = true,
				},
				show_unloaded = true,
			},
			window = {
				position = "left",
				width = neo_tree_width,
			},
			event_handlers = {
				{
					event = events.NEO_TREE_BUFFER_ENTER,
					handler = function()
						vim.wo.number = true
						vim.wo.relativenumber = true
					end,
				},
			},
		})

		u.kset(
			"n",
			"<leader>ee",
			"<cmd>Neotree filesystem reveal_force_cwd left toggle<cr>",
			{ desc = "Toggle explorer" }
		)
		u.kset("n", "<leader>ef", "<cmd>Neotree filesystem reveal left<cr>", { desc = "Reveal in explorer" })
		u.kset(
			"n",
			"<leader>eb",
			"<cmd>Neotree buffers reveal right toggle dir=/<cr>",
			{ desc = "Toggle buffer explorer" }
		)
		u.kset("n", "<leader>eg", "<cmd>Neotree git_status float toggle<cr>", { desc = "Toggle git explorer" })
	end,
}
