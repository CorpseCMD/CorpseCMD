--[[

loadstring(game:HttpGet("https://raw.githubusercontent.com/CorpseCMD/CorpseCMD/main/KStreak%20Testing%20SlapHax%20Gui.lua"))()

]]
local SlapHax = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local set = Instance.new("TextButton")
local auto = Instance.new("TextButton")
local drop = Instance.new("TextButton")
local dropam = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local HIDE = Instance.new("TextButton")

SlapHax.Name = "SlapHax"
SlapHax.Parent = game.StarterGui.Other stuff
SlapHax.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = SlapHax
Frame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0888934731, 0, 0.132162884, 0)
Frame.Size = UDim2.new(0.237725943, 0, 0.233133063, 0)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.613540471, 0, 0.125842795, 0)
TextBox.Size = UDim2.new(0.351391524, 0, 0.206773892, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.PlaceholderText = "Amount [any words work]"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

set.Name = "set"
set.Parent = Frame
set.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
set.BorderColor3 = Color3.fromRGB(0, 0, 0)
set.BorderSizePixel = 0
set.Position = UDim2.new(0.0591900311, 0, 0.417536139, 0)
set.Size = UDim2.new(0.254455954, 0, 0.223098144, 0)
set.Font = Enum.Font.SourceSans
set.Text = "Set"
set.TextColor3 = Color3.fromRGB(0, 0, 0)
set.TextScaled = true
set.TextSize = 14.000
set.TextWrapped = true

auto.Name = "auto"
auto.Parent = Frame
auto.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
auto.BorderColor3 = Color3.fromRGB(0, 0, 0)
auto.BorderSizePixel = 0
auto.Position = UDim2.new(0.0591900311, 0, 0.714362204, 0)
auto.Size = UDim2.new(0.315040678, 0, 0.223098144, 0)
auto.Font = Enum.Font.SourceSans
auto.Text = "auto set normal amount of slaps to avoid admins [OFF]"
auto.TextColor3 = Color3.fromRGB(0, 0, 0)
auto.TextScaled = true
auto.TextSize = 14.000
auto.TextWrapped = true

drop.Name = "drop"
drop.Parent = Frame
drop.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
drop.BorderColor3 = Color3.fromRGB(0, 0, 0)
drop.BorderSizePixel = 0
drop.Position = UDim2.new(0.615378201, 0, 0.711372793, 0)
drop.Size = UDim2.new(0.315040678, 0, 0.223098144, 0)
drop.Font = Enum.Font.SourceSans
drop.Text = "Drop"
drop.TextColor3 = Color3.fromRGB(0, 0, 0)
drop.TextScaled = true
drop.TextSize = 14.000
drop.TextWrapped = true

dropam.Name = "dropam"
dropam.Parent = Frame
dropam.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
dropam.BorderColor3 = Color3.fromRGB(0, 0, 0)
dropam.BorderSizePixel = 0
dropam.Position = UDim2.new(0.684860408, 0, 0.397913724, 0)
dropam.Size = UDim2.new(0.245368227, 0, 0.272070915, 0)
dropam.Font = Enum.Font.SourceSans
dropam.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
dropam.PlaceholderText = "How many bundles of slaps to drop? 2 bundles of 5 = 10 slaps total"
dropam.Text = ""
dropam.TextColor3 = Color3.fromRGB(0, 0, 0)
dropam.TextScaled = true
dropam.TextSize = 14.000
dropam.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, -8.30294553e-08, 0)
TextLabel.Size = UDim2.new(0.605847478, 0, 0.397223532, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "SlapHax Gui - @CorpseCMD"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 25)
UICorner.Parent = Frame

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Thickness = 5
UIStroke.Parent = Frame

