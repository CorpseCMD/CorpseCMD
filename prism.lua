-- Checking permissions
local requiredFunctions = {["readfile"] = readfile,["writefile"] = writefile,["isfile"] = isfile,["delfile"] = delfile,["setclipboard"] = setclipboard}
local requiredFunctionNames = {"readfile","writefile","isfile","delfile","setclipboard"}
local functionsNotFound = {}
for i=1,#requiredFunctionNames do
	local funct = requiredFunctions[requiredFunctionNames[i]]
	if not funct then
		table.insert(functionsNotFound,requiredFunctionNames[i])
	end
end
if #functionsNotFound>0 then
	warn("[ERROR] - The following required functions are missing: " .. table.concat(functionsNotFound,", "))
	return
end

local keysystemCode = [====[
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
	end
end
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
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
			Fluent:Destroy()
			KEYVALIDATED = true
			EndKeySystem = true
		end
	end
})
local Getkey = Tabs.KeySys:AddButton({
	Title = "Get Key",
	Description = "Get Key here",
	Callback = function()
		setclipboard(kgLib.getLink())
		Fluent:Notify({
		        Title = "Link Copied",
		        Content = "Copied to clipboard",
		        SubContent = "Paste the link in your browser to continue!", -- Optional
		        Duration = 8 -- Set to nil to make the notification not disappear
		})
	end
})
Window:SelectTab(1)
repeat wait(0.1) until EndKeySystem
return KEYVALIDATED
]====]
local _,keySuccess = loadstring(keysystemCode)()
for i=1,5 do
print("Key success: "..keySuccess)
end
