local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("nvim-treesitter/nvim-treesitter-textobjects") },
	},
	setup = function()
		local treesitter_textobjects = require("nvim-treesitter-textobjects")
		local treesitter_textobjects_move = require("nvim-treesitter-textobjects.move")
		local treesitter_textobjects_select = require("nvim-treesitter-textobjects.select")

		treesitter_textobjects.setup({
			select = {
				lookahead = true,
				selection_modes = {
					["@function.outer"] = "V",
					["@class.outer"] = "V",
				},
				include_surrounding_whitespace = true,
			},
			move = {
				set_jumps = true,
			},
		})

		u.kset({ "x", "o" }, "am", function()
			treesitter_textobjects_select.select_textobject("@function.outer", "textobjects")
		end, { desc = "Select around function" })
		u.kset({ "x", "o" }, "im", function()
			treesitter_textobjects_select.select_textobject("@function.inner", "textobjects")
		end, { desc = "Select inside function" })
		u.kset({ "x", "o" }, "ac", function()
			treesitter_textobjects_select.select_textobject("@class.outer", "textobjects")
		end, { desc = "Select around class" })
		u.kset({ "x", "o" }, "ic", function()
			treesitter_textobjects_select.select_textobject("@class.inner", "textobjects")
		end, { desc = "Select inside class" })
		u.kset({ "n", "x", "o" }, "]m", function()
			treesitter_textobjects_move.goto_next_start("@function.outer", "textobjects")
		end, { desc = "Next function start" })
		u.kset({ "n", "x", "o" }, "]]", function()
			treesitter_textobjects_move.goto_next_start("@class.outer", "textobjects")
		end, { desc = "Next class start" })
		u.kset({ "n", "x", "o" }, "]M", function()
			treesitter_textobjects_move.goto_next_end("@function.outer", "textobjects")
		end, { desc = "Next function end" })
		u.kset({ "n", "x", "o" }, "][", function()
			treesitter_textobjects_move.goto_next_end("@class.outer", "textobjects")
		end, { desc = "Next class end" })
		u.kset({ "n", "x", "o" }, "[m", function()
			treesitter_textobjects_move.goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Previous function start" })
		u.kset({ "n", "x", "o" }, "[[", function()
			treesitter_textobjects_move.goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Previous class start" })
		u.kset({ "n", "x", "o" }, "[M", function()
			treesitter_textobjects_move.goto_previous_end("@function.outer", "textobjects")
		end, { desc = "Previous function end" })
		u.kset({ "n", "x", "o" }, "[]", function()
			treesitter_textobjects_move.goto_previous_end("@class.outer", "textobjects")
		end, { desc = "Previous class end" })
	end,
}
