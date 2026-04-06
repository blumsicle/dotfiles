local plugin_names = {
	"colorscheme",
	"git_blame",
	"lazydev",
	"lint",
	"mini_core",
	"mini_ui",
	"mini_workflow",
	"lsp",
	"lsp_file_operations",
	"blink",
	"conform",
	"snacks",
	"noice",
	"oil",
	"treesitter",
	"treesitter_context",
	"treesitter_textobjects",
}

local specs = vim.tbl_map(function(name)
	return require("blum.plugins." .. name)
end, plugin_names)

local packages = {}

for _, spec in ipairs(specs) do
	vim.list_extend(packages, spec.packages or {})
end

vim.pack.add(packages)

for _, spec in ipairs(specs) do
	if spec.setup then
		spec.setup()
	end
end
