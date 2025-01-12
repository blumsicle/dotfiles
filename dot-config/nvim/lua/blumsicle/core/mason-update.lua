local M = {
	needs_update = {},
}

function M.updates()
	local icon = " "
	return icon .. #M.needs_update
end

function M.has_updates()
	return #M.needs_update > 0
end

function M.get_updates()
	local mason_registry = require("mason-registry")
	local installed_packages = mason_registry.get_installed_packages()
	for _, package in ipairs(installed_packages) do
		package:check_new_version(function(success, new_version)
			if success then
				table.insert(M.needs_update, new_version)
			end
		end)
	end
end

return M
