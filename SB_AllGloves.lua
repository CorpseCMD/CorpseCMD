loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/SlapBattles"))()
local test = game:GetService("CoreGui"):WaitForChild("ToraScript"):WaitForChild("ImageButton"):WaitForChild("Frame")
for i,c in test:GetChildren() do
  if c:IsA("TextLabel") and string.match(c.Text,"Tora") then
    c.Text = "         SB is fun | @CorpseCMD "
  end
end
