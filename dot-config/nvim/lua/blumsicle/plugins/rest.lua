return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},

	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup({})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("RestKeys", {}),
				pattern = { "http" },
				callback = function()
					local set = vim.keymap.set
					set("n", "<leader>hh", ":Rest run<cr>", { desc = "Run HTTP request", buffer = true })
					set("n", "<leader>hn", ":Rest result next<cr>", { desc = "Goto next result tab", buffer = true })
					set(
						"n",
						"<leader>hp",
						":Rest result prev<cr>",
						{ desc = "Goto previous result tab", buffer = true }
					)
					set("n", "<leader>hL", "<cmd>Rest logs<cr>", { desc = "View HTTP request logs", buffer = true })
					set("n", "<leader>hl", "<cmd>Rest last<cr>", { desc = "Run last HTTP request", buffer = true })
				end,
			})
		end,
	},
}
