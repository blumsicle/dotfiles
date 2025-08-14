return {
	"echasnovski/mini.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mini_ai = require("mini.ai")
		mini_ai.setup()

		local mini_misc = require("mini.misc")
		mini_misc.setup()
		mini_misc.setup_auto_root()
	end,
}
