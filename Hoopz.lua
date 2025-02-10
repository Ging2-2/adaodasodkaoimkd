local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("Crystal.wtf",Color3.new(0.886275, 0.603922, 1.000000), Enum.KeyCode.LeftControl)

local Main = win:Tab("Main")
local Keybinds = win:Tab("Keybinds")

Main:Toggle("High Arc",false, function(t: any): ()
print(t)
end)

Main:Toggle("Mobile Aimbot",false, function(t: any): ()
print(t)
end)

Main:Slider("Speed Boost", 0, 2, 1, function(t)
    -- Apply the speed boost multiplier
    local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid")
    
    if humanoid then
        humanoid.WalkSpeed = 16 * t  -- Assuming 16 is the base WalkSpeed, apply the boost
    end
end)

local ac = {"Speeding", "Spinning Detect", "Jumping", "HipHeight", "Long Arms", "JumpPower"}

local old; old = hookmetamethod(game, "__namecall", function(self, ...)
   local args = {...}
   
   if getnamecallmethod() == "FireServer" and self.Name == "sbEvent" then
       if ac[args[1]] then
           return
       end
   end
   return old(self, ...)
end)

local mt = getrawmetatable(game)
make_writeable(mt)

local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "FireServer" and tostring(self) == "sbEvent" then -- Anti Cheat
        
        -- Hoopz AntiCheat Args
        if args[1] == "Speeding" or args[1] == "Spinning Detect" or args[1] == "Jumping" or args[1] == "HipHeight" or args[1] == "Long Arms" or args[1] == "JumpPower" then
            return;
        else
            return namecall(self, table.unpack(args));
        end
    end
    return namecall(self, table.unpack(args))
end)


script.Disabled = true;
task.wait();
script:Destroy();
getfenv().script = nil;
local l__LocalPlayer__1 = game:GetService("Players").LocalPlayer;
local v2 = l__LocalPlayer__1.Character or l__LocalPlayer__1.CharacterAdded:Wait();
local l__ReplicatedStorage__3 = game:GetService("ReplicatedStorage");
local l__Humanoid__1 = v2:WaitForChild("Humanoid");
local l__sbEvent__2 = l__ReplicatedStorage__3:WaitForChild("sbEvent");
local l__HumanoidRootPart__3 = v2:WaitForChild("HumanoidRootPart");
v2.ChildAdded:Connect(function()
	if l__HumanoidRootPart__3:FindFirstChildOfClass("BodyGyro") then
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Spinning Detect");
		end)();
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		while true do
		
		end;
	end;
	if not l__HumanoidRootPart__3:FindFirstChildOfClass("BodyAngularVelocity") then
		return;
	end;
	coroutine.wrap(function()
		l__sbEvent__2:FireServer("Spinning Detect");
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.Health = math.random(-100, -1);
	end)();
	while true do
	
	end;
end);
local v4 = l__Humanoid__1:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
	if not (l__Humanoid__1.WalkSpeed > 16) then
		return;
	end;
	coroutine.wrap(function()
		l__sbEvent__2:FireServer("Speeding", l__Humanoid__1.WalkSpeed);
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.Health = math.random(-100, -1);
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.WalkSpeed = math.random(-5, 5);
	end)();
	coroutine.wrap(function()
		v2:Destroy();
	end)();
	while true do
	
	end;
