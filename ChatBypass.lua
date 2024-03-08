
local SpecialMessage = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Message = Instance.new("TextBox")
local Target = Instance.new("TextBox")
local Send = Instance.new("TextButton")
local AntiChatLogger = Instance.new("TextButton")
local ChatView = Instance.new("TextLabel")
local WordsList = Instance.new("TextButton")
local List = Instance.new("ScrollingFrame")
local Word = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")
local UIListLayout = Instance.new("UIListLayout")
local Word_2 = Instance.new("TextButton")
local UIStroke_2 = Instance.new("UIStroke")
local Word_3 = Instance.new("TextButton")
local UIStroke_3 = Instance.new("UIStroke")
local Word_4 = Instance.new("TextButton")
local UIStroke_4 = Instance.new("UIStroke")
local Word_5 = Instance.new("TextButton")
local UIStroke_5 = Instance.new("UIStroke")
local Word_6 = Instance.new("TextButton")
local UIStroke_6 = Instance.new("UIStroke")
local Word_7 = Instance.new("TextButton")
local UIStroke_7 = Instance.new("UIStroke")
local Word_8 = Instance.new("TextButton")
local UIStroke_8 = Instance.new("UIStroke")

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
Message.ClearTextOnFocus = false
Message.Font = Enum.Font.SourceSans
Message.MultiLine = true
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
AntiChatLogger.Position = UDim2.new(0.772852004, 0, 0.788999915, 0)
AntiChatLogger.Size = UDim2.new(0.188591763, 0, 0.140000001, 0)
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

WordsList.Name = "WordsList"
WordsList.Parent = Frame
WordsList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WordsList.BorderColor3 = Color3.fromRGB(0, 0, 0)
WordsList.BorderSizePixel = 0
WordsList.Position = UDim2.new(0.448950976, 0, 0.788999915, 0)
WordsList.Size = UDim2.new(0.284694284, 0, 0.140000001, 0)
WordsList.Font = Enum.Font.SourceSans
WordsList.Text = "Words List"
WordsList.TextColor3 = Color3.fromRGB(0, 0, 0)
WordsList.TextScaled = true
WordsList.TextSize = 14.000
WordsList.TextWrapped = true

List.Name = "List"
List.Parent = Frame
List.Active = true
List.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
List.BorderColor3 = Color3.fromRGB(0, 0, 0)
List.BorderSizePixel = 0
List.Position = UDim2.new(1.05000877, 0, 0, 0)
List.Size = UDim2.new(0, 169, 0, 247)
List.Visible = false
List.CanvasSize = UDim2.new(0, 0, 3, 0)
List.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)

Word.Name = "Word"
Word.Parent = List
Word.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word.BorderSizePixel = 0
Word.Size = UDim2.new(1, 0, 0, 50)
Word.Font = Enum.Font.SourceSans
Word.Text = "аѕѕһоlе"
Word.TextColor3 = Color3.fromRGB(0, 0, 0)
Word.TextScaled = true
Word.TextSize = 14.000
Word.TextWrapped = true

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = Word

UIListLayout.Parent = List
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

Word_2.Name = "Word"
Word_2.Parent = List
Word_2.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_2.BorderSizePixel = 0
Word_2.Size = UDim2.new(1, 0, 0, 50)
Word_2.Font = Enum.Font.SourceSans
Word_2.Text = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k"
Word_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_2.TextScaled = true
Word_2.TextSize = 14.000
Word_2.TextWrapped = true

UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Parent = Word_2

Word_3.Name = "Word"
Word_3.Parent = List
Word_3.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_3.BorderSizePixel = 0
Word_3.Size = UDim2.new(1, 0, 0, 50)
Word_3.Font = Enum.Font.SourceSans
Word_3.Text = "с⁥⁥⁥u⁥⁥⁥m"
Word_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_3.TextScaled = true
Word_3.TextSize = 14.000
Word_3.TextWrapped = true

UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_3.Parent = Word_3

Word_4.Name = "Word"
Word_4.Parent = List
Word_4.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_4.BorderSizePixel = 0
Word_4.Size = UDim2.new(1, 0, 0, 50)
Word_4.Font = Enum.Font.SourceSans
Word_4.Text = "ѕ⁥⁥⁥е⁥⁥⁥х"
Word_4.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_4.TextScaled = true
Word_4.TextSize = 14.000
Word_4.TextWrapped = true

UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_4.Parent = Word_4

Word_5.Name = "Word"
Word_5.Parent = List
Word_5.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_5.BorderSizePixel = 0
Word_5.Size = UDim2.new(1, 0, 0, 50)
Word_5.Font = Enum.Font.SourceSans
Word_5.Text = "һ⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥"
Word_5.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_5.TextScaled = true
Word_5.TextSize = 14.000
Word_5.TextWrapped = true

UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_5.Parent = Word_5

Word_6.Name = "Word"
Word_6.Parent = List
Word_6.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_6.BorderSizePixel = 0
Word_6.Size = UDim2.new(1, 0, 0, 50)
Word_6.Font = Enum.Font.SourceSans
Word_6.Text = "⁥⁥⁥р⁥⁥⁥е⁥⁥⁥n⁥⁥⁥i⁥⁥⁥ѕ"
Word_6.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_6.TextScaled = true
Word_6.TextSize = 14.000
Word_6.TextWrapped = true

UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_6.Parent = Word_6

Word_7.Name = "Word"
Word_7.Parent = List
Word_7.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_7.BorderSizePixel = 0
Word_7.Size = UDim2.new(1, 0, 0, 50)
Word_7.Font = Enum.Font.SourceSans
Word_7.Text = "ѕ⁥⁥⁥m⁥⁥⁥а⁥⁥⁥ӏ⁥⁥⁥ӏ ⁥⁥⁥р⁥⁥⁥е⁥⁥⁥n⁥⁥⁥i⁥⁥⁥ѕ"
Word_7.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_7.TextScaled = true
Word_7.TextSize = 14.000
Word_7.TextWrapped = true

UIStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_7.Parent = Word_7

Word_8.Name = "Word"
Word_8.Parent = List
Word_8.BackgroundColor3 = Color3.fromRGB(115, 115, 115)
Word_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
Word_8.BorderSizePixel = 0
Word_8.Size = UDim2.new(1, 0, 0, 50)
Word_8.Font = Enum.Font.SourceSans
Word_8.Text = "������ a������������ ������ s������ ѕ"
Word_8.TextColor3 = Color3.fromRGB(0, 0, 0)
Word_8.TextScaled = true
Word_8.TextSize = 14.000
Word_8.TextWrapped = true

UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_8.Parent = Word_8


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
	["e"] = "⁥⁥⁥е",
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


for i, button in Frame.List:GetChildren() do
	if button:IsA("TextButton") then
		button.MouseButton1Click:Connect(function()
			Frame.Message.Text..=button.Text
		end)
	end
end
Frame.WordsList.MouseButton1Click:Connect(function()
	Frame.List.Visible = not Frame.List.Visible
end)

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
