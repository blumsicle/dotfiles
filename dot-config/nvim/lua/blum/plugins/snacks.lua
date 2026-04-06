local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("folke/snacks.nvim") },
	},
	setup = function()
		require("snacks").setup({
			input = {
				enabled = true,
			},
		})
	end,
}
