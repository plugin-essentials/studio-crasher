local vide = require(script.Parent.Parent.Parent.packages.vide)
local types = require(script.Parent.Parent.Parent.types)

export type ToolbarButtonProps = {
  toolbar: PluginToolbar,
  id: string,
  text: string?,
  tooltip: string,
  icon: string,
  active: types.SourcedAs<boolean>,
  onClick: () -> ()?
}

local function ToolbarButton(props: ToolbarButtonProps): PluginToolbarButton
  local button = props.toolbar:CreateButton(props.id, props.tooltip, props.icon, props.text)

  if props.onClick then
    vide.cleanup(button.Click:Connect(props.onClick))
  end

  vide.effect(function()
    button:SetActive(vide.read(props.active))
  end)

  return button
end

return ToolbarButton