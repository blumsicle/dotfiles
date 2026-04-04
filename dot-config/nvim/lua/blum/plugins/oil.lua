local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("stevearc/oil.nvim") },
    },
    setup = function()
        require("oil").setup()
        u.kset("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
    end,
}
