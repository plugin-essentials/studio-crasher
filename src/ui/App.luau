local constants = require(script.Parent.Parent.constants)
local vide = require(script.Parent.Parent.packages.vide)
local cleanup = require(script.Parent.Parent.util.cleanup)
local Toolbar = require(script.Parent.studio.Toolbar)
local ToolbarButton = require(script.Parent.studio.ToolbarButton)
local Widget = require(script.Parent.studio.Widget)

export type AppProps = {
  plugin: Plugin
}

local function App(props: AppProps)
  local enabled = vide.source(false)

  local toolbar = Toolbar {
    plugin = props.plugin,
    name = constants.PLUGIN_NAME
  }

  local open = ToolbarButton {
    toolbar = toolbar,
    id = "open",
    text = constants.PLUGIN_NAME,
    tooltip = `Click to toggle the {constants.PLUGIN_NAME} window`,
    icon = constants.PLUGIN_ICON_ID,
    active = enabled,
    onClick = function()
      enabled(not enabled())
    end
  }

  local widget = Widget {
    plugin = props.plugin,
    id = "main",
    title = constants.PLUGIN_NAME,
    dockState = Enum.InitialDockState.Float,
    enabled = enabled,
    floatSize = Vector2.new(400, 300),
    minSize = Vector2.new(200, 200),
    zIndexBehavior = Enum.ZIndexBehavior.Sibling,
    onClose = function()
      enabled(false)
    end,
    children = {}
  }

  cleanup(toolbar, open, widget)
end

return App