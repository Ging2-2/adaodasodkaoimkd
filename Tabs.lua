local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Pandora "  .. "v1.0.0",
    SubTitle = "By Dynamic",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Physhics = Window:AddTab({ Title = "Physhics", Icon = "" }),
    KeyBinds = Window:AddTab({ Title = "KeyBinds", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Join the discord server for updates and support at https://discord.gg/vBGaUY3fCy.",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })


    local Toggle = Tabs.Main:AddToggle("Low Arc", {Title = "Low Arc", Default = false})
    local Toggle = Tabs.Main:AddToggle("High Arc", {Title = "High Arc", Default = false})
    local Toggle = Tabs.Main:AddToggle("Shot Indicator", {Title = "Shot Indicator", Default = false})
    local Toggle = Tabs.Main:AddToggle("Auto Guard", {Title = "Auto Guard", Default = false})

    Toggle:OnChanged(function()
        print("Toggle changed:", Toggle.Value)
    end)
    
    -- Add event listener for space bar key press
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space and Toggle.Value then
            -- Code to shoot the ball goes here
            print("Shooting the ball...")
            -- Replace the print statement with your actual ball shooting code
        end
    end)


    
    local Slider = Tabs.Physhics:AddSlider("Slider", {
        Title = "Ball Magnet",
        Description = "",
        Default = 2.0,
        Min = 0.0,
        Max = 15,
        Rounding = 1
    })

    Slider:SetValue(3)


    local Slider = Tabs.Physhics:AddSlider("Slider", {
        Title = "Ball Reach",
        Description = "",
        Default = 2.0,
        Min = 0.0,
        Max = 30,
        Rounding = 1
    })

    Slider:SetValue(3)


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
SaveManager:SetFolder("FluentScriptHub/specific-game")

SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Pandora",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end