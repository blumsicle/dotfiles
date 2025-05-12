return {
	commands = {
		RustOpenDocs = {
			function()
				vim.lsp.buf_request(
					vim.api.nvim_get_current_buf(),
					"experimental/externalDocs",
					vim.lsp.util.make_position_params(),
					function(err, url)
						if err then
							error(tostring(err))
						elseif url then
							vim.ui.open(url)
						end
					end
				)
			end,
			description = "Open documentation for the symbol under the cursor in the default browser",
		},
	},
}
