local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local util = require("blum.util")

local autosave_group = augroup("AutoSave", { clear = true })
local indent_group = augroup("IndentSettings", { clear = true })
local rooter_group = augroup("Rooter", { clear = true })
local spell_group = augroup("SpellSettings", { clear = true })
local yank_highlight_group = augroup("YankHighlight", { clear = true })

vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
		tpl = "gotmpl",
		tmpl = "gotmpl",
	},
	pattern = {
		[".*/templates/.*"] = "gotmpl",
	},
})

autocmd({ "BufLeave", "FocusLost" }, {
	group = autosave_group,
	command = "silent! wall",
})

autocmd("FileType", {
	group = indent_group,
	pattern = { "go", "lua" },
	callback = function()
		vim.bo.expandtab = false
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

autocmd("FileType", {
	group = indent_group,
	pattern = { "css", "markdown", "nix", "vim", "vimdoc" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.shiftwidth = 2
	end,
})

autocmd("FileType", {
	group = indent_group,
	pattern = { "python" },
	callback = function()
		vim.bo.expandtab = true
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

autocmd("FileType", {
	group = spell_group,
	pattern = { "gitcommit", "markdown", "text" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelloptions:remove("noplainbuffer")
	end,
})

autocmd("FileType", {
	group = spell_group,
	pattern = {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"lua",
		"nix",
		"python",
		"rust",
		"sh",
		"toml",
		"typescript",
		"typescriptreact",
		"vim",
		"vimdoc",
		"yaml",
	},
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelloptions:append("noplainbuffer")
	end,
})

autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
	group = rooter_group,
	callback = function(args)
		util.update_root(args.buf)
	end,
})

autocmd({ "TextYankPost" }, {
	group = yank_highlight_group,
	callback = function()
		vim.hl.on_yank()
	end,
})
