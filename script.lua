getgenv().Settings = true


local LocalPlayer = game.Players.LocalPlayer
local FirstSea,SecondSea,ThirdSea
local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
local LevelQuest,IndexQuest
getgenv().CFrameQuest = nil
if game.PlaceId == 2753915549 then
	FirstSea = true
elseif game.PlaceId == 4442272183 then
	SecondSea = true
elseif game.PlaceId == 7449423635 then
	ThirdSea = true
end
function CheckLevel(LEVEL)
	local Level = LEVEL or LocalPlayer.Data.Level.Value
	for i,v in pairs(GuideModule.Data.NPCList) do
		if v.NPCName == GuideModule.Data.LastClosestNPC then
			CFrameQuest = CFrame.new(v.Position)
		end
	end
	if FirstSea then
		if Level == 1 and Level <= 10 then
			LevelQuest = "BanditQuest1"
			IndexQuest = 1
		end
	end
end
function IsQuest(bool)
    return game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == (bool or true)
end
function Distance(POS)
    return LocalPlayer:DistanceFromCharacter(POS)
end
function totarget(CFgo)
    local Dis = Distance(CFgo.Position)
    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    if Dis < 1000 then
        Speed = 400
    elseif Dis >= 1000 then
        Speed = 350
    end

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
function RunremoteQuest(name,index)
	local args = {
		[1] = "StartQuest",
		[2] = name,
		[3] = index
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

spawn(function()
    while task.wait() do
        if getgenv().Settings then
            CheckLevel()
            if not IsQuest(true) then
                repeat task.wait()
                    totarget(CFrameQuest)
                until Distance(CFrameQuest.Position) <= 120
                task.wait(0.59)
                if Distance(CFrameQuest.Position) <= 50 then
                    RunremoteQuest(LevelQuest,IndexQuest)
                    repeat wait() until LocalPlayer.PlayerGui.Main.Quest.Visible
                end
            end
        end
    end
end)
