local DISABLE_SCRIPT = false
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "CorpseCMD | SB", HidePremium = false, SaveConfig = false, ConfigFolder = "CorpseCMD_SB", CloseCallback = function()
	task.spawn(function()
		task.wait(1.5)
		DISABLE_SCRIPT = true
		OrionLib:Destroy()
	end)
end,})
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
task.wait()
local KickTarget = ""
local SlapTarget = ""
local SlapAuraRange = 5
local GiveSlapAuraEnabled = false
local function gplr(Name)
	if DISABLE_SCRIPT then return end
	Name = string.lower(Name)
	local RESULT = {}
	if Name == "all" or Name == "others" then
		local allplrs = Players:GetPlayers()
		if Name == "others" then
			table.remove(allplrs,table.find(allplrs,plr))
		end
		RESULT = allplrs
	elseif Name == "random" then
		local GetPlayers = Players:GetPlayers()
		table.remove(GetPlayers,table.find(GetPlayers,plr))
		if #GetPlayers > 0 then 
			RESULT = {GetPlayers[math.random(1,#GetPlayers)]}
		end

	elseif Name ~= "random" and Name ~= "all" and Name ~= "others" and Name ~= "me" then
		for _,x in next, Players:GetPlayers() do
			if x.Name:lower():match("^"..Name) then
				RESULT = {x};
				break
			elseif x.DisplayName:lower():match("^"..Name) then
				RESULT = {x};
				break
			end
		end
	elseif Name == "me" then
		RESULT = {plr};


	else
		RESULT = {plr};
	end
	return RESULT
end

local SlapDebounce = false
local function slap(targetName)
	if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Slapstick" then return end
	if SlapDebounce or DISABLE_SCRIPT then return end
	local cf = CFrame.new(
		-802.534302, 329.025208, -15.8892279, 0.826691329, 0.00422354275, 0.562639832, -1.31318484e-05, 0.999971986, -0.00748713268, -0.562655687, 0.00618215278, 0.826668262	)
	local char = plr.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	local hrp = hum and hum.RootPart
	local targets = gplr(targetName or "me") or plr
	for i, target in targets do
		SlapDebounce = true
		local targetChar:Model = target.Character
		local isInArena = targetChar:FindFirstChild("isInArena")
		local la = targetChar:FindFirstChild("Left Arm")
		if hrp and la and isInArena and isInArena.Value then
			local args = {
				[1] = la
			}

			game:GetService("ReplicatedStorage").GeneralHit:FireServer(unpack(args))

		end
		task.wait(0.51)
		SlapDebounce = false
	end
end

local kickDebounce = false
local function kick(targetName)
	if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Grab" then return end
	if kickDebounce or DISABLE_SCRIPT then return end
	game.Workspace.Lobby.Teleport3.CanTouch = false
	local cf = CFrame.new(
		-802.534302, 329.025208, -15.8892279, 0.826691329, 0.00422354275, 0.562639832, -1.31318484e-05, 0.999971986, -0.00748713268, -0.562655687, 0.00618215278, 0.826668262	)
	local char = plr.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	local hrp = hum and hum.RootPart
	local targets = gplr(KickTarget) or plr
	for i, target in targets do
		local targetChar = target.Character or target.CharacterAdded:Wait()
		local tpp = targetChar.PrimaryPart
		local tHum = targetChar:FindFirstChildOfClass("Humanoid")
		if hrp and tpp and tHum and hum then
			local ogCF = char.PrimaryPart.CFrame
			char:PivotTo(
				CFrame.new(tpp.Position + tpp.CFrame.LookVector + tHum.MoveDirection * tHum.WalkSpeed / 6,tpp.Position)
			)
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
			task.wait(0.25)
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
			char:PivotTo(cf)
			task.wait(0.09)
			hrp.Anchored = true
			task.wait(1.5)
			hrp.Anchored = false
			char:PivotTo(ogCF)
		end
		task.wait(0.5)
	end
	task.wait(1)
	game.Workspace.Lobby.Teleport3.CanTouch = true
end

task.spawn(function()
	while not DISABLE_SCRIPT do
		task.wait(0.255)
		if GiveSlapAuraEnabled then
			local tplrLIST = gplr(SlapTarget) or {nil}
			local tplr:Player = tplrLIST[1]
			local tchar:Model = tplr and tplr.Character
			local isInArena = tchar and tchar:FindFirstChild("isInArena")
			if tchar and isInArena and isInArena.Value then
				local hum:Humanoid = tchar:FindFirstChildOfClass("Humanoid")
				local hrp = hum and hum.RootPart
				for i,tplr2 in Players:GetPlayers() do
					local tchar2 = tplr2.Character
					if tchar2 and tplr2 ~= tplr and tplr2 ~= plr and hrp then
						local hum2:Humanoid = tchar2:FindFirstChildOfClass("Humanoid")
						local hrp2 = hum2 and hum2.RootPart
						if not hrp2 then task.wait() continue end
						local dist = (hrp.Position - hrp2.Position).Magnitude
						if dist <= SlapAuraRange then
							local lchar = plr.Character
							if lchar and tchar:GetPivot() then
								lchar:PivotTo(CFrame.new(lchar:GetPivot().Position) * tchar:GetPivot().Rotation)
							end
							slap(tplr2.Name)
						end
					end
				end
			end
		end
	end
end)

local Tab1 = Window:MakeTab({
	Name = "Specific gloves",
	Icon = "rbxassetid://15395916398",
	PremiumOnly = false
})

Tab1:AddButton({
	Name = "Become Invisible [Lobby]",
	Callback = function()
		local char:Model = plr.Character
		local isInArena = char and char:FindFirstChild("isInArena")
		if char and (not isInArena or not isInArena.Value) then
			local OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
			fireclickdetector(workspace.Lobby.Ghost.ClickDetector)
			game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
			fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
		end
	end    
})

local KickSection = Tab1:AddSection({
	Name = "1.5 cooldown | Kick [Grab glove]"
})

local KickTextbox = Tab1:AddTextbox({
	Name = "Player to kick",
	Default = "others",
	TextDisappear = false,
	Callback = function(Value)
		KickTarget = Value
	end	  
})

Tab1:AddButton({
	Name = "Equip Grab [Lobby]",
	Callback = function()
		local char:Model = plr.Character
		local isInArena = char and char:FindFirstChild("isInArena")
		if char and (not isInArena or not isInArena.Value) then
			fireclickdetector(workspace.Lobby["Grab"].ClickDetector)
		end
	end    
})


Tab1:AddButton({
	Name = "Kick Player",
	Callback = function()
		kick(KickTarget)
	end
})
local SlapSection = Tab1:AddSection({
	Name = "0.5 cooldown | Slap from anywhere [SlapStick glove]"
})

Tab1:AddTextbox({
	Name = "Player to slap / Target slap to give slap aura",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		SlapTarget = Value
	end	  
})
Tab1:AddButton({
	Name = "Slap Player",
	Callback = function()
		slap(SlapTarget)
	end    
})

Tab1:AddToggle({
	Name = "Give target Slap aura",
	Default = false,
	Callback = function(Value)
		GiveSlapAuraEnabled = Value
	end    
})

Tab1:AddBind({
	Name = "Slap player Keybind",
	Default = Enum.KeyCode.Q,
	Hold = false,
	Callback = function()
		slap(SlapTarget)
	end    
})

Tab1:AddSlider({
	Name = "Slap aura range",
	Min = 5,
	Max = 150,
	Default = 5,
	Color = Color3.fromRGB(0, 175, 255),
	Increment = 1,
	ValueName = "target's slap aura range",
	Callback = function(Value)
		SlapAuraRange = Value
	end    
})

Tab1:AddButton({
	Name = "Equip SlapStick [Lobby]",
	Callback = function()
		local char:Model = plr.Character
		local isInArena = char and char:FindFirstChild("isInArena")
		if char and not isInArena then
			fireclickdetector(workspace.Lobby["Slapstick"].ClickDetector)
		end
	end    
})


Tab1:AddButton({
	Name = "Destroy GUI",
	Callback = function()
		DISABLE_SCRIPT = true
		OrionLib:Destroy()
	end
})


OrionLib:Init()
