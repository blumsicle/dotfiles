return {
	"saecki/crates.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	opts = {
		lsp = {
			enabled = true,
			actions = true,
			completion = true,
			hover = true,
		},
	},
}
