local vide = require(script.packages.vide)
local app = require(script.ui.App)

local function mount<A...>(component: (A...) -> Instance?, ...: A...)
	local arguments = table.pack(...)
	return vide.mount(function()
		return component(table.unpack(arguments))
	end)
end

local unmount = mount(app, {
	plugin = plugin,
})

plugin.Unloading:Connect(unmount)
