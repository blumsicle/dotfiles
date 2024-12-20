return {
	"LintaoAmons/cd-project.nvim",
	opts = {
		projects_picker = "telescope",
	},
	keys = {
		{ "<leader>np", "<cmd>CdProject<cr>", desc = "CD to project" },
		{ "<leader>nP", "<cmd>CdProjectAdd<cr>", desc = "Add CWD to project" },
	},
}
