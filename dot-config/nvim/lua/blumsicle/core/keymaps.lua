vim.g.mapleader = " "

local set = vim.keymap.set

set("i", "jk", "<esc>", { desc = "Escape insert mode" })

set("i", "<c-s>", "<esc><cmd>w<cr>a", { desc = "Save current file" })
set("n", "<c-s>", "<cmd>w<cr>", { desc = "Save current file" })
set("i", "<c-s-s>", "<esc><cmd>noautocmd w<cr>a", { desc = "Save current file without formatting" })
set("n", "<c-s-s>", "<cmd>noautocmd w<cr>", { desc = "Save current file without formatting" })

set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit neovim" })
set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit neovim and discard changes" })

set("n", "<leader>nh", ":nohlsearch<cr>", { desc = "Clear search highlights" })
set("n", "<leader>nu", "guiwe", { desc = "Lowercase word under cursor" })
set("n", "<leader>nU", "gUiwe", { desc = "Uppercase word under cursor" })

set("n", "<leader>sv", "<c-w>v", { desc = "Split window vertically" })
set("n", "<leader>sh", "<c-w>s", { desc = "Split window horizontally" })
set("n", "<leader>se", "<c-w>=", { desc = "Make splits equal size" })
set("n", "<leader>sx", "<c-w>c", { desc = "Close current split" })
set("n", "<leader>so", "<c-w>o", { desc = "Close all other splits" })

set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })

set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
set("n", "<leader>bx", "<cmd>bnext<bar>bdelete #<cr>", { desc = "Close current buffer" })
set("n", "<leader>bb", "<cmd>buffer #<cr>", { desc = "Go to last buffer" })

set("n", "<c-h>", "<c-w>h", { desc = "Move left one window" })
set("n", "<c-l>", "<c-w>l", { desc = "Move right one window" })
set("n", "<c-j>", "<c-w>j", { desc = "Move down one window" })
set("n", "<c-k>", "<c-w>k", { desc = "Move up one window" })
