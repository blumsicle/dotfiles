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

function M.get_lsp_root(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)

	if bufname == "" then
		return nil
	end

	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		if client.config.root_dir and bufname:find(client.config.root_dir, 1, true) == 1 then
			return client.config.root_dir
		end

		local workspace_folders = client.workspace_folders or client.config.workspace_folders

		if workspace_folders then
			for _, workspace in ipairs(workspace_folders) do
				local workspace_path = workspace.name

				if workspace.uri then
					workspace_path = vim.uri_to_fname(workspace.uri)
				end

				if workspace_path and bufname:find(workspace_path, 1, true) == 1 then
					return workspace_path
				end
			end
		end
	end
end

function M.update(bufnr)
	bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr

	if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "neo-tree" then
		return
	end

	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if bufname == "" then
		return
	end

	local root = M.get_lsp_root(bufnr) or vim.fs.root(bufname, root_markers)

	if root ~= nil and root ~= vim.fn.getcwd(-1, 0) then
		vim.api.nvim_set_current_dir(root)
	end
end

return M
