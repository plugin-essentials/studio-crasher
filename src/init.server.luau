local vide = require(script.packages.vide)
local app = require(script.ui.App)

function mount<A...>(component: (A...) -> Instance?, ...: A...)
  local arguments = table.pack(...)
  return vide.mount(function()
    return component(table.unpack(arguments))
  end)
end

mount(app, {
  plugin = plugin
})