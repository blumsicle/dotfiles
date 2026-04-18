local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("mfussenegger/nvim-lint") },
	},
	setup = function()
		local lint = require("lint")
		local lint_group = vim.api.nvim_create_augroup("BlumLint", { clear = true })

		lint.linters_by_ft = {
			bash = { "shellcheck", "typos" },
			go = { "golangcilint", "typos" },
			javascript = { "biomejs", "typos" },
			javascriptreact = { "biomejs", "typos" },
			json = { "typos" },
			jsonc = { "typos" },
			lua = { "typos" },
			markdown = { "markdownlint-cli2", "typos" },
			python = { "ruff", "typos" },
			sh = { "shellcheck", "typos" },
			toml = { "typos" },
			typescript = { "biomejs", "typos" },
			typescriptreact = { "biomejs", "typos" },
			yaml = { "yamllint", "typos" },
			zsh = { "shellcheck", "typos" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "FileType", "InsertLeave" }, {
			group = lint_group,
			callback = function()
				lint.try_lint()

				local filename = vim.api.nvim_buf_get_name(0)
				if filename:match("%.github/workflows/.*%.ya?ml$") then
					lint.try_lint("actionlint")
				end
			end,
		})
	end,
}
