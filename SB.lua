--[[ LOADSTRING ]]--

--	loadstring(game:HttpGet('https://github.com/CorpseCMD/CorpseCMD/raw/main/SB.lua'))()

--[[ CODE ]]--

local DISABLE_SCRIPT = false
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

if game:GetService("ReplicatedStorage"):FindFirstChild("AlchemistEvent") and game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit") then
	local Window = OrionLib:MakeWindow({Name = "CorpseCMD | SB", HidePremium = false, SaveConfig = false, ConfigFolder = "CorpseCMD_SB", CloseCallback = function()
		task.spawn(function()
			task.wait(0.05)
			DISABLE_SCRIPT = true
			OrionLib:Destroy()
		end)
	end,})
	OrionLib:MakeNotification({
		Name = "Corpse CMD | SB",
		Content = "Loaded SB GUI | Updated for Bind glove",
		Image = "rbxassetid://4483345998",
		Time = 5
	})

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
			-720.534058, 314.735168, 0.705005825, 0.178254008, -0.547166348, 0.817822993, 3.79947096e-08, 0.831134021, 0.556072116, -0.98398453, -0.0991220549, 0.148152992	)
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
			-720.534058, 314.735168, 0.705005825, 0.178254008, -0.547166348, 0.817822993, 3.79947096e-08, 0.831134021, 0.556072116, -0.98398453, -0.0991220549, 0.148152992	)
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
					local success, err = pcall(function()
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
					end)
					if not success then
						warn(err)
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
	local function HastePotion()
		mixItem("Autumn Sprout")
		mixItem("Jade Stone")
		game:GetService("ReplicatedStorage").AlchemistEvent:FireServer("BrewPotion")
	end

	local function LostPotion()
		mixItem("Elder Wood")
		mixItem("Elder Wood")
		mixItem("Elder Wood")
		mixItem("Blue Crystal")
		mixItem("Red Crystal")
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
		LostPotion()
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
	local EdgelordSection = Tab2:AddSection({
		Name = "Edgelord section xd"
	})
	SlapSection:AddButton({
		Name = "LOBBY | Turn into edgelord (effects are not FE)",
		Callback = function()
			if plr.leaderstats.Glove.Value == "Edgelord" then return end
			equip("Slapstick")
			local lplr = game.Players.LocalPlayer
			local char:Model = lplr.Character or lplr.CharacterAdded:Wait()
			task.wait(0.4)
			local hum = char:FindFirstChildOfClass("Humanoid")
			local hrp = hum.RootPart
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local Events = ReplicatedStorage:WaitForChild("Events")
			local BoxingEvent = Events:WaitForChild("Boxing")

			local hum = lplr.Character:FindFirstChildOfClass("Humanoid")
			if not hum then return end
			
			local SlapDebounce = false
			local function slapstickSlap(target)
				if lplr.leaderstats.Glove.Value ~= "Slapstick" then return end
				if SlapDebounce then 
					while SlapDebounce do
						task.wait(math.random(10,15)/700)
					end
				end
				local char = lplr.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				local hrp = hum and hum.RootPart
				
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
			
			local function boxingslap(target)
				local args = {
					[1] = target,
					[2] = true
				}
				ReplicatedStorage:FindFirstChild("BoxingEvent"):FireServer(unpack(args))
			end
			
			local Glitcheffect = Instance.new("ParticleEmitter")
			Glitcheffect.Name = "Glitcheffect"
			Glitcheffect.Lifetime = NumberRange.new(0.10, 0.10)
			Glitcheffect.Color = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.new(0.09, 0.16, 0.08)), ColorSequenceKeypoint.new(1.00, Color3.new(0.08, 0.20, 0.58))})
			Glitcheffect.LightEmission = 0.800000011920929
			Glitcheffect.SpreadAngle = Vector2.new(1.00, 1.00)
			Glitcheffect.Speed = NumberRange.new(0.00, 0.00)
			Glitcheffect.Texture = "rbxassetid://3876444567"
			Glitcheffect.Rate = 86
			Glitcheffect.Parent = hrp
			
			local ShadowEmitter = Instance.new("ParticleEmitter")
			ShadowEmitter.Name = "ShadowEmitter"
			ShadowEmitter.Lifetime = NumberRange.new(1.00, 1.00)
			ShadowEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0.00, Color3.new(0.00, 0.00, 0.00)), ColorSequenceKeypoint.new(1.00, Color3.new(0.16, 0.16, 0.16))})
			ShadowEmitter.Speed = NumberRange.new(0.00, 0.00)
			ShadowEmitter.Texture = "rbxasset://textures/particles/fire_main.dds"
			ShadowEmitter.Acceleration = Vector3.new(0.00, 1.00, 0.00)
			ShadowEmitter.RotSpeed = NumberRange.new(5.00, 25.00)
			ShadowEmitter.Rotation = NumberRange.new(0.00, 5.00)
			ShadowEmitter.Rate = 45
			ShadowEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0.00, 0.50, 0.00), NumberSequenceKeypoint.new(1.00, 0.50, 0.00)})
			ShadowEmitter.Parent = hrp
			
			local hl = Instance.new('Highlight')
			hl.FillColor = Color3.new(0,0,0)
			hl.OutlineColor = Color3.new(1,1,1)
			hl.FillTransparency = 0
			hl.OutlineTransparency = 0
			hl.DepthMode = Enum.HighlightDepthMode.Occluded
			hl.Parent = char
			
			for i=1, 5 do
				for i, v in char:GetChildren() do
					if v:IsA("BasePart") then
						ShadowEmitter:Clone().Parent = v
						Glitcheffect:Clone().Parent = v
					end
				end
			end
			
			local idleAnim = Instance.new("Animation")
			idleAnim.AnimationId = "rbxassetid://16163355836"
			idleAnim.Parent = ReplicatedStorage
			idleAnim.Name = "EdgelordIdle"
			
			local walkAnim = Instance.new("Animation")
			walkAnim.AnimationId = "rbxassetid://16163350920"
			walkAnim.Parent = ReplicatedStorage
			walkAnim.Name = "EdgelordWalk"
			
			local animator = hum:FindFirstChildOfClass("Animator")
			
			local idle = animator:LoadAnimation(idleAnim)
			
			local walk = animator:LoadAnimation(walkAnim)
			
			local forceAnim = animator:LoadAnimation(ReplicatedStorage:WaitForChild('TheForceAnim') or walkAnim)
			local musicc = Instance.new("Sound")
			musicc.SoundId = "rbxassetid://9133844756"
			musicc.Parent = game.SoundService
			musicc.Looped = true
			musicc:Play()
			
			
			local ogGlove = lplr.leaderstats.Glove.Value
			char:PivotTo(CFrame.new(-13.537845611572266, 1.564839482307434, 0.1399119794368744))
			local conn = nil
			conn = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
				if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
					forceAnim:Play(0.1,1.2,1)
					for _, v in pairs(game.Players:GetPlayers()) do
						if v ~= game.Players.LocalPlayer and v.Character~=nil and v.Character:FindFirstChild("Head") and not v.Character:FindFirstChild("Head"):FindFirstChild("UnoReverseCard") then
			
							local target_hrp = v.Character.HumanoidRootPart -- Target HumanoidRootPart
			
							local hrpToTarget = (target_hrp.Position - hrp.Position).Unit
			
							local hrpLookVector = hrp.CFrame.LookVector
			
							local dotProduct = hrpLookVector:Dot(hrpToTarget)
			
							
							if (target_hrp.Position - hrp.Position).Magnitude <= 60 then
								
								if ogGlove == "slapstick" then slapstickSlap(v) else boxingslap(v) end
								task.wait(0.52)
							end
						end
					end
				end
			end)
			
			lplr.leaderstats.Glove.Value = "Edgelord"
			
			local tool = Instance.new("Tool")
			tool.Name = "Tp Tool"
			tool.RequiresHandle = false
			tool.CanBeDropped = false
			tool.Parent = lplr.Backpack
			tool.Activated:Connect(function()
				local mouse = lplr:GetMouse()
				if mouse.Hit then
					char:PivotTo(mouse.Hit + Vector3.new(0,2,0))
				end
			end)
			local walking, prevWalking = false, false
			hum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
				walking = hum.MoveDirection.Magnitude > 0.1
				if walking ~= prevWalking then
					if not walking then
						walk:Stop()
						idle:Play(0.1,1.1,1)
					else
						idle:Stop(0.1)
						walk:Play(0.1,1.1,1)
					end
				end
				prevWalking = walking
			end)
			-- Speed + wait until dead loop
			while char and hum and hrp and hum.Health > 0 do
				task.wait(0.015)
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not hum then return end
				if hum and hum.MoveDirection.Magnitude > 0.2 then
					char:TranslateBy(hum.MoveDirection * 4)
				end
			end
			lplr.leaderstats.Glove.Value = ogGlove
			equip(ogGlove)
			if conn then
				conn:Disconnect()
			end
			musicc:Destroy()
		end    
	})
	
	local LagSection = Tab2:AddSection({
		Name = "LAG / CRASH Section (boxer lag lags other people way more than you)"
	})
			
	LagSection:AddButton({
		Name = "LVL 1 - Boxer Lag | (no requirements :D)",
		Callback = function()
			local level = 0.3
			game.Players.LocalPlayer.Character.ChildAdded:Connect(function() for i, b in game.Players.LocalPlayer.Character:GetChildren() do
			    if b.Name == "BoxingGlove" then
			        b:Destroy()
			    end
			end end)
			for i=1,level * 20 do
			    for i=1,30 do
			        game:GetService("ReplicatedStorage").Events.Boxing:FireServer("equip")
			
			    end
			    task.wait()
			end
		end,
	})
	LagSection:AddButton({
		Name = "LVL 2 - Boxer Lag | (no requirements :D)",
		Callback = function()
			local level = 0.6
			game.Players.LocalPlayer.Character.ChildAdded:Connect(function() for i, b in game.Players.LocalPlayer.Character:GetChildren() do
			    if b.Name == "BoxingGlove" then
			        b:Destroy()
			    end
			end end)
			for i=1,level * 20 do
			    for i=1,30 do
			        game:GetService("ReplicatedStorage").Events.Boxing:FireServer("equip")
			
			    end
			    task.wait()
			end
		end,
	})
	LagSection:AddButton({
		Name = "LVL 3 - Boxer Lag | (no requirements :D)",
		Callback = function()
			local level = 1.25
			game.Players.LocalPlayer.Character.ChildAdded:Connect(function() for i, b in game.Players.LocalPlayer.Character:GetChildren() do
			    if b.Name == "BoxingGlove" then
			        b:Destroy()
			    end
			end end)
			for i=1,level * 20 do
			    for i=1,30 do
			        game:GetService("ReplicatedStorage").Events.Boxing:FireServer("equip")
			
			    end
			    task.wait()
			end
		end,
	})
	LagSection:AddButton({
		Name = "LVL 4 - Boxer Lag | DISCONNECTS PEOPLE (no requirements :D)",
		Callback = function()
			local level = 2.75
			game.Players.LocalPlayer.Character.ChildAdded:Connect(function() for i, b in game.Players.LocalPlayer.Character:GetChildren() do
			    if b.Name == "BoxingGlove" then
			        b:Destroy()
			    end
			end end)
			for i=1,level * 20 do
			    for i=1,30 do
			        game:GetService("ReplicatedStorage").Events.Boxing:FireServer("equip")
			
			    end
			    task.wait()
			end
		end,
	})
	LagSection:AddButton({
		Name = "LVL 5 - Boxer Lag | CRASH SERVER (no requirements :D)",
		Callback = function()
			local level = 4.5
			game.Players.LocalPlayer.Character.ChildAdded:Connect(function() for i, b in game.Players.LocalPlayer.Character:GetChildren() do
			    if b.Name == "BoxingGlove" then
			        b:Destroy()
			    end
			end end)
			for i=1,level * 20 do
			    for i=1,30 do
			        game:GetService("ReplicatedStorage").Events.Boxing:FireServer("equip")
			
			    end
			    task.wait()
			end
		end,
	})
	local AlchemistSection = Tab2:AddSection({
		Name = "Alchemist Section [Needs alchemist glove]"
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
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

			Give100IngredientsAlchemist()
		end    
	})

	AlchemistSection:AddButton({
		Name = "Give all potions [small lag]",
		Callback = function()
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

			givePotions()
		end    
	})
	task.wait()
	AlchemistSection:AddButton({
		Name = "Give all potions X10 [LAG]",
		Callback = function()
			game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

			for i=1,10 do
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
	
	
	
	
	
elseif game.PlaceId == 18550498098 or game:GetService("Workspace"):FindFirstChild("PotatoLord") then








local Window = OrionLib:MakeWindow({Name = "CorpseCMD | SB Guide bossfight!", HidePremium = false, SaveConfig = false, ConfigFolder = "CorpseCMD_SB", CloseCallback = function()
		task.spawn(function()
			task.wait(1.5)
			DISABLE_SCRIPT = true
			OrionLib:Destroy()
		end)
	end,})
	local Players = game:GetService("Players")
	local plr = Players.LocalPlayer
	task.wait()
	local Tab1 = Window:MakeTab({
		Name = "Misc / Gui settings",
		Icon = "rbxassetid://15395916398",
		PremiumOnly = false
	})
	local Tab2 = Window:MakeTab({
		Name = "Progression",
		Icon = "rbxassetid://18402077412",
		PremiumOnly = false
	})
	
	local Tab3 = Window:MakeTab({
		Name = "Guide Bossfight",
		Icon = "rbxassetid://18584222941",
		PremiumOnly = false
	})
	
	local Tab4 = Window:MakeTab({
		Name = "Funnies",
		Icon = "rbxassetid://18215499099",
		PremiumOnly = false
	})

	local Section21 = Tab2:AddSection({
		Name = "Teleports"
	})
	local Section22 = Tab2:AddSection({
		Name = "Antis"
	})
	local Section23 = Tab2:AddSection({
		Name = "Auto completes / skips"
	})


	local Section31 = Tab3:AddSection({
		Name = "Guide's Attacks [Phase 1]"
	})
	
	local Section32 = Tab3:AddSection({
		Name = "Guide Himself [Phase 2]"
	})
	
	
	local Section41 = Tab4:AddSection({
		Name = "Potatolord42 funnies"
	})

	
	
	local function getChar()
		if plr.Character then
			return plr.Character
		else
			return plr.CharacterAdded:Wait()
		end
	end
	
	local function getLantern(equip)
		local char = getChar()
		local hum = char:FindFirstChildOfClass("Humanoid")
		local lantern:Tool = plr.Backpack:FindFirstChild("Lantern")
		if not lantern then
			lantern = char:FindFirstChild("Lantern")
			if not lantern then warn("Lantern not found!") return end
		end
		if lantern.Parent:IsA('Backpack') and equip then
			hum:EquipTool(lantern)
		end
		return lantern
	end

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
	
	Section21:AddButton({
		Name = "Activate / teleprot to end of chase in starting room.",
		Callback = function()
			local g1l = game.Workspace:WaitForChild("Gate1Lever")
			local cd = g1l:FindFirstChildOfClass("ClickDetector")
			if cd then
				fireclickdetector(cd)
				task.wait(0.1)
				getChar():PivotTo(CFrame.new(570, 7, 302))
			end
		end
	})
	
	Section21:AddButton({
		Name = "Teleport to Sbeve parkour room.",
		Callback = function()
			getChar():PivotTo(CFrame.new(684, 0, 716))
			local screengui = Instance.new('ScreenGui')
			screengui.Parent = game.CoreGui
			local p = Instance.new("ImageLabel")
			p.Parent = screengui
			p.Size = UDim2.new(1,0,1,0)
			p.BackgroundTransparency = 1
			p.ImageTransparency = 0.9
			p.Image = "rbxassetid://17382692880"
			task.wait(0.5)
			screengui:Destroy()
		end
	})
	Section22:AddButton({
		Name = "Anti sbeve parkour fall",
		Callback = function()
			local sbeveAntiFallPart = Instance.new("Part")
			sbeveAntiFallPart.Parent = workspace
			sbeveAntiFallPart.Size = Vector3.new(139,26,143)
			sbeveAntiFallPart.Position = Vector3.new(768.4,-19.24,711.541)
			sbeveAntiFallPart.Anchored = true
			sbeveAntiFallPart.Transparency = 0.75
			sbeveAntiFallPart.Color = Color3.new(0.54, 0, 0.72)
		end
	})
	
	-- game:GetService("Workspace")["pls organize"].Flamethrowers

	Section21:AddButton({
		Name = "Teleport to Flame Throwers area",
		Callback = function()
			getChar():PivotTo(CFrame.new(1052, -34, 716))
		end,
	})	
	Section21:AddButton({
		Name = "Teleport to Train area [Easiest]",
		Callback = function()
			getChar():PivotTo(CFrame.new(910, -2, 853))
		end,
	})	
	Section21:AddButton({
		Name = "Teleport to Laser area",
		Callback = function()
			getChar():PivotTo(CFrame.new(1069, -28, 572))
		end,
	})
	
	Section21:AddButton({
		Name = "Teleport to potatolord42 area",
		Callback = function()
			getChar():PivotTo(CFrame.new(1823, -29, 891))
		end,
	})
	
	Section22:AddButton({
		Name = "Defeat potatolord42",
		Callback = function()
			local potatolord:Model = game:GetService("Workspace"):FindFirstChild("PotatoLord")
			local char = getChar()
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if char and potatolord and hum and hum.Health > 0 then
				local args = {
					[1] = "Hit",
					[2] = workspace.PotatoLord:FindFirstChild("Right Arm")
				}
				local lantern:Tool = getLantern(true)
				lantern:Activate()
				task.wait(0.2)
				lantern.Network:FireServer(unpack(args))
			end
		end,
	})
	
	Section21:AddButton({
		Name = "Teleport to AFTER potato lord arena",
		Callback = function()
			getChar():PivotTo(CFrame.new(2045, -29, 893))
		end,
	})
	
	Section21:AddButton({
		Name = "Teleport to end of maze",
		Callback = function()
			getChar():PivotTo(CFrame.new(2772, -28, 821))
		end,
	})
	
	Section23:AddButton({
		Name = "Unlock Regen [if it's not loaded, it will TP you there and then back]",
		Callback = function()
			if game.Workspace:FindFirstChild("the cube of life") then
				firetouchinterest(getChar().PrimaryPart,game:GetService("Workspace")["the cube of life"],0)
				task.wait(0.1)
				firetouchinterest(getChar().PrimaryPart,game:GetService("Workspace")["the cube of life"],1)
				
			else
				local ogP = getChar():GetPivot()
				task.wait(0.05)
				getChar():PivotTo(CFrame.new(3286.2, -70, 822.5))
				task.wait(1.25)
				getChar():PivotTo(ogP)
			end
			
		end,
	})
	
	Section23:AddButton({
		Name = "Unlock Extra Heart [if it's not loaded, it will TP you there and then back]",
		Callback = function()
			if game.Workspace:FindFirstChild("Big Heart") then
				firetouchinterest(getChar().PrimaryPart,game:GetService("Workspace")["Big Heart"],0)
				task.wait(0.1)
				firetouchinterest(getChar().PrimaryPart,game:GetService("Workspace")["Big Heart"],1)
			else
				local ogP = getChar():GetPivot()
				task.wait(0.05)
				getChar():PivotTo(CFrame.new(3270.81, -214, 823.89))
				task.wait(1.25)
				getChar():PivotTo(ogP)
			end
		end,
	})

	Section23:AddButton({
		Name = "Start bossfight [skip everything lol] (everyone else might die unless they are in the house)",
		Callback = function()
			local cd:Instance = game.Workspace:FindFirstChild("ShackLever") and game.Workspace.ShackLever:FindFirstChildOfClass("ClickDetector")
			if cd then getChar():PivotTo(CFrame.new(3275, -73, 822)) fireclickdetector(cd) end
		end,
	})
	
	
	
	
	-- [[ Section 2 ]] --
	
	local potatoHat = false
	Section41:AddButton({
		Name = "potatolord42 hat TOGGLE",
		Callback = function()
			local char = getChar()
			if not char then return end
			local ogPivot = char:GetPivot()
			char:PivotTo(CFrame.new(1823, -29, 891))
			task.wait(0.25)
			local potatolord:Model = game:GetService("Workspace"):FindFirstChild("PotatoLord")
			
			local hum = char:FindFirstChildOfClass("Humanoid")
			if potatolord and hum and hum.Health > 0 then
				potatoHat = not potatoHat
				if potatoHat then
					char:PivotTo(potatolord:GetPivot() + potatolord:GetPivot().LookVector * -1)
					local lantern = getLantern(true)
					task.wait(0.5)
					local weld = Instance.new("WeldConstraint")
					weld.Parent = potatolord.PrimaryPart
					weld.Part0 = char.PrimaryPart
					weld.Part1 = potatolord.PrimaryPart
					task.wait(0.1)
					potatolord:FindFirstChildOfClass("Humanoid").PlatformStand = true
					potatolord:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
					for i, p in potatolord:GetChildren() do
						potatolord:PivotTo(CFrame.new(char.PrimaryPart.Position + Vector3.new(0,2,0),char.PrimaryPart.Position + Vector3.new(0,1000,0)))
						if p:IsA("BasePart") then
							p.CanCollide = false
							p:GetPropertyChangedSignal("CanCollide"):Connect(function()
								if p.CanCollide then
									p.CanCollide = false
								end
							end)
						end
					end
					char:PivotTo(ogPivot)
					while potatoHat do
						task.wait(0.025)
						potatolord.PrimaryPart.AssemblyAngularVelocity = potatolord.PrimaryPart.AssemblyAngularVelocity:Lerp(Vector3.new(0,40,0),0.4)
						if plr:DistanceFromCharacter(potatolord.PrimaryPart.Position) > 6 then
							potatolord:PivotTo(CFrame.new(char.PrimaryPart.Position + Vector3.new(0,2,0),char.PrimaryPart.Position + Vector3.new(0,1000,0)))
						end
					end
					potatolord:FindFirstChildOfClass("Humanoid").PlatformStand = false
					potatolord:FindFirstChildOfClass("Humanoid").WalkSpeed = 10
					weld:Destroy()
					
				end
				
			end
		end,
	})
	
	
	-- [[ Section 3 ]] --
	local SF = Instance.new("Part", workspace)
	SF.Size = Vector3.new(50,1,50)
	SF.Transparency = 0.75
	SF.Color = Color3.new(0.5,0.5,1)
	SF.Anchored = true
	SF.CanCollide = true
	SF.Position = Vector3.new(595, 145, -330)
	SF.Name = "SafezoneBossfight_259"
	Section31:AddButton({
		Name = "teleport to bossfight safe zone",
		Callback = function()
			getChar():PivotTo(CFrame.new(595, 150, -330))
		end,
	})
	
	local Autoslap = false
	local function autoslapfunction(c)
		if not Autoslap then return end
		local lantern:Tool = getLantern(true)
		task.wait(0.05)
		lantern:Activate()
		task.wait(0.05)
		if c and c.Name == "TrackGloveMissile" then
			local args = {
				[1] = "Hit",
				[2] = c
			}
			if lantern:FindFirstChild("Network") then
				lantern.Network:FireServer(unpack(args))
			else
				warn("Network Remote not found!!!!")
			end
		elseif c and c.Name == "ReplicaNPC" then
			local args = {
				[1] = "Hit",
				[2] = c:FindFirstChild("HumanoidRootPart")
			}
			if lantern:FindFirstChild("Network") then
				lantern.Network:FireServer(unpack(args))
			else
				warn("Network Remote not found!!!!")
			end
		elseif c and c.Name == "golem" then
			task.spawn(function()
				while c and c:FindFirstChild("Hitbox") do
					task.wait(0)
					local args = {
						[1] = "Hit",
						[2] = c:FindFirstChild("Hitbox")
					}

					if lantern:FindFirstChild("Network") then
						lantern.Network:FireServer(unpack(args))
					else
						warn("Network Remote not found!!!!")
					end
				end
			end)
		elseif c and c.Name == "Guide" then
			local args = {
				[1] = "Hit",
				[2] = c:FindFirstChild("HumanoidRootPart")
			}
			task.spawn(function()
				while c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 do
					task.wait(0)
					for i=1,20 do
						if lantern:FindFirstChild("Network") then
							lantern.Network:FireServer(unpack(args))
						else
							warn("Network Remote not found!!!!")
						end
					end
				end
			end)
		else
			return "notfound"
		end
	end
	game.Workspace.ChildAdded:Connect(autoslapfunction)
	task.spawn(function()
		while true do
			task.wait(0.3)
			for i, b in game.Workspace:GetChildren() do
				local success = autoslapfunction(b)
				if success ~= "notfound" then
					task.wait(0.01)
				end
			end
		end
	end)
	Section31:AddToggle({
		Name = "Toggle Auto slap Guide / Track / Golem / Replicas",
		Default = false,
		Callback = function(Value)
			Autoslap = Value
		end    
	})
	
	
	
	
end

OrionLib:Init()

--[[



if game.CoreGui:FindFirstChild("shrekmanfartcopyposition") then game.CoreGui:FindFirstChild("shrekmanfartcopyposition"):Destroy() end
task.wait(0.05)
local gui = Instance.new("ScreenGui")
gui.Name = "shrekmanfartcopyposition"
gui.Parent = game.CoreGui
local button = Instance.new("TextButton")
button.Parent = gui
button.Size = UDim2.new(0.1,0,0.1,0)
button.Position = UDim2.new(0.2,0,0.45,0)
button.MouseButton1Click:Connect(function()
	setclipboard(tostring(game.Players.LocalPlayer.Character:GetPivot()))
end)



]]
