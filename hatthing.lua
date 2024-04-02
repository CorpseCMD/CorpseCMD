local gui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ActivateButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")

gui.Name = "EpikHatGui_CORPSECMD"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false

Frame.Parent = gui
Frame.BackgroundColor3 = Color3.fromRGB(255, 119, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.158740357, 0, 0.146263912, 0)
Frame.Size = UDim2.new(0, 251, 0, 189)

ActivateButton.Name = "ActivateButton"
ActivateButton.Parent = Frame
ActivateButton.BackgroundColor3 = Color3.fromRGB(194, 87, 0)
ActivateButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ActivateButton.BorderSizePixel = 0
ActivateButton.Position = UDim2.new(0.195458159, 0, 0.628730178, 0)
ActivateButton.Size = UDim2.new(0, 150, 0, 61)
ActivateButton.Font = Enum.Font.Highway
ActivateButton.Text = "Toggle [Disabled]"
ActivateButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ActivateButton.TextScaled = true
ActivateButton.TextSize = 14.000
ActivateButton.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0996015966, 0, 0.0740740746, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Hat man gui by @CorpseCMD"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(251, 255, 0)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0996015966, 0, 0.396825403, 0)
TextBox.Size = UDim2.new(0, 200, 0, 38)
TextBox.Font = Enum.Font.FredokaOne
TextBox.PlaceholderColor3 = Color3.fromRGB(154, 154, 154)
TextBox.PlaceholderText = "Mode"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true



gui.Frame.Draggable = true
local plr = game.Players.LocalPlayer
local enabled = false
local mainPart = Instance.new("Part")
mainPart.Parent = workspace
mainPart.Name = "HatIndicator_CORPSECMD"
mainPart.Size = Vector3.one
mainPart.Anchored = true
mainPart.Material = Enum.Material.Neon
if not plr.Character then plr.CharacterAdded:Wait() end
mainPart.Position = plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.HumanoidRootPart.Position
mainPart.CanCollide = false
mainPart.Transparency = 1

local Modes = {
	{ --Mode 1
		Vector3.new(-1,-1,0),
		Vector3.new(1,-1,0),
		Vector3.new(0,0,0),
		Vector3.new(0,1,0),
		Vector3.new(0,2,0),
		Vector3.new(0,3,0),
		Vector3.new(0,4,0),
		Vector3.new(0,5,0),
		Vector3.new(0,6,0),
		Vector3.new(0,7,0),
	}, --Mode 1 END
	
	{ --Mode 2
		Vector3.new(-1.2,-1,0),
		Vector3.new(1.2,-1,0),
		Vector3.new(0,0,0),
		Vector3.new(0,1,0),
		Vector3.new(-1.2,1.2,0),
		Vector3.new(1.2,1.2,0),
		Vector3.new(0,2,0),
	}, --Mode 2 END
}

local rgb = 0
local vel = Vector3.zero
game:GetService("UserInputService").InputBegan:Connect(function(inp,gp)
	if gp or not mainPart then return end
	if inp.KeyCode == Enum.KeyCode.Q then
		vel = Vector3.new(0,1,0)
	elseif inp.KeyCode == Enum.KeyCode.E then
		vel = Vector3.new(0,-1,0)
	end
end)
game:GetService("UserInputService").InputEnded:Connect(function(inp,gp)
	if gp or not mainPart then return end
	if inp.KeyCode == Enum.KeyCode.Q and vel.Y == 1 then
		vel = Vector3.zero
	elseif inp.KeyCode == Enum.KeyCode.E and vel.Y == -1 then
		vel = Vector3.zero
	end
end)

gui.Frame.ActivateButton.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		mainPart.Transparency = 0
		mainPart.Position = (plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) and plr.Character.HumanoidRootPart.Position
		gui.Frame.ActivateButton.Text = "Enabled"
		local hats = {}
		local respawnConn = plr.CharacterAppearanceLoaded:Connect(function(char)
			local hum = char:WaitForChild("Humanoid")
			hum.Health = 0
			table.clear(hats)
			for i, hat in hum:GetAccessories() do
				table.insert(hats,hat)
				local part = hat:FindFirstChild("Handle")
				part.CanCollide = false
				part.CustomPhysicalProperties = PhysicalProperties.new(0.01,0,0,0,0)
				part:BreakJoints()
			end
		end)
		if plr.Character then 
			plr.Character:BreakJoints() 
			table.clear(hats)
			local hum = plr.Character:WaitForChild("Humanoid")
			for i, hat in hum:GetAccessories() do
				table.insert(hats,hat)
				local part = hat:FindFirstChild("Handle")
				part.CanCollide = false
				part.CustomPhysicalProperties = PhysicalProperties.new(0.01,0,0,0,0)
				part:BreakJoints()
			end
		end

		while enabled do
			task.wait()
			mainPart.Color = Color3.fromHSV(rgb,1,0.8)
			local rcp = RaycastParams.new()
			rcp.RespectCanCollide = true
			rcp.FilterDescendantsInstances = {plr.Character,mainPart}
			rcp.FilterType = Enum.RaycastFilterType.Exclude
			
			local camPos = game.Workspace.CurrentCamera.CFrame.Position
			local rc = game.Workspace:Raycast(camPos,plr:GetMouse().Hit.Position - camPos,rcp)
			game.Workspace.CurrentCamera.CameraSubject = mainPart
			if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
				mainPart.Position += plr.Character:FindFirstChildOfClass("Humanoid").MoveDirection + vel
			end
			local char = plr.Character
			if not char then plr.CharacterAdded:Wait() continue end
			for i=1,math.clamp(#hats,0,#Modes[(tonumber(gui.Frame.TextBox.Text) or 2)]) do
				local hat = hats[i]
				local part:BasePart = hat:FindFirstChild("Handle")
				if part and char and char:FindFirstChild("HumanoidRootPart") then
					if gui.Frame.TextBox.Text ~= "3" then
						part.CFrame = mainPart.CFrame + (Modes[(tonumber(gui.Frame.TextBox.Text) or 2)][i] or Vector3.zero)
					else
						part.CFrame = mainPart.CFrame + Vector3.new(math.random(-4,4),3,math.random(-4,4))
					end
				end
			end
		end
		respawnConn:Disconnect()
	else
		mainPart.Transparency = 1
		gui.Frame.ActivateButton.Text = "Disabled"
		if plr.Character then
			game.Workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildOfClass("Humanoid")
		else
			game.Workspace.CurrentCamera.CameraSubject = plr.CharacterAdded:Wait():FindFirstChildOfClass("Humanoid")
		end
	end
end)

while true do
	rgb += 0.01
	if rgb > 1 then
		rgb = 0
	end
	gui.Frame.ActivateButton.TextColor3 = Color3.fromHSV(rgb,1,0.8)
	task.wait()
end
