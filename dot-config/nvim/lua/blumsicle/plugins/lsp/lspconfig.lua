return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"rcarriga/nvim-notify",
		"folke/lazydev.nvim",
		{ "antosha417/nvim-lsp-file-operations", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local set = function(mode, lhs, rhs, desc)
					local opts = { buffer = ev.buf, silent = true, desc = desc }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				set("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", "Show LSP definitions")
				set("n", "gR", "<cmd>Telescope lsp_references<cr>", "Show LSP references")
				set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "Show LSP implementations")
				set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", "Show LSP type definitions")

				set({ "n", "x" }, "<leader>na", vim.lsp.buf.code_action, "See available code actions")
				set("n", "<leader>nr", vim.lsp.buf.rename, "Smart rename")
				set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", "Show buffer diagnostics")
				set("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
				set("n", "<leader>nR", ":LspRestart<cr>", "Restart LSP")
				-- set("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
				--
				set("n", "<leader>ni", function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
					require("notify")(enabled and "disabled" or "enabled", vim.log.levels.INFO, {
						title = "LSP Inlay Hints",
						on_open = function()
							vim.lsp.inlay_hint.enable(not enabled)
						end,
					})
				end, "Toggle LSP inlay hints")
			end,
		})

		vim.lsp.config("*", {
			capabilities = cmp_nvim_lsp.default_capabilities(),
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
			float = {
				source = "if_many",
			},
			virtual_text = false,
		})
	end,
}
