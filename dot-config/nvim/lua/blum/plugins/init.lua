local specs = {
    require("blum.plugins.colorscheme"),
    require("blum.plugins.lazygit"),
    require("blum.plugins.mini"),
    require("blum.plugins.lsp"),
    require("blum.plugins.lsp_file_operations"),
    require("blum.plugins.lazydev"),
    require("blum.plugins.blink"),
    require("blum.plugins.conform"),
    require("blum.plugins.noice"),
    require("blum.plugins.oil"),
    require("blum.plugins.treesitter"),
    require("blum.plugins.treesitter_context"),
}

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
