local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("MunifTanjim/nui.nvim") },
        { src = u.gh("rcarriga/nvim-notify") },
        { src = u.gh("folke/noice.nvim") },
    },
    setup = function()
        require("noice").setup({
            lsp = {
                progress = {
                    enabled = true,
                    view = "mini",
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
                hover = {
                    enabled = true,
                },
                signature = {
                    enabled = true,
                },
                message = {
                    enabled = true,
                },
            },
            notify = {
                enabled = true,
                view = "notify",
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        })
    end,
}
