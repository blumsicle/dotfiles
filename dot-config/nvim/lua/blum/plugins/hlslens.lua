local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("kevinhwang91/nvim-hlslens") },
	},
	setup = function()
		local hlslens = require("hlslens")

		hlslens.setup({
			calm_down = true,
			nearest_only = true,
			nearest_float_when = "never",
		})

		local function search_map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, function()
				vim.cmd(("normal! %d%szz"):format(vim.v.count1, rhs))
				hlslens.start()
			end, { desc = desc })
		end

		search_map("n", "n", "Center screen on search forwards")
		search_map("N", "N", "Center screen on search backwards")
		search_map("*", "*", "Center screen on search forwards")
		search_map("#", "#", "Center screen on search backwards")
	end,
}
