local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("catppuccin/nvim"), name = "catppuccin" },
	},
	setup = function()
		local function disable_snippet_highlights()
			vim.api.nvim_set_hl(0, "SnippetTabstop", {})
			vim.api.nvim_set_hl(0, "SnippetTabstopActive", {})
		end

		require("catppuccin").setup({ flavour = "frappe" })
		vim.cmd.colorscheme("catppuccin")
		disable_snippet_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("BlumSnippetHighlights", { clear = true }),
			callback = disable_snippet_highlights,
		})
	end,
}
