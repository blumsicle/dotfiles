return {
	"zgs225/gomodifytags.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = { "GoAddTags", "GoRemoveTags", "GoInstallModifyTagsBin" },
	opts = {
		override = true,
		transform = "camelcase",
	},
}
