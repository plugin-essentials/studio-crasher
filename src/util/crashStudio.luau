local function crashStudio()
	local particleEmitter = Instance.new("ParticleEmitter")
	particleEmitter.Archivable = false
	particleEmitter.Parent = workspace.Terrain

	particleEmitter.Lifetime = NumberRange.new(math.huge)
	task.wait(0.5)
	particleEmitter.Lifetime = NumberRange.new(math.huge - math.huge)
end

return crashStudio
