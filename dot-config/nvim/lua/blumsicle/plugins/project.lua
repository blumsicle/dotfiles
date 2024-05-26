return {
	"ahmedkhalf/project.nvim",
	branch = "quickfix",
	config = function()
		local project = require("project_nvim")
		project.setup({})
	end,
}
