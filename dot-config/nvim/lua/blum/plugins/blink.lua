local u = require("blum.util")

return {
	packages = {
		{ src = u.gh("saghen/blink.cmp"), version = vim.version.range("^1") },
	},
	setup = function()
		require("blink.cmp").setup({
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = false }, -- achieved through noice
			cmdline = { enabled = true },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
		})
	end,
}
