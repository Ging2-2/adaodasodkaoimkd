local groupId = 35553992 -- Replace with your group ID
local player = game:GetService("Players").LocalPlayer

if not player:IsInGroup(groupId) then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Access Denied",
        Text = "You must be in the Panadora group to use this script!",
        Duration = 5
    })
    return -- Stop execution if not in the group
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Pandora "  .. "v1.0.0",
    SubTitle = "By Dynamic",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "flame" }),
    Physhics = Window:AddTab({ Title = "Physhics", Icon = "hand" }),
    KeyBinds = Window:AddTab({ Title = "KeyBinds", Icon = "keyboard" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "Notification",
    Content = "Join the Discord server for updates and support at https://discord.gg/NkStU8CRKr.",
    Duration = 5
})

local Toggle = Tabs.Main:AddToggle("Low Arc", {Title = "Low Arc", Default = false})
local Toggle = Tabs.Main:AddToggle("High Arc", {Title = "High Arc", Default = false})
local Toggle = Tabs.Main:AddToggle("Shot Indicator", {Title = "Shot Indicator", Default = false})
local Toggle = Tabs.Main:AddToggle("Auto Guard", {Title = "Auto Guard", Default = false})
local Toggle = Tabs.Main:AddToggle("Auto Power", {Title = "Auto Power", Default = false})

Toggle:OnChanged(function()
    print("Toggle changed:", Toggle.Value)
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space and Toggle.Value then
        print("Shooting the ball...")
    end
end)

local Slider = Tabs.Physhics:AddSlider("Slider", {
    Title = "Ball Magnet",
    Default = 2.0,
    Min = 0.0,
    Max = 15,
    Rounding = 1
})

Slider:SetValue(3)

local Slider = Tabs.Physhics:AddSlider("Slider", {
    Title = "Ball Reach",
    Default = 2.0,
    Min = 0.0,
    Max = 30,
    Rounding = 1
})

Slider:SetValue(3)

local Keybind = Tabs.KeyBinds:AddKeybind("Ball Reach", {
    Title = "Ball Reach",
    Mode = "Tap",
    Default = "X",
    ChangedCallback = function(New)
        print("Keybind changed:", New)
    end
})

local Keybind = Tabs.KeyBinds:AddKeybind("Ball Magnet", {
    Title = "Ball Magnet",
    Mode = "Tap",
    Default = "B",
    ChangedCallback = function(New)
        print("Keybind changed:", New)
    end
})

local Keybind = Tabs.KeyBinds:AddKeybind("Auto Guard", {
    Title = "Auto Guard",
    Mode = "Tap",
    Default = "C",
    ChangedCallback = function(New)
        print("Keybind changed:", New)
    end
})

local Keybind = Tabs.KeyBinds:AddKeybind("Auto Power", {
    Title = "Auto Power",
    Mode = "Tap",
    Default = "V",
    ChangedCallback = function(New)
        print("Keybind changed:", New)
    end
})

SaveManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
SaveManager:SetFolder("FluentScriptHub/specific-game")
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Pandora",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()