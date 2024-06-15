local vide = require(script.Parent.Parent.packages.vide)

local function cleanup(...: any)
  for _, item in {...} do
    vide.cleanup(item)
  end
end

return cleanup