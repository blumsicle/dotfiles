return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local set = vim.keymap.set

		lint.linters_by_ft = {
			python = { "pylint" },
			go = { "golangcilint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})

		set("n", "<leader>nl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
