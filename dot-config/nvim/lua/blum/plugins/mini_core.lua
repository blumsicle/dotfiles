local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("nvim-mini/mini.pairs") },
        { src = u.gh("nvim-mini/mini.ai") },
        { src = u.gh("nvim-mini/mini.comment") },
        { src = u.gh("nvim-mini/mini.move") },
        { src = u.gh("nvim-mini/mini.splitjoin") },
        { src = u.gh("nvim-mini/mini.surround") },
    },
    setup = function()
        require("mini.pairs").setup()
        require("mini.ai").setup()
        require("mini.comment").setup({
            options = {
                ignore_blank_line = true,
            },
        })
        require("mini.move").setup()
        require("mini.splitjoin").setup()
        require("mini.surround").setup()
    end,
}
