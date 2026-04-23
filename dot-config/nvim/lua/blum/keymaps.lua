vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set
local diagnostic_virtual_text_enabled = true

set("i", "jk", "<esc>", { desc = "Escape insert mode" })
set({ "n", "x" }, "j", "v:count ? 'j' : 'gj'", { desc = "Move down one display line", expr = true })
set({ "n", "x" }, "k", "v:count ? 'k' : 'gk'", { desc = "Move up one display line", expr = true })
set("n", "<leader>uh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
set("n", "<leader>uv", function()
	diagnostic_virtual_text_enabled = not diagnostic_virtual_text_enabled

	vim.diagnostic.config({
		virtual_text = diagnostic_virtual_text_enabled and { source = true } or false,
	})
end, { desc = "Toggle diagnostic virtual text" })

set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current file" })
set("n", "<leader>W", "<cmd>noautocmd w<cr>", { desc = "Save current file without formatting" })

set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit neovim" })
set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit neovim and discard changes" })

set("n", "<leader>sv", "<c-w>v", { desc = "Split window vertically" })
set("n", "<leader>sh", "<c-w>s", { desc = "Split window horizontally" })
set("n", "<leader>se", "<c-w>=", { desc = "Make splits equal size" })
set("n", "<leader>s]", "<cmd>vertical resize +5<cr>", { desc = "Increase split width" })
set("n", "<leader>s[", "<cmd>vertical resize -5<cr>", { desc = "Decrease split width" })
set("n", "<leader>s>", "<cmd>resize +5<cr>", { desc = "Increase split height" })
set("n", "<leader>s<", "<cmd>resize -5<cr>", { desc = "Decrease split height" })
set("n", "<leader>sx", "<c-w>c", { desc = "Close current split" })
set("n", "<leader>so", "<c-w>o", { desc = "Close all other splits" })
set("n", "<leader>sw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle word wrap" })

set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })

set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
set("n", "<leader>bb", "<cmd>buffer #<cr>", { desc = "Go to last buffer" })

set("n", "<leader>pu", vim.pack.update, { desc = "Update plugins" })
set("n", "<leader>pU", function()
	vim.pack.update(nil, { force = true })
end, { desc = "Update plugins immediately" })

set("n", "<c-h>", "<c-w>h", { desc = "Move left one window" })
set("n", "<c-l>", "<c-w>l", { desc = "Move right one window" })
set("n", "<c-j>", "<c-w>j", { desc = "Move down one window" })
set("n", "<c-k>", "<c-w>k", { desc = "Move up one window" })
