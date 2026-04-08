local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("MeanderingProgrammer/render-markdown.nvim") },
	},
	setup = function()
		require("render-markdown").setup({
			file_types = { "markdown" },
		})
	end,
}
