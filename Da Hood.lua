local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("Crystal.wtf",Color3.fromRGB(44, 120, 224), Enum.KeyCode.LeftControl)

local Main = win:Tab("Main")
local Visuals = win:Tab("Visuals")
local Settings = win:Tab("Settings")

--> VARIABLES <--
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local aimbotEnabled = false -- Toggle state

--> FUNCTIONS <--
function notBehindWall(target)
    local ray = Ray.new(plr.Character.Head.Position, (target.Position - plr.Character.Head.Position).Unit * 300)
    local ignoreList = {plr.Character}
    local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, ignoreList)

    if part then
        local humanoid = part.Parent:FindFirstChildOfClass("Humanoid") or part.Parent.Parent:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Parent == target.Parent then
            local _, visible = Camera:WorldToViewportPoint(target.Position)
            return visible
        end
    end
    return false
end

function getPlayerClosestToMouse()
    if not aimbotEnabled then return nil end -- Disable aimbot when toggled off

    local target = nil
    local maxDist = 100

    for _, v in pairs(plrs:GetPlayers()) do
        if v ~= plr and v.TeamColor ~= plr.TeamColor and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos, vis = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude

            if dist < maxDist and vis then
                local headPos = Camera:WorldToViewportPoint(v.Character.Head.Position)
                local headDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(headPos.X, headPos.Y)).Magnitude

                local targetPart = v.Character.HumanoidRootPart
                if headDist < dist then
                    targetPart = v.Character.Head
                end

                if notBehindWall(targetPart) then
                    target = targetPart
                    maxDist = dist
                end
            end
        end
    end
    return target
end

--> Hooking to the remote <--
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(self, ...)
    if not aimbotEnabled then return oldNamecall(self, ...) end -- Disable function when toggled off

    local Args = { ... }
    local method = getnamecallmethod()

    if tostring(self) == "HitPart" and tostring(method) == "FireServer" then
        local closestTarget = getPlayerClosestToMouse()
        if closestTarget then
            Args[1] = closestTarget
            Args[2] = closestTarget.Position
            return self.FireServer(self, unpack(Args))
        end
    end 
    return oldNamecall(self, ...)
end)

--> Toggle UI Integration <--
Toggle("Aimbot", false, function(state)
    aimbotEnabled = state
    print("Aimbot enabled:", state)
end)

Main:Slider("Smoothness",0,100,0, function(t)
print(t)
end)

tab:Dropdown("Dropdown",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(t)
print(t)
end)

tab:Bind("Bind",Enum.KeyCode.RightShift, function()
print("Pressed!")
end)