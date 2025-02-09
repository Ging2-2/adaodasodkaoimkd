local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local Window = MacLib:Window({
	Title = "Crystal Hub",
	Subtitle = "Crystal Hub is a univeral ",
	Size = UDim2.fromOffset(750, 600),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.LeftControl,
	AcrylicBlur = true,
})

local globalSettings = {
	UIBlurToggle = Window:GlobalSetting({
		Name = "UI Blur",
		Default = Window:GetAcrylicBlurState(),
		Callback = function(bool)
			Window:SetAcrylicBlurState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
				Lifetime = 5
			})
		end,
	}),
	NotificationToggler = Window:GlobalSetting({
		Name = "Notifications",
		Default = Window:GetNotificationsState(),
		Callback = function(bool)
			Window:SetNotificationsState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " Notifications",
				Lifetime = 5
			})
		end,
	}),
	ShowUserInfo = Window:GlobalSetting({
		Name = "Show User Info",
		Default = Window:GetUserInfoState(),
		Callback = function(bool)
			Window:SetUserInfoState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Showing" or "Redacted") .. " User Info",
				Lifetime = 5
			})
		end,
	})
}

local tabGroups = {
	TabGroup1 = Window:TabGroup()
}

local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Main", Image = "" }),
    Keybinds = tabGroups.TabGroup1:Tab({ Name = "Keybinds", Image = "" }),
	Settings = tabGroups.TabGroup1:Tab({ Name = "Settings", Image = "rbxassetid://10734950309" })
}

local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Both" }),
}

sections.MainSection1:Slider({
	Name = "Ball Magnet",
	Default = 0,
	Minimum = 0,
	Maximum = 30,
	DisplayMethod = "Number",
	Precision = 0,
	Callback = function(Value)
		print("Changed to ".. Value)
	end
}, "Slider")

sections.MainSection1:Toggle({
	Name = "High Arc",
	Default = false,
	Callback = function(value)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = (value and "Enabled " or "Disabled ") .. "Toggle"
		})
	end,
}, "Toggle")

sections.MainSection1:Toggle({
	Name = "Low Arc",
	Default = false,
	Callback = function(value)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = (value and "Enabled " or "Disabled ") .. "Toggle"
		})
	end,
}, "Toggle")

sections.MainSection1:Keybind({
	Name = "High Arc",
	Blacklist = false,
	Callback = function(binded)
		Window:Notify({
			Title = "High Arc",
			Description = "Pressed keybind - "..tostring(binded.Name),
			Lifetime = 3
		})
	end,
	onBinded = function(bind)
		Window:Notify({
			Title = "High Arc",
			Description = "Successfully Binded Keybind to - "..tostring(bind.Name),
			Lifetime = 3
		})
	end,
}, "Keybind")

MacLib:SetFolder("Maclib")
tabs.Settings:InsertConfigSection("Left")

Window.onUnloaded(function()
	print("Unloaded!")
end)

tabs.Main:Select()
MacLib:LoadAutoLoadConfig()