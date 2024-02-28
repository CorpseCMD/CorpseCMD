-- Gui to Lua
-- Version: 3.6

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local set = Instance.new("TextButton")
local auto = Instance.new("TextButton")
local drop = Instance.new("TextButton")

-- Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(168, 168, 168)
Frame.BackgroundTransparency = 0.750
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0921375901, 0, 0.178861782, 0)
Frame.Size = UDim2.new(0.197174445, 0, 0.295934945, 0)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0591900311, 0, 0.0714286193, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.PlaceholderText = "Amount"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

set.Name = "set"
set.Parent = Frame
set.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
set.BorderColor3 = Color3.fromRGB(0, 0, 0)
set.BorderSizePixel = 0
set.Position = UDim2.new(0.0591900311, 0, 0.422977597, 0)
set.Size = UDim2.new(0, 104, 0, 41)
set.Font = Enum.Font.SourceSans
set.Text = "Set"
set.TextColor3 = Color3.fromRGB(0, 0, 0)
set.TextScaled = true
set.TextSize = 14.000
set.TextWrapped = true

auto.Name = "auto"
auto.Parent = Frame
auto.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
auto.BorderColor3 = Color3.fromRGB(0, 0, 0)
auto.BorderSizePixel = 0
auto.Position = UDim2.new(0.0591900311, 0, 0.714362204, 0)
auto.Size = UDim2.new(0, 104, 0, 41)
auto.Font = Enum.Font.SourceSans
auto.Text = "auto set normal amount of slaps to avoid admins"
auto.TextColor3 = Color3.fromRGB(0, 0, 0)
auto.TextScaled = true
auto.TextSize = 14.000
auto.TextWrapped = true

drop.Name = "drop"
drop.Parent = Frame
drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
drop.BorderColor3 = Color3.fromRGB(0, 0, 0)
drop.BorderSizePixel = 0
drop.Position = UDim2.new(0.45482865, 0, 0.422977597, 0)
drop.Size = UDim2.new(0, 104, 0, 41)
drop.Font = Enum.Font.SourceSans
drop.Text = "Drop"
drop.TextColor3 = Color3.fromRGB(0, 0, 0)
drop.TextScaled = true
drop.TextSize = 14.000
drop.TextWrapped = true

-- Scripts:

local function BQOQVJO_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local tb = script.Parent.TextBox
	local dropSlaps:RemoteEvent = game.ReplicatedStorage:FindFirstChild("DropSlaps")
	local plr = game.Players.LocalPlayer
	if dropSlaps then
		script.Parent.drop.MouseButton1Click:Connect(function()
			local char = plr.Character or plr.CharacterAdded:Wait()
			if char and char:FindFirstChild("Head") then
				local ogCF = char.HumanoidRootPart.CFrame
				char:MoveTo(Vector3.new(0,999,9999))
				task.wait(plr:GetNetworkPing()*1.1 + 0.5)
				dropSlaps:FireServer((tonumber(tb.Text) or 0) * -1)
				task.wait(0.1)
				char:PivotTo(ogCF)
				task.wait(plr:GetNetworkPing()*1.1 + 0.4)
				dropSlaps:FireServer(tonumber(tb.Text) or 0)
			end
		end)
		script.Parent.set.MouseButton1Click:Connect(function()
			local char = plr.Character or plr.CharacterAdded:Wait()
			if char and char:FindFirstChild("Head") then
				local ogCF = char.HumanoidRootPart.CFrame
				char:MoveTo(Vector3.new(0,999,9999))
				task.wait(plr:GetNetworkPing()*1.1 + 0.5)
				dropSlaps:FireServer(plr.leaderstats.Slaps.Value - (tonumber(tb.Text) or 0))
				task.wait(plr:GetNetworkPing()*1.1 + 0.5)
				char:PivotTo(ogCF)
			end
		end)
		script.Parent.auto.MouseButton1Click:Wait()
		script.Parent.auto:Destroy()
		while true do
			task.wait()
			local slaps = plr.leaderstats.Slaps
			if slaps.Value > 50000 or slaps.Value < 10 then
				local char = plr.Character or plr.CharacterAdded:Wait()
				if char and char:FindFirstChild("Head") then
					task.wait(0.52)
					if slaps.Value > 50000 or slaps.Value < 10 then
						local ogCF = char.HumanoidRootPart.CFrame
						char:MoveTo(Vector3.new(0,999,9999))
						task.wait(plr:GetNetworkPing()*1.1 + 0.5)
						dropSlaps:FireServer(plr.leaderstats.Slaps.Value - math.random(120,15000))
						task.wait(plr:GetNetworkPing()*1.1 + 0.5)
						char:PivotTo(ogCF)
						task.wait(1)
					end
				end
			end
		end
	end
end
coroutine.wrap(BQOQVJO_fake_script)()
