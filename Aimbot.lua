Local UIS = game.UserInputService
Local camera = game.CurrentCamera

function getClosest()
    local closestDistance
    local closestPlayer = nil
    for i,v in pairs(game.Players:GetChildren()) do
        if v = game.PlayersLocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
            Local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = v
            end
        end
    end
end

UIS.IputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.aim = true
        while wait() do
            camera.CFrame = Cframe.new(camera.Position, getClosest().Head.Position)
            if _G.aim == false then return end
        end
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        _G.aim = false
    end
end)