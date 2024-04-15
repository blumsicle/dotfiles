return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gitsigns = package.loaded.gitsigns
			local set = vim.keymap.set
			local opts = { buffer = bufnr }

			opts.desc = "Next Hunk"
			set("n", "]h", gitsigns.next_hunk, opts)
			opts.desc = "Prev Hunk"
			set("n", "[h", gitsigns.prev_hunk, opts)

			opts.desc = "Stage Hunk"
			set("n", "<leader>gs", gitsigns.stage_hunk, opts)
			set("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, opts)

			opts.desc = "Reset Hunk"
			set("n", "<leader>gr", gitsigns.reset_hunk, opts)
			set("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, opts)

			opts.desc = "Stage buffer"
			set("n", "<leader>gS", gitsigns.stage_buffer, opts)
			opts.desc = "Reset buffer"
			set("n", "<leader>gR", gitsigns.reset_buffer, opts)

			opts.desc = "Undo stage hunk"
			set("n", "<leader>gu", gitsigns.undo_stage_hunk, opts)

			opts.desc = "Preview hunk"
			set("n", "<leader>gp", gitsigns.preview_hunk, opts)

			opts.desc = "Blame line"
			set("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end, opts)
			opts.desc = "Toggle line blame"
			set("n", "<leader>gB", gitsigns.toggle_current_line_blame, opts)

			opts.desc = "Diff this"
			set("n", "<leader>gd", gitsigns.diffthis, opts)
			opts.desc = "Diff this ~"
			set("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, opts)

			opts.desc = "Gitsigns select hunk"
			set({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>", opts)
		end,
	},
}
