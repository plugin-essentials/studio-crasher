export type ToolbarProps = {
  plugin: Plugin,
  name: string
}

local function Toolbar(props: ToolbarProps): PluginToolbar
  return props.plugin:CreateToolbar(props.name)
end

return Toolbar