return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open/close trouble list" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Open trouble workspace diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Open trouble document diagnostics" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Open trouble quickfix list" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Open trouble location list" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Open todos in trouble" },
	},
}
