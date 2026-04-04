local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("nvim-treesitter/nvim-treesitter") },
    },
    setup = function()
        local treesitter = require("nvim-treesitter")
        local parser_langs = {
            "css",
            "go",
            "gomod",
            "gosum",
            "gotmpl",
            "lua",
            "markdown",
            "markdown_inline",
            "vim",
            "vimdoc",
        }
        local update_stamp = vim.fs.joinpath(vim.fn.stdpath("state"), "treesitter-last-update")
        local update_interval = 60 * 60 * 24 * 7

        treesitter.setup()

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("BlumTreesitter", { clear = true }),
            pattern = parser_langs,
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            group = vim.api.nvim_create_augroup("BlumTreesitterInstall", { clear = true }),
            once = true,
            callback = function()
                treesitter.install(parser_langs)

                local stat = vim.uv.fs_stat(update_stamp)
                local now = os.time()

                if stat and now - stat.mtime.sec < update_interval then
                    return
                end

                vim.schedule(function()
                    local ok = pcall(treesitter.update)

                    if ok then
                        local fd = vim.uv.fs_open(update_stamp, "w", 420)

                        if fd then
                            vim.uv.fs_write(fd, tostring(now), -1)
                            vim.uv.fs_close(fd)
                        end
                    end
                end)
            end,
        })
    end,
}
