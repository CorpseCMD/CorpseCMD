local CurrentEffect = nil

local Effect_1 = Instance.new("MeshPart")
Effect_1.Name = "Effect_1"
Effect_1.Anchored = true
Effect_1.CanCollide = false
Effect_1.MeshId = "rbxassetid://7720167940"
Effect_1.Transparency = 2
Effect_1.DoubleSided = true
Effect_1.Color = Color3.new(0.00, 0.00, 0.00)
Effect_1.CollisionFidelity = Enum.CollisionFidelity.Default
Effect_1.Material = Enum.Material.Glass
Effect_1.Size = Vector3.new(4.00, 4.00, 4.00)
Effect_1.BrickColor = BrickColor.new("Really black")
Effect_1.Position = Vector3.new(-26.75, 3.00, -9.55)
Effect_1.Parent = game:GetService("ReplicatedStorage")

local Highlight = Instance.new("Highlight")
Highlight.FillColor = Color3.new(0.41, 0.18, 0.18)
Highlight.FillTransparency = -10000000000
Highlight.Parent = Effect_1

local Effect_2 = Instance.new("MeshPart")
Effect_2.Name = "Effect"
Effect_2.Anchored = true
Effect_2.CanCollide = false
Effect_2.MeshId = "rbxassetid://7720167940"
Effect_2.Transparency = 155
Effect_2.DoubleSided = true
Effect_2.Color = Color3.new(0.00, 0.00, 0.00)
Effect_2.CollisionFidelity = Enum.CollisionFidelity.Default
Effect_2.Material = Enum.Material.Glass
Effect_2.Size = Vector3.new(4.00, 4.00, 4.00)
Effect_2.Rotation = Vector3.new(-19.37, 32.96, 10.83)
Effect_2.BrickColor = BrickColor.new("Really black")
Effect_2.Position = Vector3.new(36.41, 6.88, 35.57)
Effect_2.Parent = game:GetService("ReplicatedStorage")

local Highlight = Instance.new("Highlight")
Highlight.FillColor = Color3.new(0.41, 0.18, 0.18)
Highlight.FillTransparency = -10000000000
Highlight.Parent = Effect_2

local Effect_3 = Instance.new("MeshPart")
Effect_3.Name = "Effect_3"
Effect_3.Anchored = true
Effect_3.CanCollide = false
Effect_3.MeshId = "rbxassetid://7720167940"
Effect_3.Transparency = 3
Effect_3.DoubleSided = true
Effect_3.Color = Color3.new(0.00, 0.00, 0.00)
Effect_3.CollisionFidelity = Enum.CollisionFidelity.Default
Effect_3.Material = Enum.Material.Glass
Effect_3.Size = Vector3.new(4.00, 4.00, 4.00)
Effect_3.Rotation = Vector3.new(-170.36, 4.44, 179.25)
Effect_3.BrickColor = BrickColor.new("Really black")
Effect_3.Position = Vector3.new(-28.09, 5.72, -40.52)
Effect_3.Parent = game:GetService("ReplicatedStorage")

local Highlight = Instance.new("Highlight")
Highlight.FillColor = Color3.new(0.36, 0.31, 0.49)
Highlight.FillTransparency = -1
Highlight.Parent = Effect_3
local m = 0
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	m += 1
	if m == 4 then m = 1 end
	if m == 1 then
		CurrentEffect = Effect_1
	elseif m == 2 then
		CurrentEffect = Effect_2
	else
		CurrentEffect = Effect_3
	end
end)

workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
	if CurrentEffect == nil then return end
	CurrentEffect.CFrame = workspace.CurrentCamera.CFrame
end)
