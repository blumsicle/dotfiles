local u = require("blum.plugins.util")

return {
	packages = {
		{ src = u.gh("nvim-mini/mini.icons") },
		{ src = u.gh("nvim-mini/mini.clue") },
		{ src = u.gh("nvim-mini/mini.hipatterns") },
		{ src = u.gh("nvim-mini/mini.indentscope") },
		{ src = u.gh("nvim-mini/mini.statusline") },
		{ src = u.gh("nvim-mini/mini.tabline") },
	},
	setup = function()
		local mini_clue = require("mini.clue")
		local mini_hipatterns = require("mini.hipatterns")
		local mini_indentscope = require("mini.indentscope")

		require("mini.icons").setup()
		mini_hipatterns.setup({
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				hex_color = mini_hipatterns.gen_highlighter.hex_color(),
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			},
		})
		mini_indentscope.setup({
			draw = {
				animation = mini_indentscope.gen_animation.none(),
			},
			symbol = "│",
		})
		require("mini.statusline").setup()
		require("mini.tabline").setup()
		mini_clue.setup({
			triggers = {
				{ mode = { "n", "x" }, keys = "<leader>" },
				{ mode = { "n", "x" }, keys = "g" },
				{ mode = { "n", "x" }, keys = "z" },
				{ mode = { "n", "x" }, keys = "'" },
				{ mode = { "n", "x" }, keys = "`" },
				{ mode = { "n", "x" }, keys = '"' },
				{ mode = "n", keys = "<C-w>" },
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },
			},
			clues = {
				mini_clue.gen_clues.builtin_completion(),
				mini_clue.gen_clues.g(),
				mini_clue.gen_clues.marks(),
				mini_clue.gen_clues.registers(),
				mini_clue.gen_clues.windows(),
				mini_clue.gen_clues.square_brackets(),
				mini_clue.gen_clues.z(),
				{ mode = "n", keys = "<leader>b", desc = "+Buffers" },
				{ mode = "n", keys = "<leader>f", desc = "+Find" },
				{ mode = "n", keys = "<leader>s", desc = "+Splits" },
				{ mode = "n", keys = "<leader>t", desc = "+Tabs" },
				{ mode = "n", keys = "<leader>g", desc = "+Git" },
			},
		})
	end,
}
