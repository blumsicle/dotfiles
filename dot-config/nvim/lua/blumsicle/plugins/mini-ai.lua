return {
	"echasnovski/mini.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mini_ai = require("mini.ai")
		mini_ai.setup({})
	end,
}
