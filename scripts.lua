-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Lago602447/Club/main/scripts.lua"))()

local LocalPlayer = game.Players.LocalPlayer
function Distance(POS)
	return game.Players.LocalPlayer:DistanceFromCharacter(POS)
end
function spawncheck(Name)
    return game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates[Name].Part
end
function totarget_spawn(CFgo,npc)
    local Dis = Distance(CFgo.Position)
    local Data = game:GetService("Players").LocalPlayer.Data

    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    if Dis < 1000 then
        Speed = 400
    elseif Dis >= 1000 then
        Speed = 350
    end

    getgenv().SpanwPass = false
    getgenv().DistancePass = false

    if Data.SpawnPoint.Value == spawncheck(npc) and Data.LastSpawnPoint.Value == spawncheck(npc) then
        getgenv().SpanwPass = true
    end
    if game.PlaceId == 4442272183 and Distance(spawncheck(npc).Position) < 3000 then
        getgenv().DistancePass = true
    elseif game.PlaceId == 2753915549 and Distance(spawncheck(npc).Position) < 1500 then
        getgenv().DistancePass = true
    elseif game.PlaceId == 7449423635 and Distance(spawncheck(npc).Position) < 4500 then
        getgenv().DistancePass = true
    end

    if getgenv().SpanwPass == false then
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spawncheck(npc).CFrame
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint",spawncheck(npc))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        until (Data.SpawnPoint.Value == spawncheck(npc) and Data.LastSpawnPoint.Value == spawncheck(npc))
        getgenv().SpanwPass = true
    end

    if getgenv().SpanwPass and getgenv().DistancePass then
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

function CFrameQuest()
    local Npc = require(game:GetService("ReplicatedStorage").GuideModule)
    local Pos
    for i,v in pairs(Npc.Data.NPCList) do
        if v.NPCName == Npc.Data.LastClosestNPC then
            Pos = CFrame.new(v.Position)
        end
    end
    return Pos
end

getgenv().use = not getgenv().use

spawn(function()
    while task.wait() do
        if use then
            totarget_spawn(CFrame.new(-1496, 39, 35),"Jungle")
        end
    end
end)
