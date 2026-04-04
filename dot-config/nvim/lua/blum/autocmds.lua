local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local autosave_group = augroup("AutoSave", { clear = true })
local rooter_group = augroup("Rooter", { clear = true })
local yank_highlight_group = augroup("YankHighlight", { clear = true })

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

local function get_lsp_root(bufnr)
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    if bufname == "" then
        return nil
    end

    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
        local workspace_folders = client.config.workspace_folders

        if workspace_folders then
            for _, workspace in ipairs(workspace_folders) do
                if bufname:find(workspace.name, 1, true) == 1 then
                    return workspace.name
                end
            end
        end

        if client.config.root_dir and bufname:find(client.config.root_dir, 1, true) == 1 then
            return client.config.root_dir
        end
    end
end

autocmd({ "BufLeave", "FocusLost" }, {
    group = autosave_group,
    command = "silent! wall",
})

autocmd("BufEnter", {
    group = rooter_group,
    callback = function(args)
        if vim.bo[args.buf].buftype ~= "" then
            return
        end

        local root = get_lsp_root(args.buf) or vim.fs.root(args.buf, root_markers)

        if root ~= nil and root ~= vim.fn.getcwd(-1, 0) then
            vim.cmd.lcd(vim.fn.fnameescape(root))
        end
    end,
})

autocmd({ "TextYankPost" }, {
    group = yank_highlight_group,
    callback = function()
        vim.hl.on_yank()
    end,
})
