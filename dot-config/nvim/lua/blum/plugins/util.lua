local M = {}

function M.gh(x)
	return "https://github.com/" .. x
end

M.kset = vim.keymap.set

return M
