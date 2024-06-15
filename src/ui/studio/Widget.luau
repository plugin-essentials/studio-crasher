local vide = require(script.Parent.Parent.Parent.packages.vide)
local types = require(script.Parent.Parent.Parent.types)

export type WidgetProps = {
  plugin: Plugin,
  id: string,
  title: string,
  dockState: Enum.InitialDockState,
  enabled: types.SourcedAs<boolean>,
  floatSize: Vector2,
  minSize: Vector2,
  zIndexBehavior: Enum.ZIndexBehavior,
  onClose: () -> ()?,
  children: types.Components?
}

local function Widget(props: WidgetProps): DockWidgetPluginGui
  local widget = props.plugin:CreateDockWidgetPluginGui(
    props.id,
    DockWidgetPluginGuiInfo.new(
      props.dockState,
      vide.read(props.enabled),
      false,
      props.floatSize.X,
      props.floatSize.Y,
      props.minSize.X,
      props.minSize.Y
    )
  )

  widget.Title = props.title
  widget.ZIndexBehavior = props.zIndexBehavior

  if props.onClose then
    widget:BindToClose(props.onClose)
  end

  vide.apply(widget) { props.children }
  vide.effect(function()
    widget.Enabled = vide.read(props.enabled)
  end)

  return widget
end

return Widget