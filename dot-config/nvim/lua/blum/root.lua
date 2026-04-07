local M = {}

local root_markers = {
	".git",
	".hg",
	".svn",
	"package.json",
	"go.mod",
	"Cargo.toml",
	"pyproject.toml",
	"Makefile",
	".root",
}

function M.update(bufnr)
	bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr

	if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "neo-tree" then
		return
	end

	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if bufname == "" then
		return
	end

	local root = vim.fs.root(bufname, root_markers)

	if root ~= nil and root ~= vim.fn.getcwd(-1, 0) then
		vim.cmd.lcd(vim.fn.fnameescape(root))
	end
end

return M
