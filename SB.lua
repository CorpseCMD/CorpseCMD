--[[ LOADSTRING ]]--

--	loadstring(game:HttpGet('https://github.com/CorpseCMD/CorpseCMD/raw/main/SB.lua'))()

--[[ CODE ]]--

if game:GetService("RunService"):IsStudio() then return end

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

local Tab1 = Window:MakeTab({
	Name = "Misc / Gui settings",
	Icon = "rbxassetid://15395916398",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Gloves",
	Icon = "rbxassetid://15395916398",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Antis",
	Icon = "rbxassetid://15395916398",
	PremiumOnly = false
})

local Tab4 = Window:MakeTab({
	Name = "Audial / Visual",
	Icon = "rbxassetid://15395916398",
	PremiumOnly = false
})

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
local function slapstickSlap(targetName)
	if plr.leaderstats.Glove.Value ~= "Slapstick" then return end
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

local function equip(gloveName)
	local char:Model = plr.Character
	local isInArena = char and char:FindFirstChild("isInArena")
	if char and (not isInArena or not isInArena.Value) then
		fireclickdetector(workspace.Lobby[gloveName].ClickDetector)
	end
end

local kickDebounce = false
local function kick(targetName)
	if plr.leaderstats.Glove.Value ~= "Grab" then return end
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
							slapstickSlap(tplr2.Name)
						end
					end
				end
			end
		end
	end
end)

