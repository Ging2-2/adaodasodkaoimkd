local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("Crystal Hub",Color3.new(0.886275, 0.603922, 1.000000), Enum.KeyCode.LeftControl)

local Main = win:Tab("Main")
local Keybinds = win:Tab("Keybinds")

Main:Toggle("High Arc",false, function(t: any): ()
print(t)
end)

Main:Slider("Speed Boost", 0, 2, 1, function(t)
    -- Apply the speed boost multiplier
    local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
    
    if humanoid then
        humanoid.WalkSpeed = 16 * t  -- Assuming 16 is the base WalkSpeed, apply the boost
    end
end)

Keybinds:Bind("High Arc",Enum.KeyCode.X, function(): ()
print("Pressed!")
end)