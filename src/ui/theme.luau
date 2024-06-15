local vide = require(script.Parent.Parent.packages.vide)

local studio = settings():GetService("Studio")

local currentTheme = vide.source(studio.Theme)

studio.ThemeChanged:Connect(function()
  currentTheme(studio.Theme)
end)

local function theme(color: Enum.StudioStyleGuideColor, modifier: Enum.StudioStyleGuideModifier?): vide.Source<Color3>
  return function()
    return currentTheme():GetColor(color, modifier)
  end
end

return theme