HIDE.Name = "HIDE"
HIDE.Parent = SlapHax
HIDE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HIDE.BackgroundTransparency = 1.000
HIDE.BorderColor3 = Color3.fromRGB(0, 0, 0)
HIDE.BorderSizePixel = 0
HIDE.Position = UDim2.new(0.182279244, 0, 0.305482566, 0)
HIDE.Size = UDim2.new(0.0502838604, 0, 0.0434782617, 0)
HIDE.Font = Enum.Font.SourceSans
HIDE.Text = "Toggle gui"
HIDE.TextColor3 = Color3.fromRGB(0, 0, 0)
HIDE.TextScaled = true
HIDE.TextSize = 14.000
HIDE.TextWrapped = true

local function EFSRPI_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local tb = script.Parent.TextBox
	
	local amountToDrop = script.Parent.dropam
	local dropSlaps:RemoteEvent = game.ReplicatedStorage:FindFirstChild("DropSlaps")
	local plr = game.Players.LocalPlayer
	if dropSlaps then
		script.Parent.Parent.HIDE.MouseButton1Click:Connect(function()
			script.Parent.Visible = not script.Parent.Visible
			script.Parent.Parent.HIDE.TextTransparency = script.Parent.Visible and 0 or 0.75
		end)
		script.Parent.drop.MouseButton1Click:Connect(function()
			local char = plr.Character or plr.CharacterAdded:Wait()
			if char and char:FindFirstChild("Head") then
				if tonumber(tb.Text) then
					local ogCF = char.HumanoidRootPart.CFrame
					char:MoveTo(Vector3.new(0,999,9999))
					task.wait(plr:GetNetworkPing()*1.1 + 0.5)
					dropSlaps:FireServer((tonumber(tb.Text) or 0) * -1 * (tonumber(amountToDrop.Text) or 1))
					task.wait(0.1)
					char:PivotTo(ogCF)
					task.wait(plr:GetNetworkPing()*1.1 + 0.4)
					for i=1,tonumber(amountToDrop.Text) or 1 do
						dropSlaps:FireServer(tonumber(tb.Text) or 0)
					end
				else
					for i=1,tonumber(amountToDrop.Text) or 1 do
						dropSlaps:FireServer(tb.Text)
					end
				end
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
		local autoToggle=false
		script.Parent.auto.MouseButton1Click:Connect(function()
			autoToggle = not autoToggle
			if autoToggle then
				script.Parent.auto.Text = "auto set normal amount of slaps to avoid admins [ON]"
			else
				script.Parent.auto.Text = "auto set normal amount of slaps to avoid admins [OFF]"
			end
		end)
		while true do
			task.wait()
			local slaps = plr.leaderstats.Slaps
			if slaps.Value > 50000 or slaps.Value < 10 and autoToggle then
				local char = plr.Character or plr.CharacterAdded:Wait()
				if char and char:FindFirstChild("Head") then
					task.wait(0.55)
					if slaps.Value > 50000 or slaps.Value < 10 then
						local ogCF = char.HumanoidRootPart.CFrame
						char:MoveTo(Vector3.new(0,999,9999))
						task.wait(plr:GetNetworkPing()*1.1 + 0.5)
						dropSlaps:FireServer(plr.leaderstats.Slaps.Value - math.random(25011,33125))
						task.wait(plr:GetNetworkPing()*1.1 + 0.5)
						char:PivotTo(ogCF)
						task.wait(1)
					end
				end
			end
		end
	else
		local StarterGui = game:GetService("StarterGui")
		local bindable = Instance.new("BindableFunction")
	
		function bindable.OnInvoke(response)
			if response == "Yes" then
				game:GetService("TeleportService"):Teleport(10914197474,game.Players.LocalPlayer)
			end
		end
	
		StarterGui:SetCore("SendNotification", {
			Title = "Wrong game.",
			Text = "Would you like to teleport to the game this script is meant to be used in?",
			Duration = 5,
			Callback = bindable,
			Button1 = "Yes",
			Button2 = "No"
		})
	end
end
coroutine.wrap(EFSRPI_fake_script)()
