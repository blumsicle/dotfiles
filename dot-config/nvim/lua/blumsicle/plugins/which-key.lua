return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local which_key = require("which-key")

		which_key.setup({})

		which_key.add({
			{
				"<leader>b",
				group = "Buffer",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{ "<leader>e", group = "Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "HTTP" },
			{ "<leader>n", group = "Misc" },
			{ "<leader>r", group = "Refactor" },
			{ "<leader>s", group = "Splits" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>w", group = "Workspace" },
			{ "<leader>x", group = "Trouble" },
		})
	end,
}
