local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("nvim-mini/mini.pick") },
        { src = u.gh("nvim-mini/mini.extra") },
        { src = u.gh("nvim-mini/mini.bracketed") },
        { src = u.gh("nvim-mini/mini.diff") },
        { src = u.gh("nvim-mini/mini-git") },
        { src = u.gh("nvim-mini/mini.trailspace") },
        { src = u.gh("nvim-mini/mini.visits") },
    },
    setup = function()
        local mini_pick = require("mini.pick")
        local mini_extra = require("mini.extra")
        local mini_visits = require("mini.visits")
        local mini_trailspace = require("mini.trailspace")

        mini_pick.setup()
        mini_extra.setup()
        require("mini.bracketed").setup()
        require("mini.diff").setup()
        require("mini.git").setup()
        mini_trailspace.setup()
        mini_visits.setup()

        u.kset("n", "<leader>ff", mini_pick.builtin.files, { desc = "Find files in cwd" })
        u.kset("n", "<leader>fb", mini_pick.builtin.buffers, { desc = "Find open buffers" })
        u.kset("n", "<leader>fg", mini_pick.builtin.grep_live, { desc = "Find string in cwd" })
        u.kset("n", "<leader>fh", mini_pick.builtin.help, { desc = "Find help" })
        u.kset("n", "<leader>fk", mini_extra.pickers.keymaps, { desc = "Find keymaps" })
        u.kset("n", "<leader>fv", mini_visits.select_path, { desc = "Find visited paths" })
        u.kset("n", "<leader>tw", mini_trailspace.trim, { desc = "Trim trailing whitespace" })
    end,
}
