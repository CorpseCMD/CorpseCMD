local SpecialMessage = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Message = Instance.new("TextBox")
local Target = Instance.new("TextBox")
local Send = Instance.new("TextButton")
local AntiChatLogger = Instance.new("TextButton")
local ChatView = Instance.new("TextLabel")

SpecialMessage.Name = "SpecialMessage"
SpecialMessage.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SpecialMessage.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = SpecialMessage
Frame.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.191, 0, 0.268999994, 0)
Frame.Size = UDim2.new(0.190474585, 0, 0.461417913, 0)

Message.Name = "Message"
Message.Parent = Frame
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderSizePixel = 0
Message.Position = UDim2.new(0.120999828, 0, 0.267996937, 0)
Message.Size = UDim2.new(0.757000029, 0, 0.218999997, 0)
Message.Font = Enum.Font.SourceSans
Message.PlaceholderText = "Message"
Message.Text = ""
Message.TextColor3 = Color3.fromRGB(0, 0, 0)
Message.TextScaled = true
Message.TextSize = 14.000
Message.TextWrapped = true

Target.Name = "Target"
Target.Parent = Frame
Target.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Target.BorderColor3 = Color3.fromRGB(0, 0, 0)
Target.BorderSizePixel = 0
Target.Position = UDim2.new(0.120999932, 0, 0.51438123, 0)
Target.Size = UDim2.new(0.757000029, 0, 0.218999997, 0)
Target.Font = Enum.Font.SourceSans
Target.PlaceholderText = "Target User (leave blank for no private chat)"
Target.Text = ""
Target.TextColor3 = Color3.fromRGB(0, 0, 0)
Target.TextScaled = true
Target.TextSize = 14.000
Target.TextWrapped = true

Send.Name = "Send"
Send.Parent = Frame
Send.BackgroundColor3 = Color3.fromRGB(136, 255, 0)
Send.BorderColor3 = Color3.fromRGB(0, 0, 0)
Send.BorderSizePixel = 0
Send.Position = UDim2.new(0.0491999984, 0, 0.788999975, 0)
Send.Size = UDim2.new(0.363000005, 0, 0.140000001, 0)
Send.Font = Enum.Font.SourceSans
Send.Text = "Send Message"
Send.TextColor3 = Color3.fromRGB(0, 0, 0)
Send.TextScaled = true
Send.TextSize = 14.000
Send.TextWrapped = true

AntiChatLogger.Name = "AntiChatLogger"
AntiChatLogger.Parent = Frame
AntiChatLogger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AntiChatLogger.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiChatLogger.BorderSizePixel = 0
AntiChatLogger.Position = UDim2.new(0.552172124, 0, 0.788999915, 0)
AntiChatLogger.Size = UDim2.new(0.363000005, 0, 0.140000001, 0)
AntiChatLogger.Font = Enum.Font.SourceSans
AntiChatLogger.Text = "Load AntiChatLogger"
AntiChatLogger.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiChatLogger.TextScaled = true
AntiChatLogger.TextSize = 14.000
AntiChatLogger.TextWrapped = true

ChatView.Name = "ChatView"
ChatView.Parent = Frame
ChatView.BackgroundTransparency = 1.000
ChatView.ClipsDescendants = true
ChatView.Position = UDim2.new(0, 8, 0, 8)
ChatView.Size = UDim2.new(0.925999999, 0, 0.200000003, 0)
ChatView.Font = Enum.Font.SourceSansBold
ChatView.Text = ""
ChatView.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatView.TextSize = 18.000
ChatView.TextStrokeTransparency = 0.750
ChatView.TextWrapped = true

local function plrchat(message,privateChatTarget)
	if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message,privateChatTarget or "All")
	end
end
local specialLetters = {
	["a"] = "а",
	["b"] = "b",
	["c"] = "с",
	["d"] = "d",
	["e"] = "е",
	["f"] = "f",
	["g"] = "g",
	["h"] = "һ",
	["i"] = "і",
	["j"] = "j",
	["k"] = "k",
	["l"] = "ӏ", 
	["m"] = "m",
	["n"] = "n",
	["o"] = "ο",
	["p"] = "р",
	["q"] = "q", 
	["r"] = "r",
	["s"] = "ѕ",
	["t"] = "t",
	["u"] = "υ",
	["v"] = "ν",
	["w"] = "w",
	["x"] = "х",
	["y"] = "у",
	["z"] = "z",
	["A"] = "Α",
	["B"] = "Β",
	["C"] = "С",
	["D"] = "D",
	["E"] = "Ε",
	["F"] = "F",
	["G"] = "G",
	["H"] = "Η",
	["I"] = "І",
	["J"] = "J",
	["K"] = "Κ",
	["L"] = "L", 
	["M"] = "M",
	["N"] = "N",
	["O"] = "О",
	["P"] = "Р",
	["Q"] = "Q",
	["R"] = "R",
	["S"] = "Ѕ",
	["T"] = "T",
	["U"] = "U",
	["V"] = "V",
	["W"] = "W",
	["X"] = "Х",
	["Y"] = "Y",
	["Z"] = "Z",
	["!"] = "ǃ",
	["$"] = "＄",
	["1"] = "１",
	["2"] = "２",
	["3"] = "３",
	["4"] = "４",
	["5"] = "５",
	["6"] = "６",
	["7"] = "７",
	["8"] = "৪",
	["9"] = "９",
	["0"] = "０",
}

Frame.Message:GetPropertyChangedSignal("Text"):Connect(function()
	local targetMessage = Frame.Message.Text
	local MessageToSend = string.sub(targetMessage,1,1)
	for i = 2, #targetMessage do
		MessageToSend..= specialLetters[string.sub(targetMessage,i,i)] or string.sub(targetMessage,i,i)
	end
	Frame.ChatView.Text = MessageToSend
end)

if not game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
	Frame.Target.Visible = false
end

Frame.Send.MouseButton1Click:Connect(function()
	local targetMessage = Frame.Message.Text
	local targetPlr = #Frame.Target.Text > 3 and Frame.Target.Text or "All"
	local MessageToSend = string.sub(targetMessage,1,1)
	for i = 2, #targetMessage do
		MessageToSend..= specialLetters[string.sub(targetMessage,i,i)] or string.sub(targetMessage,i,i)
	end
	plrchat(MessageToSend,targetPlr or "All")
end)

Frame.AntiChatLogger.MouseButton1Click:Wait()
Frame.AntiChatLogger:Destroy()
local httpService = game:GetService("HttpService")
local scriptUrl = "https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua"
loadstring(httpService:GetAsync(scriptUrl))()
