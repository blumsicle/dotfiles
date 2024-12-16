vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	group = vim.api.nvim_create_augroup("AutoSave", {}),
	command = "silent! wall",
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = vim.api.nvim_create_augroup("YankHighlight", {}),
	callback = function()
		vim.hl.on_yank()
	end,
})
