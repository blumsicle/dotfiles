local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("folke/snacks.nvim") },
	},
	setup = function()
		local snacks = require("snacks")

		snacks.setup({
			input = {
				enabled = true,
			},
			lazygit = {
				enabled = true,
			},
		})

		u.kset("n", "<leader>gg", function()
			snacks.lazygit()
		end, { desc = "Open lazygit" })
	end,
}
