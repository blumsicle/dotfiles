local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("catppuccin/nvim"), name = "catppuccin" },
	},
	setup = function()
		require("catppuccin").setup({ flavour = "frappe" })
		vim.cmd.colorscheme("catppuccin")
	end,
}
