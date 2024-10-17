repeat wait() until game:IsLoaded()
if time() < 6 then task.wait(3) end
local Players = game:GetService("Players")
local lplr = Players.LocalPlayer
local TARGET = nil
fireclickdetector(workspace.Lobby["Boxer"].ClickDetector)
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
   lplr.Character:PivotTo(TARGET.Character:GetPivot())
   task.wait(0.3)
   lplr.Character:PivotTo(TARGET.Character:GetPivot())
   for i=1,290 do
   game:GetService("ReplicatedStorage").Events.Boxing:FireServer(unpack(args))
   end
   task.wait(1.25)
end
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
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
Teleport()
