local PingPongBallScriptGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")

PingPongBallScriptGui.Name = "PingPongBallScriptGui"
PingPongBallScriptGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PingPongBallScriptGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PingPongBallScriptGui.ResetOnSpawn = false

Frame.Parent = PingPongBallScriptGui
Frame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.130937099, 0, 0.528384268, 0)
Frame.Size = UDim2.new(0, 159, 0, 147)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(127, 127, 127)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.045696523, 0, 0.556864738, 0)
TextButton.Size = UDim2.new(0.905031681, 0, 0.384312451, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Ping Pong Mode: off"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = TextButton

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.045696523, 0, 0.301720649, 0)
TextBox.Size = UDim2.new(0, 143, 0, 30)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Speed (works like walkspeed)"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0.100000001, 0)
UICorner_2.Parent = TextBox

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.045696523, 0, 0.0476190485, 0)
TextLabel.Size = UDim2.new(0, 143, 0, 28)
TextLabel.Font = Enum.Font.PermanentMarker
TextLabel.Text = "Made By @CorpseCMD" -- pls dont delete ty
TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.100000001, 0)
UICorner_3.Parent = Frame


PingPongBallScriptGui.Frame.TextButton.Draggable = true

local enabled = false

local plr = game.Players.LocalPlayer
local OG_GRAVITY = game.Workspace.Gravity
PingPongBallScriptGui.Frame.TextButton.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not char or not hum or not hum.RootPart or hum.Health <= 0 then enabled = false return end
		
		local pingpongBall = Instance.new("Part")
		pingpongBall.Color = Color3.new(1,1,1)
		pingpongBall.Shape = Enum.PartType.Ball
		pingpongBall.Name = "pingpongBall_CorpseCMD"
		pingpongBall.Size = Vector3.one * 4.35
		pingpongBall.Position = hum.RootPart.Position
		local weldc = Instance.new("WeldConstraint")
		pingpongBall.Parent = char
		weldc.Parent = pingpongBall
		weldc.Part0 = hum.RootPart
		weldc.Part1 = pingpongBall
		hum.Sit = true
		task.wait()
		for i, part in char:GetChildren() do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
		hum.RootPart.AssemblyLinearVelocity *= Vector3.new(1,0,1)
		if game.Workspace.Gravity > 0 then OG_GRAVITY = game.Workspace.Gravity end
		game.Workspace.Gravity = 0
		local db = false
		pingpongBall.CanCollide = true
		game.Workspace.CurrentCamera.CameraSubject = pingpongBall
		while pingpongBall and char and hum and hum.Health > 0 and hum.RootPart do
			local Direction = hum.RootPart.AssemblyLinearVelocity.Unit * Vector3.new(1,0,1)
			hum.RootPart.AssemblyAngularVelocity = Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100)) * 5
			hum.RootPart.AssemblyLinearVelocity = Direction * (tonumber(PingPongBallScriptGui.Frame.TextBox.Text) or 25)
			task.wait(.05)
		end
		
	else
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hum = char:FindFirstChildOfClass("Humanoid")
		local pingpongBall = char:FindFirstChild("pingpongBall_CorpseCMD")
		if pingpongBall then pingpongBall:Destroy() game.Workspace.CurrentCamera.CameraSubject = hum end
		game.Workspace.Gravity = OG_GRAVITY or 196.2
		hum.Sit = false
		hum:ChangeState(Enum.HumanoidStateType.Running)
	end
end)

local rgb = 0
while true do
	rgb += 0.01
	if rgb > 1 then
		rgb = 0
	end
	PingPongBallScriptGui.Frame.TextLabel.TextColor3 = Color3.fromHSV(rgb,1,1)
	task.wait()
end
