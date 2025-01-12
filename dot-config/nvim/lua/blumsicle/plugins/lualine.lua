return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local mason_update = require("blumsicle.core.mason-update")

		mason_update.get_updates()

		lualine.setup({
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{
						mason_update.updates,
						cond = mason_update.has_updates,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
