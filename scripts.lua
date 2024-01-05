local LocalPlayer = game.Players.LocalPlayer
function Distance(POS)
	return LocalPlayer:DistanceFromCharacter(POS)
end
function totarget(CFgo,Name)
    local Dis = Distance(CFgo.Position)
	local Level = LocalPlayer.Data.Level.Value
	if not Name then return end
    local PlayerSpawns = game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates[Name].Part
    local Data = game:GetService("Players").LocalPlayer.Data
    local World = {
        Second = 4442272183,
        First = 2753915549, -- first
        Third = 7449423635,
    }
    local Distank = {
        [1] = 3000,
        [2] = 1500,
        [3] = 4500,
    }

    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    if Dis < 1000 then Speed = 400 elseif Dis >= 1000 then Speed = 350 end

    getgenv().ret = false
    if Data.SpawnPoint.Value == Name then
        getgenv().ret = true 
    elseif Data.SpawnPoint.Value == Name and Data.LastSpawnPoint.Value == Name then
        getgenv().ret = true
    elseif game.placeId == World["Second"] and Distance(PlayerSpawns.Position) < Distank[1] and Data.SpawnPoint.Value == Name and Data.LastSpawnPoint.Value == Name then
        getgenv().ret = true
    elseif game.placeId == World["First"] and Distance(PlayerSpawns.Position) < Distank[2] and Data.SpawnPoint.Value == Name and Data.LastSpawnPoint.Value == Name then
        getgenv().ret = true
    elseif game.placeId == World["Third"] and Distance(PlayerSpawns.Position) < Distank[3] and Data.SpawnPoint.Value == Name and Data.LastSpawnPoint.Value == Name then
        getgenv().ret = true
    end


    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren()) do
        if Data.SpawnPoint.Value == v.Name then
            if Distance(v:GetModelCFrame().Position) > Distank[2] and game.PlaceId == World.First then
                getgenv().ret = false
            end
        end
    end

    if getgenv().ret == false and Data.SpawnPoint.Value ~= Name and Data.LastSpawnPoint.Value ~= Name then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,10000,0)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerSpawns.CFrame
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint",Name)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        until (Data.SpawnPoint.Value == Name and Data.LastSpawnPoint.Value == Name)
    end
    
	if Data.SpawnPoint.Value == Name and Data.LastSpawnPoint.Value == Name then
		getgenv().ret = true
	end
 
	if getgenv().ret then
		if Dis > 430 then
			local tween_s = game:service"TweenService"
			local info = TweenInfo.new(Dis/Speed, Enum.EasingStyle.Linear)
			local tween, err = pcall(function()
				_G.Teleporting = true
				tween = tween_s:Create(LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})
				tween:Play()
				repeat
					task.wait() 
				until Distance(CFgo.Position) <= 430 or not _G.Teleporting
				tween:Cancel()
				_G.Teleporting = false
				task.wait(0.8)
				if Distance(CFgo.Position) <= 430 then
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFgo
				end
			end)
			if not tween then return err end
		else
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFgo
		end
	end
end

while task.wait() do
    totarget(CFrame.new(1094.14587, 6.47350502, 4192.88721),"Desert")
end
