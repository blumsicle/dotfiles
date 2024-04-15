return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"andymass/vim-matchup",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = { enabled = true },
			indent = { enabled = true },
			matchup = { enabled = true },
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"dockerfile",
				"glsl",
				"go",
				"gomod",
				"json",
				"lua",
				"markdown",
				"python",
				"rust",
				"swift",
				"terraform",
				"toml",
				"vim",
				"yaml",
				"zig",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
