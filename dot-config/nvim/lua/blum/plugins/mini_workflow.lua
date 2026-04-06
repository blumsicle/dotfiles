local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("nvim-mini/mini.bracketed") },
		{ src = u.gh("nvim-mini/mini.diff") },
		{ src = u.gh("nvim-mini/mini-git") },
		{ src = u.gh("nvim-mini/mini.trailspace") },
	},
	setup = function()
		local mini_trailspace = require("mini.trailspace")
		require("mini.bracketed").setup({
			comment = { suffix = "" },
		})
		require("mini.diff").setup({
			view = {
				style = "sign",
			},
		})
		require("mini.git").setup()
		mini_trailspace.setup()

		u.kset("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ args = { vim.v.count1 .. "[c" }, bang = true })
				return
			end

			MiniBracketed.comment("backward", { n_times = vim.v.count1 })
		end, { desc = "Previous comment or diff hunk" })
		u.kset("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ args = { vim.v.count1 .. "]c" }, bang = true })
				return
			end

			MiniBracketed.comment("forward", { n_times = vim.v.count1 })
		end, { desc = "Next comment or diff hunk" })

		u.kset("n", "<leader>tw", mini_trailspace.trim, { desc = "Trim trailing whitespace" })
	end,
}
