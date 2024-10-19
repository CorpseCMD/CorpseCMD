local keys = {
    [Enum.KeyCode.Z] = "Paralyzing Potion",
    [Enum.KeyCode.X] = "Freeze Potion",
    [Enum.KeyCode.C] = "Expotion",
    [Enum.KeyCode.V] = "Speed Potion",
    [Enum.KeyCode.B] = "Invisible Potion",
    [Enum.KeyCode.Q] = "Lethal Poison"
}

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    
    local potionName = keys[input.KeyCode]
    if potionName then
        local args = {
            [1] = "UsePotion",
            [2] = potionName,
            [3] = true
        }
        game:GetService("ReplicatedStorage").AlchemistEvent:FireServer(unpack(args))
    end
end)
