local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("folke/snacks.nvim") },
	},
	setup = function()
		local snacks = require("snacks")
		local spell_suggest = function()
			local bufnr = vim.api.nvim_get_current_buf()
			local cursor = vim.api.nvim_win_get_cursor(0)
			local row = cursor[1] - 1
			local col = cursor[2] + 1
			local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ""

			local start_col = col
			while start_col > 1 and line:sub(start_col - 1, start_col - 1):match("[%w_]") do
				start_col = start_col - 1
			end

			local end_col = col
			while end_col <= #line and line:sub(end_col, end_col):match("[%w_]") do
				end_col = end_col + 1
			end

			local word = line:sub(start_col, end_col - 1)
			if word == "" then
				vim.notify("No word under cursor", vim.log.levels.INFO, { title = "Spell" })
				return
			end

			local suggestions = vim.fn.spellsuggest(word, 20)
			if vim.tbl_isempty(suggestions) then
				vim.notify("No spelling suggestions", vim.log.levels.INFO, { title = "Spell" })
				return
			end

			snacks.picker.select(suggestions, {
				prompt = "Spell suggestions",
				format_item = function(item)
					return item
				end,
			}, function(choice)
				if not choice then
					return
				end

				vim.api.nvim_buf_set_text(bufnr, row, start_col - 1, row, end_col - 1, { choice })
			end)
		end

		snacks.setup({
			input = {
				enabled = true,
			},
			indent = {
				enabled = true,
			},
			lazygit = {
				enabled = true,
			},
			notifier = {
				enabled = true,
			},
			picker = {
				enabled = true,
			},
			quickfile = {
				enabled = true,
			},
			scope = {
				enabled = true,
			},
			statuscolumn = {
				enabled = true,
			},
		})

		u.kset("n", "<leader>gg", function()
			snacks.lazygit()
		end, { desc = "Open lazygit" })
		u.kset("n", "<leader>gB", function()
			snacks.git.blame_line()
		end, { desc = "Show git blame for line" })
		u.kset("n", "<leader>fn", function()
			snacks.notifier.show_history()
		end, { desc = "Show notification history" })
		u.kset("n", "<leader>bx", function()
			snacks.bufdelete()
		end, { desc = "Close current buffer" })
		u.kset("n", "<leader>bD", function()
			snacks.bufdelete.other()
		end, { desc = "Close all other buffers" })
		u.kset("n", "<leader>ff", snacks.picker.files, { desc = "Find files in cwd" })
		u.kset("n", "<leader>fF", function()
			snacks.picker.files({ hidden = true, ignored = true })
		end, { desc = "Find files in cwd, including hidden" })
		u.kset("n", "<leader>fb", snacks.picker.buffers, { desc = "Find open buffers" })
		u.kset("n", "<leader>fg", snacks.picker.grep, { desc = "Find string in cwd" })
		u.kset("n", "<leader>fG", snacks.picker.git_files, { desc = "Find git files" })
		u.kset("n", "<leader>fh", snacks.picker.help, { desc = "Find help" })
		u.kset("n", "<leader>fk", snacks.picker.keymaps, { desc = "Find keymaps" })
		u.kset("n", "<leader>fs", spell_suggest, { desc = "Find spelling suggestions" })
		u.kset("n", "<leader>fv", snacks.picker.recent, { desc = "Find recent files" })
	end,
}
