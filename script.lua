local LocalPlayer = game.Players.LocalPlayer
local Plr = game.Players.LocalPlayer
local Rigc = getupvalue(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework),2)
local CombatFrameworkR = getupvalues(require(Plr.PlayerScripts.CombatFramework))[2]
local cooldownfastattack = tick()
--local CameraShaker = require(LocalPlayer.PlayerScripts.CombatFramework.CameraShaker.CameraShakeInstance)
local PC = require(LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local DMG = require(LocalPlayer.PlayerScripts.CombatFramework.Particle.Damage)
local cd = 0
local Quest = require(game:GetService("ReplicatedStorage").Quests)
local GuideModule = require(game:GetService("ReplicatedStorage").GuideModule)
local Queue = require(game:GetService("ReplicatedStorage").Queue)
local Collection = game:GetService("CollectionService")
local NPCList = getupvalues(Queue.new)[1][1].NPCDialogueEnabler.bin
local QuestNpc = {}
getgenv().PastQuest = 1
local computed_quest = {}
local quest_fordropdown = {}
do -- Init
	task = task or getrenv().task;
	fastSpawn,fastWait,delay = task.spawn,task.wait,task.delay
end
local FirstSea
local SecondSea
local ThirdSea
if game.PlaceId == 2753915549 then
	FirstSea = true
elseif game.PlaceId == 4442272183 then
	SecondSea = true
elseif game.PlaceId == 7449423635 then
	ThirdSea = true
end
if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end
if not shared.cpc then shared.cpc = PC.play end
if not shared.dnew then shared.dnew = DMG.new end
for i,v in pairs(NPCList) do
	local Model = v.Model
	if Model:FindFirstChild("QuestFloor",true) then
		QuestNpc[Model.Name] = v
		QuestNpc[Model.Name].lowername = Model.Name:lower()
	end
end
for i,v in pairs(QuestNpc) do
	computed_quest[v.Model.Name] = v.Model.Head.CFrame
end
for i,v in pairs(computed_quest) do
	table.insert(quest_fordropdown,i)
end

function AddTag(Obj,Tag)
    if not Collection:HasTag(Obj,Tag) then
        Collection:AddTag(Obj,Tag)
    end
end
function GetAllMob()
	return Collection:GetTagged("ActiveRig")
end
function GetMobName()
	if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
		local Text = LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:split(" ")
		local RealText = ""
		local List = #Text
		local Is = true
		if Text[List]:find("/1)") then
			Is = false
		end
		table.remove(Text,1)
		table.remove(Text,1)
		table.remove(Text,#Text)
		for i=1,#Text do local v = Text[i]
			RealText = RealText..v
			if #Text ~= i then
				RealText = RealText.." "
			end
		end
		if Is then
			RealText = RealText:sub(1,#RealText-1)
		end
		return RealText
	end
end
function Attack()
	spawn(function()
		pcall(function()
			local Controller = Rigc.activeController
			if Controller and tick() >= cd then
				cd = tick() + 0.1
				Controller:attack()
			end
		end)
	end)
end
function Maxincrement()
	local maxincrement = #Rigc.activeController.anims.basic
	return maxincrement
end
function Distance(POS)
	return LocalPlayer:DistanceFromCharacter(POS)
end
function IsQuest(bool)
    return game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == (bool or true)
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
function Questrun(name,index)
	local args = {
		[1] = "StartQuest",
		[2] = name,
		[3] = index
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

getgenv().Settings = not getgenv().Settings

spawn(function()
	while task.wait() do
		if getgenv().Settings then
			if not IsQuest(true) then
				for i,v in pairs(GuideModule.Data.NPCList) do
					if v.NPCName == GuideModule.Data.LastClosestNPC then
						repeat task.wait()
							totarget(computed_quest[v.NpcName])
						until Distance(CFrame.new(computed_quest[v.NpcName]).Position) <= 120
						if Distance(CFrame.new(computed_quest[v.NpcName]).Position) <= 50 then
							Questrun("BanditQuest1",1)
							repeat wait() until LocalPlayer.PlayerGui.Main.Quest.Visible
						end
					end
				end
			end
		end
	end
end)
