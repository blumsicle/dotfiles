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

		which_key.register({
			b = { "+Buffer" },
			e = { "+Explorer" },
			f = { "+Find" },
			g = { "+Git" },
			n = { "+Misc" },
			s = { "+Splits" },
			t = { "+Tabs" },
			w = { "+Workspace" },
			x = { "+Trouble" },
		}, { prefix = "<leader>" })
	end,
}
