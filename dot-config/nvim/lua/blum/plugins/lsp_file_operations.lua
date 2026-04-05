local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("antosha417/nvim-lsp-file-operations") },
	},
	setup = function()
		require("lsp-file-operations").setup()
	end,
}
