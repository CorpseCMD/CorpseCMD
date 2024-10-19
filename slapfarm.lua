-- [[ LOADSTRING ]] --

-- loadstring(game:HttpGet("https://raw.githubusercontent.com/CorpseCMD/CorpseCMD/refs/heads/main/slapfarm.lua"))()

repeat wait() until game:IsLoaded()
local Players = game:GetService("Players")
local lplr = Players.LocalPlayer

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end
 
function Teleport()
   while wait() do
       pcall(function()
           TPReturner()
           if foundAnything ~= "" then
               TPReturner()
           end
       end)
   end
end

task.spawn(function()
task.wait(10)
Teleport()
end)

local lchar = lplr.Character or lplr.CharacterAdded:Wait()
local TARGET = nil
pcall(function() 
	queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/CorpseCMD/CorpseCMD/refs/heads/main/slapfarm.lua"))()')
end)
pcall(function() 
	syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/CorpseCMD/CorpseCMD/refs/heads/main/slapfarm.lua"))()')
end)
repeat wait() until lplr:WaitForChild("leaderstats").Glove.Value == "Boxer"
for i, v in game.Players:GetChildren() do
   if v ~= lplr and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and (not v.Character:FindFirstChild("isInArena") or v.Character:FindFirstChild("isInArena").Value == false) then
     TARGET = v
     break
   end
end
if TARGET == nil then
   for i, v in game.Players:GetChildren() do
      if v ~= lplr and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
        TARGET = v
        break
      end
   end
end
if TARGET ~= nil then
   local args = {[1] = TARGET,[2] = true}
   task.wait(0.3)
   lchar:PivotTo(TARGET.Character:GetPivot() + TARGET.Character:GetPivot().LookVector * 1.5)
   task.wait(0.3)
		lchar:PivotTo(TARGET.Character:GetPivot() + TARGET.Character:GetPivot().LookVector * 1.5)
		for i=1,400 do
			game:GetService("ReplicatedStorage").Events.Boxing:FireServer(unpack(args))
		end
lchar:PivotTo(TARGET.Character:GetPivot() + TARGET.Character:GetPivot().LookVector * 1.5)
   task.wait(1.2)
	lchar:PivotTo(TARGET.Character:GetPivot() + TARGET.Character:GetPivot().LookVector * 1.5)
end

Teleport()
