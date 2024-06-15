local function crashStudio()
	local particleEmitter = Instance.new("ParticleEmitter")
	particleEmitter.Name = "studioCrasher"
	particleEmitter.Archivable = false
	particleEmitter.Lifetime = NumberRange.new(math.huge)
	particleEmitter.Parent = workspace.Terrain

	particleEmitter:Emit()
	task.wait()
	particleEmitter.Lifetime = NumberRange.new(0 / 0)
end

return crashStudio
