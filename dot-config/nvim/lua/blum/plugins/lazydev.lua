local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("folke/lazydev.nvim") },
	},
	setup = function()
		require("lazydev").setup({
			library = {
				{ path = vim.env.VIMRUNTIME, words = { "vim%.uv" } },
			},
		})
	end,
}
