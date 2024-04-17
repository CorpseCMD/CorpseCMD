local lp = game.Players.LocalPlayer
game.Workspace.FallenPartsDestroyHeight = -math.huge
local function GetChar()
	return lp.Character or nil
end

local function GetGun()
	local gun = nil
	for _, pgun in ipairs(lp.Backpack:GetChildren()) do
		if pgun:FindFirstChild("Resources") then
			local char = GetChar()
			if char then gun = pgun end
		end
	end
	if GetChar() then
		local tool = GetChar():FindFirstChildOfClass("Tool")
		if tool and tool:FindFirstChild("Resources") then
			gun = tool
		end
	end
	return gun
end

local function code()
	task.wait(4)
	game:GetService("StarterGui"):SetCore("SendNotification",  {
		Title = "HideAndCheat - @CorpseCMD",
		Text = "HideAndCheat on Top! - Made by @CorpseCMD",
		Icon = "rbxassetid://14223576140",
		Duration = 15
	})
	local gun = GetGun()
	if gun then
		GetChar().Humanoid:EquipTool(gun)
		while gun do
			for _, plr in ipairs(game.Players:GetChildren()) do
				local tchar = plr.Character
				local char = GetChar()
				if tchar and not tchar:FindFirstChildOfClass("Tool") and char and tchar ~= char and tchar:FindFirstChildOfClass("Model") then
					local args = {"FIREB", gun, tchar.PrimaryPart.Position}
					local times = 0
					while times < 35 and tchar:FindFirstChild("Humanoid").Health > 0 and tchar:FindFirstChildOfClass("Model") and char and gun and gun.Parent == char do
						task.wait()
						times += 1
						char:PivotTo(tchar.PrimaryPart.CFrame + tchar.PrimaryPart.CFrame.LookVector * -1.5 + Vector3.new(0,-2,0))
						game:GetService("ReplicatedStorage").Modules.Framework.RemoteManger.SendData:FireServer(unpack(args))
					end
				end
				task.wait(0.05)
			end
			task.wait(1)
		end
	elseif GetChar() and GetChar():FindFirstChildOfClass("Model") then
		local char = GetChar()
		char.PrimaryPart.Position += Vector3.new(0,40,0)
		game:GetService("TweenService"):Create(char.PrimaryPart,TweenInfo.new(0.25,Enum.EasingStyle.Linear,Enum.EasingDirection.In,-1,true),{Position = char.PrimaryPart.Position + Vector3.new(150,0,0)}):Play()
		local part = Instance.new("Part")
		part.Size = Vector3.new(1000,1,1000)
		part.Parent = workspace
		part.Anchored = true
		part.Position = char.PrimaryPart.Position - Vector3.new(0,2,0)
		part.Transparency = 0.5
		while char and char:FindFirstChildOfClass("Humanoid") do
			char:FindFirstChildOfClass("Humanoid"):Move(Vector3.new(26,0,19))
			task.wait()
		end
		part:Destroy()
	end
end

lp.CharacterAdded:Connect(function(char)
	code()
	task.wait(3)
	char.ChildAdded:Connect(function(c)
		if c:IsA("Model") or c.Name == "Prop" or c.Name == "Porp" then
			task.wait(1)
			code()
		end
	end)
end)

code()
