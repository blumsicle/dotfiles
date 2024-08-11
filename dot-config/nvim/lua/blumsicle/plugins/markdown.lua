return {
	"MeanderingProgrammer/markdown.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local markdown = require("render-markdown")
		markdown.setup({})
	end,
}
