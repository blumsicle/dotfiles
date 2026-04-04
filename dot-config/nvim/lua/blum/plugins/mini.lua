local u = require("blum.plugins.util")

return {
    packages = {
        { src = u.gh("nvim-mini/mini.icons") },
        { src = u.gh("nvim-mini/mini.pick") },
        { src = u.gh("nvim-mini/mini.extra") },
        { src = u.gh("nvim-mini/mini.pairs") },
        { src = u.gh("nvim-mini/mini.ai") },
        { src = u.gh("nvim-mini/mini.bracketed") },
        { src = u.gh("nvim-mini/mini.clue") },
        { src = u.gh("nvim-mini/mini.comment") },
        { src = u.gh("nvim-mini/mini.diff") },
        { src = u.gh("nvim-mini/mini-git") },
        { src = u.gh("nvim-mini/mini.hipatterns") },
        { src = u.gh("nvim-mini/mini.indentscope") },
        { src = u.gh("nvim-mini/mini.splitjoin") },
        { src = u.gh("nvim-mini/mini.statusline") },
        { src = u.gh("nvim-mini/mini.surround") },
        { src = u.gh("nvim-mini/mini.tabline") },
        { src = u.gh("nvim-mini/mini.trailspace") },
        { src = u.gh("nvim-mini/mini.visits") },
    },
    setup = function()
        local mini_icons = require("mini.icons")
        local mini_pick = require("mini.pick")
        local mini_extra = require("mini.extra")
        local mini_pairs = require("mini.pairs")
        local mini_ai = require("mini.ai")
        local mini_bracketed = require("mini.bracketed")
        local mini_clue = require("mini.clue")
        local mini_comment = require("mini.comment")
        local mini_diff = require("mini.diff")
        local mini_git = require("mini.git")
        local mini_hipatterns = require("mini.hipatterns")
        local mini_indentscope = require("mini.indentscope")
        local mini_splitjoin = require("mini.splitjoin")
        local mini_statusline = require("mini.statusline")
        local mini_surround = require("mini.surround")
        local mini_tabline = require("mini.tabline")
        local mini_trailspace = require("mini.trailspace")
        local mini_visits = require("mini.visits")

        mini_icons.setup()
        mini_pick.setup()
        mini_extra.setup()
        mini_pairs.setup()
        mini_ai.setup()
        mini_bracketed.setup()
        mini_comment.setup({
            options = {
                ignore_blank_line = true,
            },
        })
        mini_diff.setup()
        mini_git.setup()
        mini_hipatterns.setup({
            highlighters = {
                fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                hex_color = mini_hipatterns.gen_highlighter.hex_color(),
                note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
                todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
            },
        })
        mini_indentscope.setup({
            draw = {
                animation = mini_indentscope.gen_animation.none(),
            },
            symbol = "│",
        })
        mini_splitjoin.setup()
        mini_statusline.setup()
        mini_surround.setup()
        mini_tabline.setup()
        mini_trailspace.setup()
        mini_visits.setup()
        mini_clue.setup({
            triggers = {
                { mode = { "n", "x" }, keys = "<leader>" },
                { mode = { "n", "x" }, keys = "g" },
                { mode = { "n", "x" }, keys = "z" },
                { mode = { "n", "x" }, keys = "'" },
                { mode = { "n", "x" }, keys = "`" },
                { mode = { "n", "x" }, keys = '"' },
                { mode = "n",          keys = "<C-w>" },
                { mode = "n",          keys = "[" },
                { mode = "n",          keys = "]" },
            },
            clues = {
                mini_clue.gen_clues.g(),
                mini_clue.gen_clues.marks(),
                mini_clue.gen_clues.registers(),
                mini_clue.gen_clues.windows(),
                mini_clue.gen_clues.square_brackets(),
                mini_clue.gen_clues.z(),
                { mode = "n", keys = "<leader>b", desc = "+Buffers" },
                { mode = "n", keys = "<leader>f", desc = "+Find" },
                { mode = "n", keys = "<leader>s", desc = "+Splits" },
                { mode = "n", keys = "<leader>t", desc = "+Tabs" },
                { mode = "n", keys = "<leader>g", desc = "+Git" },
            },
        })

        u.kset("n", "<leader>ff", mini_pick.builtin.files, { desc = "Find files in cwd" })
        u.kset("n", "<leader>fb", mini_pick.builtin.buffers, { desc = "Find open buffers" })
        u.kset("n", "<leader>fg", mini_pick.builtin.grep_live, { desc = "Find string in cwd" })
        u.kset("n", "<leader>fh", mini_pick.builtin.help, { desc = "Find help" })
        u.kset("n", "<leader>fk", mini_extra.pickers.keymaps, { desc = "Find keymaps" })
        u.kset("n", "<leader>fv", mini_visits.select_path, { desc = "Find visited paths" })
        u.kset("n", "<leader>tw", mini_trailspace.trim, { desc = "Trim trailing whitespace" })
    end,
}
