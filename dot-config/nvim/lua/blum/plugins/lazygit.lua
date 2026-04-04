local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("kdheepak/lazygit.nvim") },
        { src = u.gh("nvim-lua/plenary.nvim") },
    },
    setup = function()
        u.kset("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open lazygit" })
    end,
}
