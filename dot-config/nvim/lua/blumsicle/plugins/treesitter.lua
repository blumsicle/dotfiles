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
			highlight = { enable = true },
			indent = { enable = true },
			matchup = { enable = true },
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
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"swift",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
				"zig",
				"graphql",
				"http",
				"xml",
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
