local constants = require(script.Parent.Parent.constants)
local cleanup = require(script.Parent.Parent.util.cleanup)
local crashStudio = require(script.Parent.Parent.util.crashStudio)
local Toolbar = require(script.Parent.studio.Toolbar)
local ToolbarButton = require(script.Parent.studio.ToolbarButton)

export type AppProps = {
	plugin: Plugin,
}

local function App(props: AppProps)
	local toolbar = Toolbar {
		plugin = props.plugin,
		name = constants.PLUGIN_NAME,
	}

	local activate = ToolbarButton {
		toolbar = toolbar,
		id = "activate",
		text = "Crash Studio",
		tooltip = "Click to crash Roblox Studio",
		icon = constants.PLUGIN_ICON_ID,
		active = true,
		onClick = crashStudio,
	}

	cleanup(toolbar, activate)
end

return App
