local g = vim.g
local opt = vim.opt

g.python3_host_prog = vim.fn.stdpath("data") .. "/venv/bin/python"
g.netrw_liststyle = 3

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.scrolloff = 999

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
