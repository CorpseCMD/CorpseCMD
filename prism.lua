-- Checking permissions
local p_requiredFunctions = {["readfile"] = readfile,["writefile"] = writefile,["isfile"] = isfile,["delfile"] = delfile,["setclipboard"] = setclipboard}
local p_requiredFunctionNames = {"readfile","writefile","isfile","delfile","setclipboard"}
local p_functionsNotFound = {}
for i=1,#p_requiredFunctionNames do
	local funct = p_requiredFunctions[p_requiredFunctionNames[i]]
	if not funct then
		table.insert(p_functionsNotFound,p_requiredFunctionNames[i])
	end
end
if #p_functionsNotFound>0 then
	warn("[ERROR] - The following required functions are missing: " .. table.concat(p_functionsNotFound,", "))
	return
end
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local function keySystem()
	local KEYVALIDATED, EndKeySystem = false,false
	local kgLib = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
	local trueData = "7a8a932506e048e5b9bed5636fd62a4a"
	local falseData = "0747f6fe49ce4bf78448bdaaa030eb72"
	local publicToken = "c2a824c76cff471494bd8e44a0edbd60"
	local privateToken = "29ba1eabab99422982b0d3bf9027c847"

	if not (publicToken and publicToken ~= "" and privateToken and privateToken ~= "" and trueData and trueData ~= "" and falseData and falseData ~= "") then
		warn("[KeyGuard] - Missing required information for initialization. Please check the tokens and data. | PLEASE TELL ME IF THIS APPEARS IN CONSOLE!")
		return
	end
	kgLib.Set({
		publicToken = publicToken,
		privateToken = privateToken,
		trueData = trueData,
		falseData = falseData,
	})

	local Directory = "PrismHubSavedKey.txt"
	function ValidateSaved()
		local storedKey = readfile(Directory)
		if storedKey and storedKey ~= "" then
			local verificationStartTime = os.clock()
			local response = kgLib.validateDefaultKey(storedKey)
			local verificationEndTime = os.clock()
			local verificationTime = verificationEndTime - verificationStartTime
			print("Time taken to verify stored key: " .. verificationTime .. " seconds")
			if response == trueData then
				print("Saved Key is valid")
				return true
			else
				print("Saved Key is invalid")
				delfile(Directory)
				return false
			end
		end
	end
	if isfile(Directory) then
		if ValidateSaved() then
			KEYVALIDATED = true
			EndKeySystem = true
			return KEYVALIDATED
		end
	end
	local Window = Fluent:CreateWindow({
		Title = "Prism Hub - Key",
		SubTitle = "Key system for Prism Hub",
		TabWidth = 160,
		Size = UDim2.fromOffset(520, 320),
		Acrylic = false,
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.Minus
	})
	local Tabs = {
		KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
	}
	local InputKey = Tabs.KeySys:AddInput("InputKey", {
		Title = "Input Key",
		Description = "Insert your key...",
		Default = "",
		Placeholder = "Enter key…",
		Numeric = false,
		Finished = false
	})
	local Checkkey = Tabs.KeySys:AddButton({
		Title = "Check Key",
		Description = "Enter Key before pressing this button",
		Callback = function()
			print(InputKey.Value)
			local response = kgLib.validateDefaultKey(InputKey.Value)
			if response == trueData then
				writefile(Directory, InputKey.Value)
				KEYVALIDATED = true
				EndKeySystem = true
				return KEYVALIDATED
			end
		end
	})
	local Getkey = Tabs.KeySys:AddButton({
		Title = "Get Key",
		Description = "Get Key here",
		Callback = function()
			setclipboard(tostring(kgLib.getLink()) or "Failed to get key, please try again later..")
			Fluent:Notify({
				Title = "Link Copied",
				Content = "Copied to clipboard",
				SubContent = "Paste the link in your browser to continue!", -- Optional
				Duration = 8 -- Set to nil to make the notification not disappear
			})
		end
	})
	Window:SelectTab(1)
	repeat wait(0.1) until EndKeySystem == true or KEYVALIDATED == true
	if Window then Window:Destroy() end
	return KEYVALIDATED
end
local keySuccess = keySystem()

assert(keySuccess,"KEY FAILED!! YOU ARE NOT WORTHY...")

--{  [[ KEY VALID ]]  }--

-- Define services such as replicated storage, players, etc.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Prism_Icon = "rbxassetid://10653375651"
local plr = Players.LocalPlayer
local prismAnimationKey = "rbxassetid://6943"
-- Get other users with Prism Hub loaded

local LocalCharacterAdded = function(char:Model)
	local hum = char:FindFirstChildOfClass("Humanoid")
	local anim = Instance.new("Animation")
	pcall(function()
		anim.AnimationId = prismAnimationKey
		hum:LoadAnimation(anim):Play(0,0,0.001)
	end)
end
if plr.Character then
	LocalCharacterAdded(plr.Character)
end
plr.CharacterAdded:Connect(LocalCharacterAdded)
local PlayerHasPrismHub = function(tplr:Player)
	if tplr then
		local tchar = tplr.Character
		if tchar then
			local tHum = tchar:FindFirstChildOfClass("Humanoid")
			if tHum then
				for i,v in tHum:GetPlayingAnimationTracks() do
					if v.Animation.AnimationId == prismAnimationKey then
						return true
					end
				end
			end
		end
	end
end

local checkPrismHubUsers = Players.PlayerAdded:Connect(function(tplr)
	local userHasPrism = PlayerHasPrismHub(tplr)
	if userHasPrism then
		tplr.CharacterAdded:Connect(function(tchar)
			local head = tchar:WaitForChild("Head")
			local Nametag = head:WaitForChild("Nametag")
			Nametag.Size = UDim2.new(6,0,1,0)
			local IMGLB = Instance.new("ImageLabel")
			IMGLB.Parent = Nametag
			IMGLB.ScaleType = Enum.ScaleType.Fit
			IMGLB.LayoutOrder = 1
			IMGLB.Size = UDim2.new(0.25,0,1,0)
			IMGLB.BackgroundTransparency = 1
			IMGLB.Image = Prism_Icon

			local TL = Nametag:WaitForChild("TextLabel")
			TL.LayoutOrder = 2
			TL.Size = UDim2.new(0.75,0,1,0)
			TL.TextColor3 = Color3.new(0,0.85,1)
		end)
	end
end)
