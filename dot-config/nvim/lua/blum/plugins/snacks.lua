local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("folke/snacks.nvim") },
	},
	setup = function()
		local snacks = require("snacks")

		snacks.setup({
			input = {
				enabled = true,
			},
			indent = {
				enabled = true,
			},
			lazygit = {
				enabled = true,
			},
			notifier = {
				enabled = true,
			},
			picker = {
				enabled = true,
			},
			quickfile = {
				enabled = true,
			},
			scope = {
				enabled = true,
			},
			statuscolumn = {
				enabled = true,
			},
		})

		u.kset("n", "<leader>gg", function()
			snacks.lazygit()
		end, { desc = "Open lazygit" })
		u.kset("n", "<leader>gB", function()
			snacks.git.blame_line()
		end, { desc = "Show git blame for line" })
		u.kset("n", "<leader>fn", function()
			snacks.notifier.show_history()
		end, { desc = "Show notification history" })
		u.kset("n", "<leader>bx", function()
			snacks.bufdelete()
		end, { desc = "Close current buffer" })
		u.kset("n", "<leader>bD", function()
			snacks.bufdelete.other()
		end, { desc = "Close all other buffers" })
		u.kset("n", "<leader>ff", snacks.picker.files, { desc = "Find files in cwd" })
		u.kset("n", "<leader>fF", function()
			snacks.picker.files({ hidden = true, ignored = true })
		end, { desc = "Find files in cwd, including hidden" })
		u.kset("n", "<leader>fb", snacks.picker.buffers, { desc = "Find open buffers" })
		u.kset("n", "<leader>fg", snacks.picker.grep, { desc = "Find string in cwd" })
		u.kset("n", "<leader>fG", snacks.picker.git_files, { desc = "Find git files" })
		u.kset("n", "<leader>fh", snacks.picker.help, { desc = "Find help" })
		u.kset("n", "<leader>fk", snacks.picker.keymaps, { desc = "Find keymaps" })
		u.kset("n", "<leader>fv", snacks.picker.recent, { desc = "Find recent files" })
	end,
}
