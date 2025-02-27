return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local nvim_tree = require("nvim-tree")
		local set = vim.keymap.set

		nvim_tree.setup({
			hijack_netrw = false,
			view = {
				width = 40,
				relativenumber = true,
			},
			sync_root_with_cwd = true,
			reload_on_bufenter = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		})

		set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
		set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle file explorer on current file" })
		set("n", "<leader>ec", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse file explorer" })
		set("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })
		set("n", "<leader>ew", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })
	end,
}
