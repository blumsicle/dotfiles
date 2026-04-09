local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("mfussenegger/nvim-lint") },
	},
	setup = function()
		local lint = require("lint")
		local lint_group = vim.api.nvim_create_augroup("BlumLint", { clear = true })

		lint.linters_by_ft = {
			go = { "golangcilint" },
			markdown = { "markdownlint-cli2" },
			python = { "ruff" },
		}

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
			group = lint_group,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
