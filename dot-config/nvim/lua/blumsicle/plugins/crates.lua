return {
	"saecki/crates.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local crates = require("crates")

		crates.setup({
			completion = {
				cmp = {
					enabled = true,
				},
				crates = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		})
	end,
}
