local SpecialMessage = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Message = Instance.new("TextBox")
local UIStroke = Instance.new("UIStroke")
local Target = Instance.new("TextBox")
local UIStroke_2 = Instance.new("UIStroke")
local Send = Instance.new("TextButton")
local AntiChatLogger = Instance.new("TextButton")

SpecialMessage.Name = "SpecialMessage"
SpecialMessage.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SpecialMessage.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = SpecialMessage
Frame.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.191, 0, 0.269, 0)
Frame.Size = UDim2.new(0.162, 0, 0.370, 0)

Message.Name = "Message"
Message.Parent = Frame
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderSizePixel = 0
Message.Position = UDim2.new(0.121, 0, 0.175, 0)
Message.Size = UDim2.new(0.757, 0, 0.219, 0)
Message.Font = Enum.Font.SourceSans
Message.PlaceholderText = "Message"
Message.Text = ""
Message.TextColor3 = Color3.fromRGB(0, 0, 0)
Message.TextScaled = true
Message.TextSize = 14.000
Message.TextWrapped = true

UIStroke.Thickness = 2
UIStroke.Parent = Message

Target.Name = "Target"
Target.Parent = Frame
Target.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Target.BorderColor3 = Color3.fromRGB(0, 0, 0)
Target.BorderSizePixel = 0
Target.Position = UDim2.new(0.121, 0, 0.469, 0)
Target.Size = UDim2.new(0.757, 0, 0.219, 0)
Target.Font = Enum.Font.SourceSans
Target.PlaceholderText = "Target User (leave blank for no private chat)"
Target.Text = ""
Target.TextColor3 = Color3.fromRGB(0, 0, 0)
Target.TextScaled = true
Target.TextSize = 14.000
Target.TextWrapped = true

UIStroke_2.Thickness = 2
UIStroke_2.Parent = Target

Send.Name = "Send"
Send.Parent = Frame
Send.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Send.BorderColor3 = Color3.fromRGB(0, 0, 0)
Send.BorderSizePixel = 0
Send.Position = UDim2.new(0.0492, 0, 0.789, 0)
Send.Size = UDim2.new(0.363, 0, 0.140, 0)
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
AntiChatLogger.Position = UDim2.new(0.560, 0, 0.789, 0)
AntiChatLogger.Size = UDim2.new(0.363, 0, 0.140, 0)
AntiChatLogger.Font = Enum.Font.SourceSans
AntiChatLogger.Text = "Enable Anti-ChatLogger"
AntiChatLogger.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiChatLogger.TextScaled = true
AntiChatLogger.TextSize = 14.000
AntiChatLogger.TextWrapped = true

-- Scripts:

local function LIAI_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local specialLetters = {
		["a"] = "а",
		["b"] = "b",
		["c"] = "с",
		["d"] = "d",
		["e"] = "е",
		["f"] = "f",
		["g"] = "g",
		["h"] = "h",
		["i"] = "і",
		["j"] = "j",
		["k"] = "k",
		["l"] = "l",
		["m"] = "m",
		["n"] = "n",
		["o"] = "о",
		["p"] = "р",
		["q"] = "q",
		["r"] = "r",
		["s"] = "ѕ",
		["t"] = "t",
		["u"] = "u",
		["v"] = "v",
		["w"] = "w",
		["x"] = "х",
		["y"] = "у",
		["z"] = "z",
		["A"] = "А",
		["B"] = "B",
		["C"] = "С",
		["D"] = "D",
		["E"] = "Е",
		["F"] = "F",
		["G"] = "G",
		["H"] = "H",
		["I"] = "І",
		["J"] = "J",
		["K"] = "K",
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
	}
	
	
	
	script.Parent.Send.MouseButton1Click:Connect(function()
		local targetMessage = script.Parent.Message.Text
		local targetPlr = #script.Parent.Target.Text > 3 and script.Parent.Target.Text or "All"
		local MessageToSend = string.sub(targetMessage,1,1)
		for i = 2, #targetMessage do
			MessageToSend..= specialLetters[string.sub(targetMessage,i,i)] or string.sub(targetMessage,i,i)
		end
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(MessageToSend,targetPlr)
	end)
	
	script.Parent.AntiChatLogger.MouseButton1Click:Wait()
	script.Parent.AntiChatLogger:Destroy()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()
end
coroutine.wrap(LIAI_fake_script)()
