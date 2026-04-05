local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("neovim/nvim-lspconfig") },
    },
    setup = function()
        local mini_extra = require("mini.extra")
        local lsp_group = vim.api.nvim_create_augroup("BlumLsp", { clear = true })

        vim.diagnostic.config({ virtual_text = true })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = lsp_group,
            callback = function(args)
                local function buf_kset(mode, lhs, rhs, opts)
                    opts = opts or {}
                    opts.buffer = args.buf

                    u.kset(mode, lhs, rhs, opts)
                end

                buf_kset("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
                buf_kset("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                buf_kset("n", "gd", function() mini_extra.pickers.lsp({ scope = "definition" }) end,
                    { desc = "Show LSP definitions" })
                buf_kset("n", "grr", function() mini_extra.pickers.lsp({ scope = "references" }) end,
                    { desc = "Show LSP references" })
                buf_kset("n", "gri", function() mini_extra.pickers.lsp({ scope = "implementation" }) end,
                    { desc = "Show LSP implementations" })
                buf_kset("n", "grt", function() mini_extra.pickers.lsp({ scope = "type_definition" }) end,
                    { desc = "Show LSP type definitions" })
                buf_kset("n", "grD", mini_extra.pickers.diagnostic, { desc = "Show buffer diagnostics" })
                buf_kset("n", "gO", function() mini_extra.pickers.lsp({ scope = "document_symbol" }) end,
                    { desc = "Show document symbols" })
                buf_kset("n", "grl", function()
                    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf })

                    vim.notify(enabled and "disabled" or "enabled", vim.log.levels.INFO, {
                        title = "LSP Inlay Hints",
                        on_open = function()
                            vim.lsp.inlay_hint.enable(not enabled, { bufnr = args.buf })
                        end,
                    })
                end, { desc = "Toggle LSP inlay hints" })
            end,
        })

        vim.lsp.config("lua_ls", {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name

                    if path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end
            end,
        })

        vim.lsp.enable({
            "gopls",
            "lua_ls",
        })
    end,
}