-- [[ Main ]] --
Tab1:AddButton({
	Name = "Enter Arena",
	Callback = function()
		if plr.Character:FindFirstChild("entered") == nil and plr.Character:FindFirstChild("HumanoidRootPart") then
			firetouchinterest(plr.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
			firetouchinterest(plr.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
		end
		task.wait()
	end 
})

Tab1:AddButton({
	Name = "Run Corpse CMD",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/AvMydMUy"))()
	end 
})


Tab1:AddButton({
	Name = "Rejoin Game",
	Callback = function()	
		local TeleportService = game:GetService("TeleportService")
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		local Success, ErrorMessage = pcall(function()
			local PrivateServerId = game.PrivateServerId
			if #Players:GetPlayers() > 1 then
				if PrivateServerId ~= "" then
					TeleportService:TeleportToPrivateServer(game.PlaceId, PrivateServerId, {LocalPlayer})
				else
					TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
				end
			else
				TeleportService:Teleport(game.PlaceId, LocalPlayer)
			end
		end)

		if ErrorMessage and not Success then
			warn(ErrorMessage)
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

-- [[ Gloves ]] --


-- Alchemist stuff --


local items = {
	"Dire Flower",
	"Mushroom",
	"Red Crystal",
	"Wild Vine",
	"Dark Root",
	"Blue Crystal",
	"Blood Rose",
	"Autumn Sprout",
	"Dire Flower",
	"Fire Flower",
	"Elder Wood",
	"Glowing Mushroom",
	"Jade Stone",
	"Hazel Lily",
	"Plane Flower",
	"Winter Rose"
}

local replicatedStorage = game:GetService("ReplicatedStorage")
local alchemistEvent = replicatedStorage.AlchemistEvent

--MixItem
local function mixItem(item)
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("MixItem", item)
end

--Local
local function LethalAnd()
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("MixItem", "Blood Rose")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("MixItem", "Dark Root")
end

local function Give100IngredientsAlchemist()
	for _, item in ipairs(items) do
		for _ = 1, 100 do
			alchemistEvent:FireServer("AddItem", item)
		end
	end
end


local function HastePotion()
	mixItem("Autumn Sprout")
	mixItem("Jade Stone")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function SpeedPotion()
	mixItem("Mushroom")
	mixItem("Mushroom")
	mixItem("Blue Crystal")
	mixItem("Hazel Lily")
	mixItem("Plane Flower")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function FeatherPotion()
	mixItem("Mushroom")
	mixItem("Hazel Lily")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function PowerPotion()
	mixItem("Dire Flower")
	mixItem("Red Crystal")
	mixItem("Wild Vine")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function InvisPotion()
	mixItem("Hazel Lily")
	mixItem("Hazel Lily")
	mixItem("Blue Crystal")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function InvinciPotion()
	mixItem("Mushroom")
	mixItem("Mushroom")
	mixItem("Elder Wood")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function NoToxinPotion()
	mixItem("Plane Flower")
	mixItem("Plane Flower")
	mixItem("Elder Wood")
	mixItem("Blue Crystal")
	mixItem("Glowing Mushroom")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function CorruptedPotion()
	mixItem("Wild Vine")
	mixItem("Wild Vine")
	mixItem("Wild Vine")
	mixItem("Blood Rose")
	mixItem("Elder Wood")
	mixItem("Dark Root")
	mixItem("Jade Stone")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
	mixItem("Plane Flower")
	mixItem("Plane Flower")
	mixItem("Hazel Lily")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end



local function DrugPotion()
	mixItem("Mushroom")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function ToxicPotion()
	mixItem("Red Crystal")
	mixItem("Dark Root")
	mixItem("Dark Root")
	mixItem("Blood Rose")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function ConfusionPotion()
	mixItem("Blue Crystal")
	mixItem("Red Crystal")
	mixItem("Glowing Mushroom")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function SlowPotion()
	mixItem("Mushroom")
	mixItem("Mushroom")
	mixItem("Blue Crystal")
	mixItem("Blue Crystal")
	mixItem("Jade Stone")
	mixItem("Plane Flower")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function NightmarePotion()
	mixItem("Dark Root")
	mixItem("Dark Root")
	mixItem("Dark Root")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function FreezePotion()
	mixItem("Blue Crystal")
	mixItem("Wild Vine")
	mixItem("Glowing Mushroom")
	mixItem("Winter Rose")
	mixItem("Winter Rose")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function ParalyzingPotion()
	mixItem("Plane Flower")
	mixItem("Plane Flower")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function ExplosionPotion()
	mixItem("Fire Flower")
	mixItem("Fire Flower")
	mixItem("Red Crystal")
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function LethalPotion()
	for i = 1, 10 do
		LethalAnd()
	end
	game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
end

local function givePotions()
	PowerPotion()
	ParalyzingPotion()
	DrugPotion()
	SlowPotion()
	HastePotion()
	InvisPotion()
	SpeedPotion()
	ToxicPotion()
	FreezePotion()
	LethalPotion()
	FeatherPotion()
	InvinciPotion()
	NoToxinPotion()
	ConfusionPotion()
	CorruptedPotion()
	ExplosionPotion()
	NightmarePotion()
end

-- Other stuff --

Tab2:AddButton({
	Name = "Become Invisible [Lobby]",
	Callback = function()
		local char:Model = plr.Character
		local isInArena = char and char:FindFirstChild("isInArena")
		if char and (not isInArena or not isInArena.Value) then
			local OGlove = plr.leaderstats.Glove.Value
			equip("Ghost")
			game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
			equip(OGlove)
		end
	end    
})

local KickSection = Tab2:AddSection({
	Name = "1.5 cooldown | Kick [Grab glove]"
})

KickSection:AddTextbox({
	Name = "Player to kick",
	Default = "others",
	TextDisappear = false,
	Callback = function(Value)
		KickTarget = Value
	end	  
})

KickSection:AddButton({
	Name = "Equip Grab [Lobby]",
	Callback = function()
		equip("Grab")
	end    
})


KickSection:AddButton({
	Name = "Kick Player",
	Callback = function()
		kick(KickTarget)
	end
})
local SlapSection = Tab2:AddSection({
	Name = "0.5 cooldown | Slap from anywhere [SlapStick glove]"
})

SlapSection:AddTextbox({
	Name = "Player to slap / Target slap to give slap aura",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		SlapTarget = Value
	end	  
})
SlapSection:AddButton({
	Name = "Slap Player",
	Callback = function()
		slapstickSlap(SlapTarget)
	end    
})

SlapSection:AddToggle({
	Name = "Give target Slap aura",
	Default = false,
	Callback = function(Value)
		GiveSlapAuraEnabled = Value
	end    
})

SlapSection:AddBind({
	Name = "Slap player Keybind",
	Default = Enum.KeyCode.Q,
	Hold = false,
	Callback = function()
		slapstickSlap(SlapTarget)
	end    
})

SlapSection:AddSlider({
	Name = "Slap aura range",
	Min = 10,
	Max = 300,
	Default = 15,
	Color = Color3.fromRGB(255, 255, 0),
	Increment = 1,
	ValueName = "target's slap aura range",
	Callback = function(Value)
		SlapAuraRange = Value
	end    
})

SlapSection:AddButton({
	Name = "Equip SlapStick [Lobby]",
	Callback = function()
		equip("Slapstick")
	end    
})

local AlchemistSection = Tab2:AddSection({
	Name = "Alchemist Section"
})

AlchemistSection:AddButton({
	Name = "Equip Alchemist [Lobby]",
	Callback = function()
		equip("Alchemist")
	end    
})
AlchemistSection:AddButton({
	Name = "Give 100 of all Ingredients",
	Callback = function()
		Give100IngredientsAlchemist()
	end    
})

AlchemistSection:AddButton({
	Name = "Give all potions [small lag]",
	Callback = function()
		givePotions()
	end    
})
task.wait()
AlchemistSection:AddButton({
	Name = "Give all potions X10 [LAG]",
	Callback = function()
		for i=1,10 do
			givePotions()
			task.wait(0.1)
		end
	end    
})
task.wait()
AlchemistSection:AddButton({
	Name = "Give all potions X50 [MEGA LAG]",
	Callback = function()
		for i=1,50 do
			givePotions()
			task.wait(0.1)
		end
	end    
})
--[[ ANTIS - Credits to Hub That Exists ]]--


if game.Workspace:FindFirstChild("ToggleAllAntisCORPSECMD_SB") == nil then
	local ToggleAllAntisCORPSECMD_SB = Instance.new("BoolValue", workspace)
	ToggleAllAntisCORPSECMD_SB.Name = "ToggleAllAntisCORPSECMD_SB"
end
Tab3:AddToggle({
	Name = "Toggle All Antis",
	Default = false,
	Callback = function(Value)
		game.Workspace.ToggleAllAntisCORPSECMD_SB.Value = Value
	end
})

AA = Tab3:AddToggle({
	Name = "Anti Admins (Notifies you of admins)",
	Default = false,
	Callback = function(Value)
		local AntiAdmins = Value
		while AntiAdmins do
			for i,v in pairs(Players:GetPlayers()) do
				if v:GetRankInGroup(9950771) >= 2 then
					OrionLib:MakeNotification({
						Name = "High rank player detected!",
						Content = "Player " .. v.Name .. " Has a higher rank in the Slap battles Group",
						Image = "rbxassetid://14895383047",
						Time = 6
					})
				end
			end
			task.wait()
		end
	end
})

AK = Tab3:AddToggle({
	Name = "Anti Kick",
	Default = false,
	Callback = function(Value)
		local AntiKick = Value
		while AntiKick do
			for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
				if v.Name == "ErrorPrompt" then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
				end
			end
			task.wait()
		end
	end
})

APL = Tab3:AddToggle({
	Name = "Anti Portal",
	Default = false,
	Callback = function(Value)
		local AntiPortal = Value
		if AntiPortal == true then
			--workspace.Lobby.Teleport2.CanTouch = false
			workspace.Lobby.Teleport3.CanTouch = false
			workspace.Lobby.Teleport4.CanTouch = false
			workspace.Lobby.Teleport6.CanTouch = false
		else
			--workspace.Lobby.Teleport2.CanTouch = true
			workspace.Lobby.Teleport3.CanTouch = true
			workspace.Lobby.Teleport4.CanTouch = true
			workspace.Lobby.Teleport6.CanTouch = true
		end
	end
})

AR2 = Tab3:AddToggle({
	Name = "Anti Ragdoll V2",
	Default = false,
	Callback = function(Value)
		local AntiRagdoll = Value
		if AntiRagdoll then
			local function antiRagdollFunction()
				plr.Character:WaitForChild("Ragdolled").Changed:Connect(function()
					if plr.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
						local ogCF = plr.Character:GetPivot()
						repeat task.wait() plr.Character.Torso.Anchored = true plr.Character:PivotTo(ogCF)
						until plr.Character:WaitForChild("Ragdolled").Value == false
						plr.Character.Torso.Anchored = false
					end
				end)
			end
			plr.CharacterAdded:Connect(antiRagdollFunction)
			if plr.Character then
				antiRagdollFunction()
			end
		end
	end    
})
if workspace:FindFirstChild("TAntiVoid") == nil then
	local TournamentAntiVoid = Instance.new("Part", workspace)
	TournamentAntiVoid.Name = "TAntiVoid"
	TournamentAntiVoid.Size = Vector3.new(2048, 15, 2048)
	TournamentAntiVoid.Position = Vector3.new(3420, 70, 3)
	TournamentAntiVoid.CanCollide = false
	TournamentAntiVoid.Transparency = 1
	TournamentAntiVoid.Anchored = true
end

game.Workspace.dedBarrier.Position =  Vector3.new(15, -17, 41.5)
AV = Tab3:AddToggle({
	Name = "Anti Void (Works in tournament)",
	Default = false,
	Callback = function(Value)
		game.Workspace.dedBarrier.CanCollide = Value
		game.Workspace.TAntiVoid.CanCollide = Value
	end    
})

ADB = Tab3:AddToggle({
	Name = "Anti Death Barriers",
	Default = false,
	Callback = function(Value)
		if Value == true then
			for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
				if v.ClassName == "Part" and v.Name == "BLOCK" then
					v.CanTouch = false
				end
			end
			workspace.DEATHBARRIER.CanTouch = false
			workspace.DEATHBARRIER2.CanTouch = false
			workspace.dedBarrier.CanTouch = false
			workspace.ArenaBarrier.CanTouch = false
			workspace.AntiDefaultArena.CanTouch = false
		else
			for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
				if v.ClassName == "Part" and v.Name == "BLOCK" then
					v.CanTouch = true
				end
			end
			workspace.DEATHBARRIER.CanTouch = true
			workspace.DEATHBARRIER2.CanTouch = true
			workspace.dedBarrier.CanTouch = true
			workspace.ArenaBarrier.CanTouch = true
			workspace.AntiDefaultArena.CanTouch = true
		end
	end    
})

AB = Tab3:AddToggle({
	Name = "Anti Brazil",
	Default = false,
	Callback = function(Value)
		if Value == true then
			for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
				v.CanTouch = false
			end
		else
			for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
				v.CanTouch = true
			end
		end
	end    
})

ACOD = Tab3:AddToggle({
	Name = "Anti Cube of Death",
	Default = false,
	Callback = function(Value)
		if Value == true then
			workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
		else
			workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
		end
	end    
})

AT = Tab3:AddToggle({
	Name = "Anti Timestop",
	Default = false,
	Callback = function(Value)
		local AntiTimestop = Value
		while AntiTimestop do
			for i,v in pairs(plr.Character:GetChildren()) do
				if v.ClassName == "Part" then
					v.Anchored = false
				end
			end
			task.wait()
		end
	end    
})

AS = Tab3:AddToggle({
	Name = "Anti Squid",
	Default = false,
	Callback = function(Value)
		local AntiSquid = Value
		if AntiSquid == false then
			plr.PlayerGui.SquidInk.Enabled = true
		end
		while AntiSquid do
			if plr.PlayerGui:FindFirstChild("SquidInk") then
				plr.PlayerGui.SquidInk.Enabled = false
			end
			task.wait()
		end
	end    
})

AHJ = Tab3:AddToggle({
	Name = "Anti Hallow Jack",
	Default = false,
	Callback = function(Value)
		plr.PlayerScripts.HallowJackAbilities.Disabled = Value
	end    
})

AC = Tab3:AddToggle({
	Name = "Anti Conveyor",
	Default = false,
	Callback = function(Value)
		plr.PlayerScripts.ConveyorVictimized.Disabled = Value
	end    
})

ABK = Tab3:AddToggle({
	Name = "Anti Brick",
	Default = false,
	Callback = function(Value)
		local AntiBrick = Value
		while AntiBrick do
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "Union" then
					v.CanTouch = false
				end
			end
			task.wait()
		end
	end    
})

AN = Tab3:AddToggle({
	Name = "Anti Null",
	Default = false,
	Callback = function(Value)
		local AntiNull = Value
		while AntiNull do
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "Imp" and v:FindFirstChild("Body") then
					shared.gloveHits[plr.leaderstats.Glove.Value]:FireServer(v.Body,true)
				end
			end
			task.wait()
		end
	end    
})

ARD = Tab3:AddToggle({
	Name = "Anti [REDACTED]",
	Default = false,
	Callback = function(Value)
		plr.PlayerScripts.Well.Disabled = Value
	end    
})

AZ = Tab3:AddToggle({
	Name = "Anti Za Hando",
	Default = false,
	Callback = function(Value)
		local AntiZaHando = Value
		while AntiZaHando do
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.ClassName == "Part" and v.Name == "Part" then
					v:Destroy()
				end
			end
			task.wait()
		end
	end    
})

ARR = Tab3:AddToggle({
	Name = "Anti Reaper",
	Default = false,
	Callback = function(Value)
		local AntiReaper = Value
		while AntiReaper do
			for i,v in pairs(plr.Character:GetDescendants()) do
				if v.Name == "DeathMark" then
					game:GetService("ReplicatedStorage").ReaperGone:FireServer(v)
					game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy() 
				end
			end
			task.wait(0.15)
		end
	end    
})

AP = Tab3:AddToggle({
	Name = "Anti Pusher",
	Default = false,
	Callback = function(Value)
		local AntiPusher = Value
		while AntiPusher do
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "wall" then
					v.CanCollide = false
				end
			end
			task.wait()
		end
	end    
})

ABR = Tab3:AddToggle({
	Name = "Anti Booster",
	Default = false,
	Callback = function(Value)
		local AntiBooster = Value
		while AntiBooster do
			for i,v in pairs(plr.Character:GetDescendants()) do
				if v.Name == "BoosterObject" then
					v:Destroy()
				end
			end
			task.wait()
		end
	end    
})

AM = Tab3:AddToggle({
	Name = "Anti Mail",
	Default = false,
	Callback = function(Value)
		plr.Character.YouHaveGotMail.Disabled = Value
		local AntiMail = Value
		while AntiMail do
			if plr.Character and plr.Character:FindFirstChild("YouHaveGotMail") then
				plr.Character.YouHaveGotMail.Disabled = true
			end
			task.wait()
		end
	end    
})

ASN = Tab3:AddToggle({
	Name = "Anti Stun",
	Default = false,
	Callback = function(Value)
		local AntiStun = Value
		while AntiStun do
			if plr.Character:FindFirstChild("Humanoid") ~= nil and game.Workspace:FindFirstChild("Shockwave") and plr.Character.Ragdolled.Value == false then
				plr.Character.Humanoid.PlatformStand = false
			end
			task.wait()
		end
	end    
})

AMC = Tab3:AddToggle({
	Name = "Anti Megarock/Custom",
	Default = false,
	Callback = function(Value)
		local AntiRock = Value
		while AntiRock do
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v.Name == "rock" then
					v.CanTouch = false
					v.CanQuery = false
				end
			end
			task.wait()
		end
	end    
})

AREC = Tab3:AddToggle({
	Name = "Anti Record (Detects chat msgs)",
	Default = false,
	Callback = function(Value)
		AntiRecord = Value
	end
})
for i,p in pairs(Players:GetChildren()) do
	if p ~= plr then
		p.Chatted:Connect(function(message)
			local Words = message:split(" ")
			if AntiRecord == true then
				for i, v in pairs(Words) do
					if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
						AK:Set(false)
						plr:Kick("Possible player recording detected.".." ("..p.Name..")".." ("..message..")")
					end
				end
			end
		end)
	end
end
Players.PlayerAdded:Connect(function(Player)
	Player.Chatted:Connect(function(message)
		local Words = message:split(" ")
		if AntiRecord == true then
			for i, v in pairs(Words) do
				if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
					AK:Set(false)
					plr:Kick("Possible player recording detected.".." ("..Player.Name..")".." ("..message..")")
				end
			end
		end
	end)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	AA:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.05)
	AK:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.1)
	APL:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.15)
	AR2:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.2)
	AV:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.25)
	ADB:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.3)
	AB:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.35)
	ACOD:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.4)
	AT:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.45)
	AS:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.5)
	AHJ:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.55)
	AC:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.6)
	ABK:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.65)
	AN:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.7)
	ARD:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.75)
	AZ:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.8)
	ARR:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.85)
	AP:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.9)
	ABR:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(.95)
	AM:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(1)
	ASN:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(1.05)
	AMC:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

game.Workspace.ToggleAllAntisCORPSECMD_SB.Changed:Connect(function()
	wait(1.1)
	AREC:Set(game.Workspace.ToggleAllAntisCORPSECMD_SB.Value)
end)

--[[ Audial / Visual ]]--

Tab4:AddToggle({
	Name = "[LOUD, use Golem glove] Golem Ability Spam",
	Default = false,
	Callback = function(Value)
		local loop = Value
		while loop and plr.leaderstats.Glove.Value == "Golem" do
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer("release")
			task.wait()
		end
	end    
})

Tab4:AddToggle({
	Name = "[Grab glove] Grab sound spam + size changing glove",
	Default = false,
	Callback = function(Value)
		local loop = Value
		while loop and plr.leaderstats.Glove.Value == "Grab" do
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer("grow")
			task.wait()
		end
	end    
})

Tab4:AddToggle({
	Name = "[Bonk Glove] Bonk spam (only effect is spammed, cooldown applies to functional part)",
	Default = false,
	Callback = function(Value)
		local loop = Value
		while loop and plr.leaderstats.Glove.Value == "Grab" do
			task.wait()
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
		end
	end    
})


OrionLib:Init()
