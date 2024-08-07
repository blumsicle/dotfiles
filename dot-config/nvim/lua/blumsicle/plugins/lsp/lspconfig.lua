return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"rcarriga/nvim-notify",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local set = vim.keymap.set

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

				opts.desc = "Go to declaration"
				set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

				opts.desc = "Show LSP implementations"
				set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

				opts.desc = "Show LSP type definitions"
				set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

				opts.desc = "See available code actions"
				set({ "n", "x" }, "<leader>na", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				set("n", "<leader>nr", vim.lsp.buf.rename, opts)

				opts.desc = "Toggle LSP inlay hints"
				set("n", "<leader>ni", function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
					require("notify")(enabled and "disabled" or "enabled", vim.log.levels.INFO, {
						title = "LSP Inlay Hints",
						on_open = function()
							vim.lsp.inlay_hint.enable(not enabled)
						end,
					})
				end, opts)

				opts.desc = "Show buffer diagnostics"
				set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

				opts.desc = "Show line diagnostics"
				set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				set("n", "<leader>nR", ":LspRestart<cr>", opts)
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

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
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