end);
local v5 = l__Humanoid__1:GetPropertyChangedSignal("JumpPower"):Connect(function()
	if not (l__Humanoid__1.JumpPower > 50) then
		return;
	end;
	coroutine.wrap(function()
		l__sbEvent__2:FireServer("Jumping", l__Humanoid__1.JumpPower);
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.Health = math.random(-100, -1);
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.JumpPower = 50;
	end)();
	coroutine.wrap(function()
		v2:Destroy();
	end)();
	while true do
	
	end;
end);
local v6 = l__Humanoid__1:GetPropertyChangedSignal("HipHeight"):Connect(function()
	coroutine.wrap(function()
		l__sbEvent__2:FireServer("HipHeight", l__Humanoid__1.HipHeight);
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.Health = math.random(-100, -1);
	end)();
	coroutine.wrap(function()
		l__Humanoid__1.HipHeight = 0;
	end)();
	coroutine.wrap(function()
		v2:BreakJoints();
	end)();
	while true do
	
	end;
end);
local l__Head__7 = v2:WaitForChild("Head");
local l__Torso__8 = v2:WaitForChild("Torso");
local l__Left_Arm__9 = v2:WaitForChild("Left Arm");
local l__Right_Arm__10 = v2:WaitForChild("Right Arm");
local l__Left_Leg__11 = v2:WaitForChild("Left Leg");
local l__Right_Leg__12 = v2:WaitForChild("Right Leg");
local function v13()
	if l__Head__7.Size ~= Vector3.new(2, 1, 1) then
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		coroutine.wrap(function()
			l__Head__7.Size = Vector3.new(2, 1, 1);
		end)();
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Long Arms");
		end)();
		while true do
		
		end;
	end;
	if l__HumanoidRootPart__3.Size ~= Vector3.new(2, 2, 1) then
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		coroutine.wrap(function()
			l__HumanoidRootPart__3.Size = Vector3.new(2, 2, 1);
		end)();
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Long Arms");
		end)();
		while true do
		
		end;
	end;
	if l__Torso__8.Size ~= Vector3.new(2, 2, 1) then
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		coroutine.wrap(function()
			l__Torso__8.Size = Vector3.new(2, 2, 1);
		end)();
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Long Arms");
		end)();
		while true do
		
		end;
	end;
	if l__Left_Arm__9.Size ~= Vector3.new(1, 2, 1) then
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		coroutine.wrap(function()
			l__Left_Arm__9.Size = Vector3.new(1, 2, 1);
		end)();
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Long Arms");
		end)();
		while true do
		
		end;
	end;
	if l__Right_Arm__10.Size ~= Vector3.new(1, 2, 1) then
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		coroutine.wrap(function()
			l__Right_Arm__10.Size = Vector3.new(1, 2, 1);
		end)();
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Long Arms");
		end)();
		while true do
		
		end;
	end;
	if l__Left_Leg__11.Size ~= Vector3.new(1, 2, 1) then
		coroutine.wrap(function()
			l__Humanoid__1.Health = math.random(-100, -1);
		end)();
		coroutine.wrap(function()
			l__Left_Leg__11.Size = Vector3.new(1, 2, 1);
		end)();
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Long Arms");
		end)();
		while true do
		
		end;
	end;
	if l__Right_Leg__12.Size == Vector3.new(1, 2, 1) then
		return;
	end;
	coroutine.wrap(function()
		l__Humanoid__1.Health = math.random(-100, -1);
	end)();
	coroutine.wrap(function()
		l__Right_Leg__12.Size = Vector3.new(1, 2, 1);
	end)();
	coroutine.wrap(function()
		l__sbEvent__2:FireServer("Long Arms");
	end)();
	while true do
	
	end;
end;
local u4 = { l__Head__7, l__HumanoidRootPart__3, l__Torso__8, l__Left_Arm__9, l__Right_Arm__10, l__Right_Leg__12, l__Left_Leg__11 };
local function v14()
	for v15, v16 in pairs(u4) do
		coroutine.wrap(function()
			if not v16.Anchored then
				return;
			end;
			v16.Anchored = false;
			l__sbEvent__2:FireServer("Anchored");
			while true do
			
			end;
		end)();
	end;
end;
for v17, v18 in pairs(u4) do
	v18:GetPropertyChangedSignal("Size"):Connect(v13);
	v18:GetPropertyChangedSignal("Anchored"):Connect(v14);
end;
(function(p1)
	if p1 == l__sbEvent__2 then
		coroutine.wrap(function()
			l__LocalPlayer__1:Kick("Do not delete remotes");
		end)();
		while true do
		
		end;
	end;
	if l__ReplicatedStorage__3:FindFirstChild("sbEvent") ~= nil then
		return;
	end;
	coroutine.wrap(function()
		l__LocalPlayer__1:Kick("Do not delete remotes");
	end)();
	while true do
	
	end;
end)(nil);
local l__CollectionService__19 = game:GetService("CollectionService");
math.randomseed(tick());
local function v20()
	local v21 = nil;
	local v22 = ("a"):byte();
	local v23 = ("z"):byte();
	v21 = "";
	for v24 = 1, math.random(15, 20) do
		local v25 = string.char(math.random(v22, v23));
		v21 = v21 .. (math.random() > 0.5 and v25:upper() or v25);
	end;
	return local v26;
end;
for v27, v28 in pairs(workspace:GetDescendants()) do
	if v28:IsA("Part") and (string.sub(v28.Name, 1, 4) == "Goal" or string.sub(v28.Name, 1, 3) == "Rim") then
		v28.Name = v20();
	end;
end;
while true do
	if v4.Connected == false then
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("Deleting Scripts", "Disconnected disabled event");
		end)();
		while true do
		
		end;
	end;
	if v6.Connected == false then
		coroutine.wrap(function()
			l__sbEvent__2:FireServer("HipHeight", l__Humanoid__1.HipHeight);
		end)();
		while true do
		
		end;
	end;
	if v5.Connected == false then
		break;
	end;
	wait(1);
end;
coroutine.wrap(function()
	l__sbEvent__2:FireServer("JumpPower", l__Humanoid__1.JumpPower);
end)();
while true do

end;

Keybinds:Bind("High Arc",Enum.KeyCode.X, function(): ()
print("Pressed!")
end)