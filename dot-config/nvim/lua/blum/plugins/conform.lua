local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("stevearc/conform.nvim") },
    },
    setup = function()
        require("conform").setup({
            formatters_by_ft = {
                css = { "prettier" },
                go = { "goimports", "golines", "gofumpt" },
            },
            default_format_opts = {
                lsp_format = "fallback",
                timeout_ms = 2000,
            },
            format_after_save = {},
        })
    end,
}
