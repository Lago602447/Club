if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");

do  local ui =  game:GetService("CoreGui"):FindFirstChild("AOSUDHBAJSD46857984")  if ui then ui:Destroy() end end

do  local ui =  game:GetService("CoreGui"):FindFirstChild("AOSUDHBAJSD46857984.2")  if ui then ui:Destroy() end end

local Alpha = Instance.new("ScreenGui")
Alpha.Name = ("AOSUDHBAJSD46857984")
Alpha.Parent = game.CoreGui
Alpha.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local NotificationHolder = Instance.new("ScreenGui")
NotificationHolder.Name = ("AOSUDHBAJSD46857984.2")
NotificationHolder.Parent = game.CoreGui
NotificationHolder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local http = game:GetService("HttpService")

local WhitelistedMouse = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}
local BlacklistedKeys = {Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Up,Enum.KeyCode.Left,Enum.KeyCode.Down,Enum.KeyCode.Right,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.Escape}

local function CheckKey(tab, key)
	for i, v in next, tab do
		if v == key then
			return true
		end
	end
end


local AlphaLib = {
	Themes = {
		Discord = {
			MainFrame = Color3.fromRGB(54,57,63),
			TopBar = Color3.fromRGB(47,49,54),
			TextColor =  Color3.fromRGB(255,255,255),
			Menu = Color3.fromRGB(47,49,54),
			TabToggled = Color3.fromRGB(54,57,63),
			Button = Color3.fromRGB(88,101,242),
			ButtonHold = Color3.fromRGB(71,82,196),
			Toggle = Color3.fromRGB(47,49,54),
			ToggleFrame = Color3.fromRGB(67,69,74),
			ToggleToggled = Color3.fromRGB(22, 168, 76),
			Slider = Color3.fromRGB(47,49,54),
			SliderBar = Color3.fromRGB(42, 44, 49),
			SliderInc = Color3.fromRGB(62,64,69),
			Dropdown = Color3.fromRGB(47,49,54),
			DropdownItem = Color3.fromRGB(47,49,54),
			Textbox = Color3.fromRGB(47,49,54),
			TextboxFrame = Color3.fromRGB(42,44,49),
			Colorpicker = Color3.fromRGB(47,49,54),
			Label = Color3.fromRGB(47,49,54),
			Bind = Color3.fromRGB(47,49,54)
		}
	},
	Settings = {
		Theme = "Discord",
		ShowFriendsOnLaunch = true,
		ShowMusicOnLaunch = true,
		CloseBind = "RightControl"
	},
	Flags = {},
	CurrentTab
}



local MainUI = game:GetObjects("rbxassetid://7835727566")[1]
local function MakeDraggable(topbarobject, object)
	pcall(function()
		local dragging, dragInput, mousePos, framePos = false
		topbarobject.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				mousePos = input.Position
				framePos = object.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		topbarobject.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - mousePos
				object.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
			end
		end)
	end)
end


function Ripple(Object)
	spawn(function()
		local Circle = Instance.new("ImageLabel")
		Circle.Parent = Object
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 1.000
		Circle.ZIndex = 10
		Circle.Image = "rbxassetid://266543268"
		Circle.ImageColor3 = Color3.fromRGB(210,210,210)
		Circle.ImageTransparency = 0.8
		Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
		local Size = Object.AbsoluteSize.X
		TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, Object.AbsoluteSize.X)/Object.AbsoluteSize.X,Object,math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, Object.AbsoluteSize.Y)/Object.AbsoluteSize.Y) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, Size = UDim2.fromOffset(Size,Size)}):Play()
		spawn(function()
			wait(0.5)
			Circle:Destroy()
		end)
	end)
end

function AlphaLib:Notification(title, desc)
	Notify:New(title,desc)
end

function AlphaLib:New(Config)
	-- if not isfolder(Config.FolderToSave) then
	-- 	makefolder(Config.FolderToSave)
	-- end

	-- if not isfolder(Config.FolderToSave .. "/configs") then
	-- 	makefolder(Config.FolderToSave .. "/configs")
	-- end

	-- if not isfile(Config.FolderToSave .. "/settings.txt") then
	-- 	local content = {}
	-- 	for i,v in pairs(AlphaLib.Settings) do
	-- 		content[i] = v
	-- 	end
	-- 	writefile(Config.FolderToSave .. "/settings.txt", tostring(http:JSONEncode(content)))
	-- end
	-- AlphaLib.Settings = http:JSONDecode(readfile(Config.FolderToSave .. "/settings.txt"))

	local closebindbinding = false
	local fs = false
	local tabcount = 0
	local uitoggled = true
	local tabmenutoggled = false
	local TabPreset = game:GetObjects("rbxassetid://6958615840")[1]
	local SectionPreset = game:GetObjects("rbxassetid://7121846230")[1]
	local ContainerPreset = game:GetObjects("rbxassetid://7121886326")[1]
	local MFrame = MainUI.MainFrame
	MainUI.Parent = Alpha
	MFrame.TopBar.TopFrameTitle.Text = Config.Name
	MakeDraggable(MFrame.TopBar, MainUI)
	local oldScript = script

	local MenuBtnPreset = game:GetObjects("rbxassetid://7037141226")[1]
	local MusicBtn = MenuBtnPreset:Clone()
	MusicBtn.Parent = MFrame.TopBar.ButtonHolder.MenuBtn.MenuFrame
	MusicBtn.Position = UDim2.new(0,0,0,5)
	MusicBtn.Text = "Music"
	MusicBtn.TextTransparency = 1
	local SettingsBtn = MenuBtnPreset:Clone()
	SettingsBtn.Parent = MFrame.TopBar.ButtonHolder.MenuBtn.MenuFrame
	SettingsBtn.Position = UDim2.new(0,0,0,25)
	SettingsBtn.Text = "Settings"
	SettingsBtn.TextTransparency = 1

	function SettingsConstructor()
		local Settings, SettingsFrame, TabPreset, ContainerPreset, TogglePreset, BindPreset, DropdownPreset, OptionPreset = {}, game:GetObjects("rbxassetid://7167491516")[1], game:GetObjects("rbxassetid://7177524915")[1], game:GetObjects("rbxassetid://7203599409")[1], game:GetObjects("rbxassetid://7208643984")[1], game:GetObjects("rbxassetid://7219277948")[1], game:GetObjects("rbxassetid://7435055269")[1], game:GetObjects("rbxassetid://7435032496")[1]
		local fs = true
		local SFrame = SettingsFrame.Main
		SettingsFrame.Parent = MFrame
		SFrame.TopBar.CloseBtn.MouseButton1Click:Connect(function()
			SettingsFrame.Visible = false
		end)

		-- function SaveSettings()
		-- 	local content = {}
		-- 	for i,v in pairs(AlphaLib.Settings) do
		-- 		content[i] = v
		-- 	end
		-- 	writefile(Config.FolderToSave .. "/settings.txt", tostring(http:JSONEncode(content)))
		-- end


		spawn(function()
			while wait() do
				SFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].MainFrame
				SFrame.TopBar.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TopBar
				SFrame.TopBar.CloseBtn.Ico.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
				SFrame.TopBar.TopFrameTitle.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
				SFrame.TabHolder.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TopBar
			end
		end)

		function Settings:Tab(text)
			local Tab = TabPreset:Clone()
			local Container = ContainerPreset:Clone()
			Tab.Parent = SFrame.TabHolder
			Tab.Text = text
			Tab.Size = UDim2.new(0,Tab.TextBounds.X,1,0)
			Container.Parent = SFrame.ContainerFolder
			Container.Visible = false

			if fs then
				Tab.TextTransparency = 0
				Container.Visible = true
				fs = false
			end

			Tab.MouseButton1Click:Connect(function()
				for i,v in next, SFrame.TabHolder:GetChildren() do
					if v.Name == "Tab" then
						v.TextTransparency = 0.4
					end
				end
				for i,v in next, SFrame.ContainerFolder:GetChildren() do
					if v.Name == "Container" then
						v.Visible = false
					end
				end
				Tab.TextTransparency = 0
				Container.Visible = true
			end)
			local TabHold = {}
			function TabHold:ToggleSetting(title, desc, def, path)
				local value = AlphaLib.Settings[path] or def
				local Toggle = TogglePreset:Clone()
				Toggle.Parent = Container
				Toggle.Title.Text = title
				Toggle.Desc.Text = desc

				local function Tween(val)
					TweenService:Create(Toggle.ToggleFrame.ToggleToggled.ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency= val and 0 or 1}):Play()
					TweenService:Create(Toggle.ToggleFrame.ToggleToggled.ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size= val and UDim2.new(1,-2,1,-2) or UDim2.new(1,-6,1,-6)}):Play()
				end

				local function SetValue(val)
					Tween(val)
					AlphaLib.Settings[path] = val
					value = val
				end

				Tween(value)

				Toggle.MouseButton1Click:Connect(function()
					SetValue(not value)
				end)

				spawn(function()
					while wait() do
						Toggle.ToggleFrame.ToggleToggled.BackgroundColor3 = value and AlphaLib.Themes[AlphaLib.Settings.Theme].ToggleToggled or AlphaLib.Themes[AlphaLib.Settings.Theme].MainFrame
						Toggle.ToggleFrame.BackgroundColor3 = value and AlphaLib.Themes[AlphaLib.Settings.Theme].ToggleToggled or AlphaLib.Themes[AlphaLib.Settings.Theme].ToggleFrame
						Toggle.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)
			end
			function TabHold:BindSetting(title, desc, def, path)
				local value = AlphaLib.Settings[path] or def
				local Bind = BindPreset:Clone()
				Bind.Parent = Container
				Bind.Title.Text = title
				Bind.Desc.Text = desc

				function SetValue(val)
					closebindbinding = false
					value = val or value
					value = value.Name or value
					Bind.BText.Text = value
					AlphaLib.Settings[path] = value
				end
				SetValue(value)

				Bind.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if closebindbinding then return end
						closebindbinding = true
						Bind.BText.Text = "..."
					end
				end)

				UserInputService.InputBegan:Connect(function(Input)
					if UserInputService:GetFocusedTextBox() then return end
					if closebindbinding then
						local Key
						pcall(function()
							if not CheckKey(BlacklistedKeys, Input.KeyCode) then
								Key = Input.KeyCode
							end
						end)
						pcall(function()
							if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
								Key = Input.UserInputType
							end
						end)
						Key = Key or value
						SetValue(Key)
					end
				end)

				spawn(function()
					while wait() do
						Bind.Desc.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						Bind.BText.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						Bind.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

			end
			function TabHold:Dropdown(title, desc, list, def, path)
				local opened = false
				local value = AlphaLib.Settings[path] or def
				local Dropdown = DropdownPreset:Clone()
				Dropdown.Parent = Container
				Dropdown.Title.Text = title
				Dropdown.Desc.Text = desc
				Dropdown.Main.Current.Text = value

				function Toggle()
					Dropdown.Main.Holder.Visible = opened
					Dropdown.Main.Holder.Size = opened and UDim2.new(1,0,0,Dropdown.Main.Holder.UIListLayout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,0)
					if opened then
						if (Dropdown.Main.Holder.UIListLayout.AbsoluteContentSize.Y + Container.UIListLayout.AbsoluteContentSize.Y) > 190 then
							Container.CanvasSize = UDim2.new(0,0,0,Dropdown.Main.Holder.UIListLayout.AbsoluteContentSize.Y + Container.UIListLayout.AbsoluteContentSize.Y)
						end
					else
						Container.CanvasSize = UDim2.new(0,0,0,Container.UIListLayout.AbsoluteContentSize.Y)
					end
					TweenService:Create(Dropdown.Main.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = opened and 180 or 0}):Play()
				end

				Dropdown.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						opened = not opened
						Toggle()
					end
				end)

				local function AddOptions(opts)
					for _,option in pairs(opts) do
						local Option = OptionPreset:Clone()
						Option.Parent = Dropdown.Main.Holder
						Option.Text = option

						Option.MouseButton1Click:Connect(function()
							value = option
							AlphaLib.Settings[path] = value
							Dropdown.Main.Current.Text = value
						end)

						spawn(function()
							while wait() do
								Option.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
							end
						end)
					end
				end

				spawn(function()
					while wait() do
						Dropdown.Main.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TopBar
						Dropdown.Main.Holder.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TopBar
					end
				end)
				AddOptions(list)
			end
			return TabHold
		end

		local general = Settings:Tab("General")
		general:ToggleSetting("Show Music On Launch", "Shows the music menu when you load Snow Hub", true, "ShowMusicOnLaunch")
		general:BindSetting("Close Bind", "Hides/Shows the main window when pressed.", Enum.KeyCode.RightControl, "CloseBind")

		local appearance = Settings:Tab("Appearance")
		appearance:Dropdown("Theme", "The look of the user interface", {"Default", "Discord", "Red", "Green", "Blue"}, "Default", "Theme")

	end
	SettingsConstructor()

	local function OpenTabMenu()
		TweenService:Create(MFrame.TabMenu,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0,0,0,0)}):Play()
	end

	local function CloseTabMenu()
		TweenService:Create(MFrame.TabMenu,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(-0.37, -8, 0, 0)}):Play()
	end

	MFrame.TopBar.TabListBtn.MouseButton1Click:Connect(function()
		OpenTabMenu()
	end)

	MFrame.TabMenu.Menu.Top.MenuCloseBtn.MouseButton1Click:Connect(function()
		CloseTabMenu()
	end)

	MFrame.TopBar.ButtonHolder.SearchBtn.MouseButton1Click:Connect(function()
		MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.Visible = not MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.Visible
		MFrame.TopBar.TopFrameTitle.Visible = not MFrame.TopBar.TopFrameTitle.Visible
	end)

	MFrame.TopBar.ButtonHolder.CloseBtn.MouseEnter:Connect(function() TweenService:Create(MFrame.TopBar.ButtonHolder.CloseBtn.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play() end)
	MFrame.TopBar.ButtonHolder.CloseBtn.MouseLeave:Connect(function() TweenService:Create(MFrame.TopBar.ButtonHolder.CloseBtn.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.4}):Play() end)
	MFrame.TopBar.ButtonHolder.SearchBtn.MouseEnter:Connect(function() TweenService:Create(MFrame.TopBar.ButtonHolder.SearchBtn.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play() end)
	MFrame.TopBar.ButtonHolder.SearchBtn.MouseLeave:Connect(function() TweenService:Create(MFrame.TopBar.ButtonHolder.SearchBtn.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.4}):Play() end)
	MFrame.TopBar.TabListBtn.MouseEnter:Connect(function() TweenService:Create(MFrame.TopBar.TabListBtn,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play() end)
	MFrame.TopBar.TabListBtn.MouseLeave:Connect(function() TweenService:Create(MFrame.TopBar.TabListBtn,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.4}):Play() end)

	MFrame.TopBar.ButtonHolder.CloseBtn.MouseButton1Click:Connect(function()
		Alpha:Destroy()
		NotificationHolder:Destroy()
	end)


	function SearchConstructor()
		function StitchElements()
			local elms = {}
			for i,v in next, AlphaLib.CurrentTab:GetDescendants() do
				if string.find(v.Name, "element") then
					table.insert(elms, v)
				end
			end
			return elms
		end

		MFrame.TopBar.ButtonHolder.SearchBtn.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			for i,v in pairs(StitchElements()) do
				if string.len(MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.Text) >= 1 then
					if string.find(string.sub(v.Name:lower(),0,-8), MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.Text:lower()) then
						v.Visible = true
					else
						v.Visible = false
					end
				else
					v.Visible = true
				end
			end
		end)
	end

	SearchConstructor()


	UserInputService.InputBegan:Connect(function(Input)
		if (Input.KeyCode.Name == AlphaLib.Settings.CloseBind or Input.UserInputType.Name == AlphaLib.Settings.CloseBind) and not closebindbinding then
			uitoggled = not uitoggled
			MainUI.Visible = uitoggled
		end
	end)

	spawn(function()
		while wait() do
			MFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].MainFrame
			MFrame.TopBar.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TopBar
			MFrame.TopBar.ButtonHolder.CloseBtn.Ico.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
			MFrame.TopBar.ButtonHolder.SearchBtn.Ico.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
			MFrame.TopBar.TabListBtn.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
			MFrame.TopBar.TopFrameTitle.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
			MFrame.TabMenu.Menu.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Menu
			MFrame.TabMenu.Menu.Top.MenuCloseBtn.ImageLabel.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
			MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].MainFrame
			MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
			MFrame.TopBar.ButtonHolder.SearchBtn.TextBox.PlaceholderColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
		end
	end)

	-- function AlphaLib:LoadCfg(cfg)
	-- 	local content = http:JSONDecode(cfg)
	-- 	table.foreach(content, function(a,b)
	-- 		if AlphaLib.Flags[a] then
	-- 			spawn(function() AlphaLib.Flags[a]:Set(b) end)
	-- 		else
	-- 			warn("cfg loader - could not find", a ,b )
	-- 		end
	-- 	end)
	-- end

	-- function AlphaLib:SaveCfg(name)
	-- 	local content = {}
	-- 	for i,v in pairs(AlphaLib.Flags) do
	-- 		content[i] = v.Value
	-- 	end
	-- 	writefile(Config.FolderToSave .. "/configs/" .. name .. ".txt", tostring(http:JSONEncode(content)))
	-- end


	local TabHolder = {}
	function TabHolder:Tab(text)
		local Tab = TabPreset:Clone()
		Tab.AutoButtonColor = false
		Tab.Parent = MFrame.TabMenu.Menu.Holder
		Tab.Text =  text
		Tab.TextSize = 14


		local Container =  ContainerPreset:Clone()
		Container.Parent = MFrame.ContainerFolder
		Container.Visible = false

		if fs == false then
			fs = true
			Container.Visible = true
			Tab.UIPadding.PaddingLeft = UDim.new(0,10)
			Tab.TextTransparency = 0
			Tab.BackgroundTransparency = 0
			AlphaLib.CurrentTab = Container
		end

		spawn(function()
			while wait() do
				Tab.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
				Tab.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TabToggled
				Container.CanvasSize = UDim2.new(0,0,0,Container.UIListLayout.AbsoluteContentSize.Y + 26)
			end
		end)



		Tab.MouseButton1Click:Connect(function()
			for i,v in next, MFrame.TabMenu.Menu.Holder:GetChildren() do
				if v:IsA("TextButton") then
					TweenService:Create(v,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.4}):Play()
					TweenService:Create(v,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
					TweenService:Create(v.UIPadding,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{PaddingLeft = UDim.new(0,5)}):Play()
				end
				TweenService:Create(Tab,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
				TweenService:Create(Tab,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
				TweenService:Create(Tab.UIPadding,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{PaddingLeft = UDim.new(0,10)}):Play()
			end
			for i,v in next, MFrame.ContainerFolder:GetChildren() do
				if v.Name == "Container" then
					v.Visible = false
				end
				Container.Visible = true
			end
			tabtoggledname = Tab.Name
			CloseTabMenu()
		end)


		local SectionHold = {}
		function SectionHold:Section(text)
			local Section = SectionPreset:Clone()
			Section.Parent = Container
			Section.SectionTitle.Text = text

			spawn(function()
				while wait() do
					Section.SectionTitle.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					Section.Size = UDim2.new(0.9,0,0,Section.UIListLayout.AbsoluteContentSize.Y)
				end
			end)
			local ItemHold = {}
			function ItemHold:Button(text,callback)
				local Holding = false
				local Button = game:GetObjects("rbxassetid://6937142338")[1]
				Button.Parent = Section
				Button.Name = text .. "element"
				Button.ButtonText.Text = text
				Button.ClipsDescendants = true

				Button.MouseButton1Click:Connect(function()
					callback()
					Ripple(Button)
				end)
				Button.MouseEnter:Connect(function()
					Holding = true
				end)
				Button.MouseLeave:Connect(function()
					Holding = false
				end)

				spawn(function()
					while wait() do
						Button.BackgroundColor3 = Holding and AlphaLib.Themes[AlphaLib.Settings.Theme].ButtonHold or AlphaLib.Themes[AlphaLib.Settings.Theme].Button
						Button.ButtonText.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

			end
			function ItemHold:Toggle(text,def,flag,callback)
				local Toggle,ToggleMain = {Value = false}, game:GetObjects("rbxassetid://6963155498")[1]
				ToggleMain.Parent = Section
				ToggleMain.ToggleText.Text = text
				ToggleMain.Name = text .. "element"

				function Toggle:Set(value)
					Toggle.Value = value
					TweenService:Create(ToggleMain.ToggleFrame.ToggleToggled.ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency= Toggle.Value and 0 or 1}):Play()
					TweenService:Create(ToggleMain.ToggleFrame.ToggleToggled.ToggleIco,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size= Toggle.Value and UDim2.new(1,-2,1,-2) or UDim2.new(1,-6,1,-6)}):Play()
					return callback(Toggle.Value)
				end

				ToggleMain.MouseButton1Click:Connect(function()
					Toggle.Value = not Toggle.Value
					Toggle:Set(Toggle.Value)
				end)

				spawn(function()
					while wait() do
						ToggleMain.ToggleFrame.ToggleToggled.BackgroundColor3 = Toggle.Value and AlphaLib.Themes[AlphaLib.Settings.Theme].ToggleToggled or AlphaLib.Themes[AlphaLib.Settings.Theme].Toggle
						ToggleMain.ToggleFrame.BackgroundColor3 = Toggle.Value and AlphaLib.Themes[AlphaLib.Settings.Theme].ToggleToggled or AlphaLib.Themes[AlphaLib.Settings.Theme].ToggleFrame
						ToggleMain.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Toggle
						ToggleMain.ToggleText.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

				Toggle:Set(def)
				AlphaLib.Flags[flag] = Toggle
				return Toggle
			end
			function ItemHold:Slider(text,min,max,start,inc,flag,callback)
				local Slider,SliderMain = {Value = start}, game:GetObjects("rbxassetid://6967573727")[1]
				SliderMain.Parent = Section
				SliderMain.SliderText.Text = text
				SliderMain.Name = text .. "element"
				local dragging = false

				local function move(Input)
					local XSize = math.clamp((Input.Position.X - SliderMain.SliderFrame.AbsolutePosition.X) / SliderMain.SliderFrame.AbsoluteSize.X, 0, 1)
					local Increment = inc and (max / ((max - min) / (inc * 4))) or (max >= 50 and max / ((max - min) / 4)) or (max >= 25 and max / ((max - min) / 2)) or (max / (max - min))
					local SizeRounded = UDim2.new((math.round(XSize * ((max / Increment) * 4)) / ((max / Increment) * 4)), 0, 1, 0)
					TweenService:Create(SliderMain.SliderFrame.SliderCurrentFrame,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = SizeRounded}):Play()
					local Val = math.round((((SizeRounded.X.Scale * max) / max) * (max - min) + min) * 20) / 20
					SliderMain.SliderVal.Text = tostring(Val)
					Slider.Value = Val
					callback(Slider.Value)
				end
				SliderMain.SliderFrame.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end end)
				SliderMain.SliderFrame.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
				game:GetService("UserInputService").InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then move(input) end end)

				function Slider:Set(val)
					local a = tostring(val and (val / max) * (max - min) + min) or 0
					SliderMain.SliderVal.Text = tostring(a)
					SliderMain.SliderFrame.SliderCurrentFrame.Size = UDim2.new((val or 0) / max, 0, 1, 0)
					Slider.Value = val
					return callback(Slider.Value)
				end

				spawn(function()
					while wait() do
						SliderMain.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Slider
						SliderMain.SliderFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].SliderBar
						SliderMain.SliderFrame.SliderCurrentFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].SliderInc
						SliderMain.SliderText.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						SliderMain.SliderVal.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)


				Slider:Set(start)
				AlphaLib.Flags[flag] = Slider
				return Slider
			end
			function ItemHold:Dropdown(text,list,def,flag,callback)
				local Dropdown,DropMain,OptionPreset = {Value = nil, Toggled = false, Options = list}, game:GetObjects("rbxassetid://7027964359")[1], game:GetObjects("rbxassetid://7021432326")[1]
				DropMain.Parent = Section
				DropMain.Btn.Title.Text = text
				DropMain.Name = text .. "element"


				local function ToggleDrop()
					Dropdown.Toggled = not Dropdown.Toggled
					DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1,0,0,6+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,0)
					TweenService:Create(DropMain,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Dropdown.Toggled and UDim2.new(1,0,0,38+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,32)}):Play()
					TweenService:Create(DropMain.Btn.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = Dropdown.Toggled and 180 or 0}):Play()
					DropMain.Holder.Visible = Dropdown.Toggled
				end

				local function AddOptions(opts)
					for _,option in pairs(opts) do
						local Option = OptionPreset:Clone()
						Option.Parent = DropMain.Holder
						Option.ItemText.Text = option
						Option.ClipsDescendants = true

						Option.MouseButton1Click:Connect(function()
							Dropdown.Value = option
							DropMain.Btn.Title.Text = text .. " - " .. option
							Ripple(Option)
							return callback(Dropdown.Value)
						end)

						spawn(function()
							while wait() do
								Option.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].DropdownItem
								DropMain.Btn.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
							end
						end)
					end
				end

				function Dropdown:Refresh(opts,del)
					if del then
						for _,v in pairs(DropMain.Holder:GetChildren()) do
							if v:IsA"TextButton" then
								v:Destroy()
								DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1,0,0,6+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,0)
								DropMain.Size = Dropdown.Toggled and UDim2.new(1,0,0,38+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,32)
							end
						end
					end
					AddOptions(opts)
				end


				DropMain.Btn.MouseButton1Click:Connect(function()
					ToggleDrop()
				end)

				function Dropdown:Set(val)
					Dropdown.Value = val
					DropMain.Btn.Title.Text = text .. " - " .. val
					return callback(Dropdown.Value)
				end

				spawn(function()
					while wait() do
						DropMain.Btn.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Dropdown
						DropMain.Btn.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						DropMain.Btn.Ico.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

				Dropdown:Refresh(list,false)
				Dropdown:Set(def)
				AlphaLib.Flags[flag] = Dropdown
				return Dropdown
			end
			function ItemHold:MultiDropdown(text,list,def,flag,callback)
				local Dropdown,DropMain,OptionPreset = {Value = {}, Toggled = false, Options = list}, game:GetObjects("rbxassetid://7027964359")[1], game:GetObjects("rbxassetid://7021432326")[1]
				DropMain.Parent = Section
				DropMain.Btn.Title.Text = text
				DropMain.Name = text .. "element"


				local function ToggleDrop()
					Dropdown.Toggled = not Dropdown.Toggled
					DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1,0,0,6+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,0)
					TweenService:Create(DropMain,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Dropdown.Toggled and UDim2.new(1,0,0,38+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,32)}):Play()
					TweenService:Create(DropMain.Btn.Ico,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = Dropdown.Toggled and 180 or 0}):Play()
					DropMain.Holder.Visible = Dropdown.Toggled
				end

				local function AddOptions(opts)
					for _,option in pairs(opts) do
						local Option = OptionPreset:Clone()
						Option.Parent = DropMain.Holder
						Option.ItemText.Text = option
						Option.ClipsDescendants = true

						Option.MouseButton1Click:Connect(function()
							if table.find(Dropdown.Value, option) then
								table.remove(Dropdown.Value, table.find(Dropdown.Value, option))
								DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
								callback(Dropdown.Value)
							else
								table.insert(Dropdown.Value, option)
								DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
								callback(Dropdown.Value)
							end
							Ripple(Option)
						end)

						spawn(function()
							while wait() do
								Option.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].DropdownItem
								DropMain.Btn.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
							end
						end)
					end
				end

				function Dropdown:Refresh(opts,del)
					if del then
						for _,v in pairs(DropMain.Holder:GetChildren()) do
							if v:IsA"TextButton" then
								v:Destroy()
								DropMain.Holder.Size = Dropdown.Toggled and UDim2.new(1,0,0,6+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,0)
								DropMain.Size = Dropdown.Toggled and UDim2.new(1,0,0,38+DropMain.Holder.Layout.AbsoluteContentSize.Y) or UDim2.new(1,0,0,32)
							end
						end
					end
					AddOptions(opts)
				end


				DropMain.Btn.MouseButton1Click:Connect(function()
					ToggleDrop()
				end)

				function Dropdown:Set(val)
					Dropdown.Value = val
					DropMain.Btn.Title.Text = text .. " - " .. table.concat(Dropdown.Value, ", ")
					return callback(Dropdown.Value)
				end

				spawn(function()
					while wait() do
						DropMain.Btn.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Dropdown
						DropMain.Btn.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						DropMain.Btn.Ico.ImageColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

				Dropdown:Refresh(list,false)
				Dropdown:Set(def)
				AlphaLib.Flags[flag] = Dropdown
				return Dropdown
			end
			function ItemHold:Colorpicker(text,preset,flag,callback)
				local ColorH, ColorS, ColorV = 1, 1, 1
				local ColorPicker, ColorPreset, DragPreset = {Value = preset, Toggled = false}, game:GetObjects("rbxassetid://7329998014")[1]
				ColorPreset.Hue.Visible, ColorPreset.Color.Visible = ColorPicker.Toggled, ColorPicker.Toggled
				ColorPreset.Parent = Section
				ColorPreset.Btn.Colorpicker.Text = text
				ColorPreset.Name = text .. "element"
				ColorPreset.Btn.Box.BackgroundColor3 = preset
				ColorPreset.Hue.HueGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
				local Color = ColorPreset.Color
				local Hue = ColorPreset.Hue
				local HueSelection = ColorPreset.Hue.HueSelection
				local ColorSelection = ColorPreset.Color.ColorSelection

				function UpdateColorPicker()
					ColorPreset.Btn.Box.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
					pcall(callback, ColorPreset.Btn.Box.BackgroundColor3)
				end

				ColorPreset.Btn.MouseButton1Click:Connect(function()
					ColorPicker.Toggled = not ColorPicker.Toggled
					TweenService:Create(ColorPreset,TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = ColorPicker.Toggled and UDim2.new(1,0,0,120) or UDim2.new(1,0,0,32)}):Play()
					ColorPreset.Hue.Visible, ColorPreset.Color.Visible = ColorPicker.Toggled, ColorPicker.Toggled
				end)

				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

				ColorPreset.Btn.Box.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, ColorPreset.Btn.Box.BackgroundColor3)

				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
						ColorInput = RunService.RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY
							UpdateColorPicker()
						end)
					end
				end)

				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = RunService.RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)

							HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				spawn(function()
					while wait() do
						ColorPreset.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Colorpicker
						ColorPreset.Btn.Colorpicker.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

				return ColorPicker
			end
			function ItemHold:Label(text)
				local Label, LabelFrame = {}, game:GetObjects("rbxassetid://7032552322")[1]
				LabelFrame.Parent = Section
				LabelFrame.Title.Text = text
				LabelFrame.Name = text .. "element"

				function Label:Set(tochange)
					LabelFrame.Title.Text = tochange
					LabelFrame.Name = text .. "element"
				end


				spawn(function()
					while wait() do
						LabelFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Label
						LabelFrame.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

				return Label
			end
			function ItemHold:Textbox(text,disappear,callback)
				local Textbox, TextboxFrame = {}, game:GetObjects("rbxassetid://7147292392")[1]
				TextboxFrame.Parent = Section
				TextboxFrame.Title.Text = text
				TextboxFrame.Name = text .. "element"

				TextboxFrame.Box.Changed:Connect(function()
					TextboxFrame.Box.Size = UDim2.new(0,TextboxFrame.Box.TextBounds.X + 16,0,22)
				end)
				TextboxFrame.Box.PlaceholderText = "                  "

				TextboxFrame.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						TextboxFrame.Box:CaptureFocus()
					end
				end)


				TextboxFrame.Box.FocusLost:Connect(function()
					local txt = TextboxFrame.Box.Text
					if disappear then
						TextboxFrame.Box.Text = ""
					end
					return callback(txt)
				end)

				UserInputService.InputBegan:Connect(function(input)
					if input.KeyCode == Enum.KeyCode.Escape and TextboxFrame.Box:IsFocused() then
						TextboxFrame.Box:ReleaseFocus()
					end
				end)

				spawn(function()
					while wait() do
						TextboxFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Textbox
						TextboxFrame.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						TextboxFrame.Box.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextboxFrame
						TextboxFrame.Box.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)
				return Textbox
			end
			function ItemHold:Bind(text,preset,holdmode,flag,callback)
				local Bind, BindFrame = {Value, Binding = false, Holding = false}, game:GetObjects("rbxassetid://7126874744")[1]
				BindFrame.Parent = Section
				BindFrame.Title.Text = text
				BindFrame.Name = text .. "element"



				BindFrame.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Bind.Binding then return end
						Bind.Binding = true
						BindFrame.BText.Text = "..."
					end
				end)

				UserInputService.InputBegan:Connect(function(Input)
					if UserInputService:GetFocusedTextBox() then return end
					if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and not Bind.Binding then
						if holdmode then
							Holding = true
							callback(Holding)
						else
							callback()
						end
					elseif Bind.Binding then
						local Key
						pcall(function()
							if not CheckKey(BlacklistedKeys, Input.KeyCode) then
								Key = Input.KeyCode
							end
						end)
						pcall(function()
							if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
								Key = Input.UserInputType
							end
						end)
						Key = Key or Bind.Value
						Bind:Set(Key)
					end
				end)

				UserInputService.InputEnded:Connect(function(Input)
					if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
						if holdmode and Holding then
							Holding = false
							callback(Holding)
						end
					end
				end)

				function Bind:Set(key)
					self.Binding = false
					self.Value = key or self.Value
					self.Value = self.Value.Name or self.Value
					BindFrame.BText.Text = self.Value
				end

				spawn(function()
					while wait() do
						BindFrame.BackgroundColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].Bind
						BindFrame.Title.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
						BindFrame.BText.TextColor3 = AlphaLib.Themes[AlphaLib.Settings.Theme].TextColor
					end
				end)

				Bind:Set(preset)
				AlphaLib.Flags[flag] = Bind
				return Bind
			end
			return ItemHold
		end
		return SectionHold
	end
	return TabHolder
end

local LocalPlayer = game.Players.LocalPlayer
local Rigc = getupvalue(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework),2)
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
local PastQuest = 1
local computed_quest = {}
local quest_fordropdown = {}
do -- Init
	task = task or getrenv().task;
	fastSpawn,fastWait,delay = task.spawn,task.wait,task.delay
end
local FirstSea,SecondSea,ThirdSea
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
local EliteKilledValue = 0
local AllCode = {
	"Starcodeheo",
	"Magicbus",
	"Enyu_is_Pro",
	"Sub2Fer999",
	"Bluxxy",
	"JCWK",
	"fudd10_v2",
	"3BVISITS",
	"UPD16",
	"SUB2GAMERROBOT_EXP1",
	"StrawHatMaine",
	"Sub2OfficialNoobie",
	"FUDD10",
	"THEGREATACE",
	"Axiore",
	"SUB2NOOBMASTER123",
	"Sub2Daigrock",
	"TantaiGaming",
	"UPD15",
	"2BILLION",
	"XMASEXP",
	"UPDATE11",
	"UPD14",
}
local Sword_List = {
	"Saber",
	"Pole",
	"LegendarySword",
	"Rengoku",
	"Emma",
	"BuddySword",
	"MidnightBlade",
    "Spikey Trident",
    "Hallow Scythe",
    "Canvander",
    "Tushita",
    "Dark Dagger",
    "Yama",
    "Cursed Dual Katana",
    "Soul Guitar",
}


local Melee_List = {
	"Superhumand",
	"Electicclow",
	"DeathStep",
	"Sharkman Karate",
    "Dragon Talon",
    "Godhuman",
}


local DamaageText = {
	"4437.99",
	"4779.64",
	"5000.59",
	"5400.31",
	"6245.71",
	"7000.23",
	"8321.32",
	"9213.34",
	"10321.54",
}


function Checklevel(LEVEL)
	local Level = LocalPlayer.Data.Level.Value
	local less = math.huge
	if FirstSea and Level >= 700 then
		Level = 699
	elseif SecondSea and Level >= 1525 then
		Level = 1524
	elseif ThirdSea and Level >= 2550 then
		Level = 2549
	end

	for i,value in pairs(Quest) do
		for loop=1,#value do v = value[loop]
			if Level >= v.LevelReq and not v.MeetsRequirements then
				if v.Task[table.foreach(v.Task,tostring)] ~= 1 and Level - v.LevelReq < less then
					less = Level - v.LevelReq
					CurrentQuest = {
						Name = tostring(i),
						Value = tonumber(loop),
						Mob = (table.foreach(v.Task,tostring)),
					}
				end
			end
		end
	end
	for i,v in pairs(GuideModule.Data.NPCList) do
		if v.NPCName == GuideModule.Data.LastClosestNPC then
			CurrentQuest.Npc = CFrame.new(v.Position)
		end
	end

	return CurrentQuest
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
DMG.new = function(data)
	data.Value = DamaageText[math.random(1,#DamaageText)]
	return shared.dnew(data)
end


function Distance(POS)
	return LocalPlayer:DistanceFromCharacter(POS)
end
function totarget_spawn(CFgo,npc)
    local Dis = Distance(CFgo.Position)
    local Data = game:GetService("Players").LocalPlayer.Data
	local PlayerSpawns = game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates[npc].Part

    if not LocalPlayer.Character then return end
    if Dis < 1000 then
        Speed = 400
    elseif Dis >= 1000 then
        Speed = 350
    end

    getgenv().SpanwPass = false

    if Data.SpawnPoint.Value == npc and Data.LastSpawnPoint.Value == npc then
        getgenv().SpanwPass = true
    end
    if game.PlaceId == 4442272183 and Distance(PlayerSpawns.Position) < 3000 and Data.SpawnPoint.Value == npc and Data.LastSpawnPoint.Value == npc then
        getgenv().SpanwPass = true
    elseif game.PlaceId == 2753915549 and Distance(PlayerSpawns.Position) < 1500 and Data.SpawnPoint.Value == npc and Data.LastSpawnPoint.Value == npc then
        getgenv().SpanwPass = true
    elseif game.PlaceId == 7449423635 and Distance(PlayerSpawns.Position) < 4500 and Data.SpawnPoint.Value == npc and Data.LastSpawnPoint.Value == npc then
        getgenv().SpanwPass = true
    end

    if getgenv().SpanwPass == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,1000,0)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        repeat task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlayerSpawns.CFrame
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint",npc)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        until (Data.SpawnPoint.Value == npc and Data.LastSpawnPoint.Value == npc)
        getgenv().SpanwPass = true
    end

	
    if getgenv().SpanwPass then
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
function toTarget(targetCFrame)
	local tweenfunc = {}

	Distance = (targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
	if Distance < 1000 then
		Speed = 325
	elseif Distance >= 1000 then
		Speed = 315
	end

	local tween_s = game:service"TweenService"
	local info = TweenInfo.new((targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude/Speed, Enum.EasingStyle.Linear)
	local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
	tween:Play()

	function tweenfunc:Stop()
		tween:Cancel()
	end 

	if StatsBypass == "Bypassed" and UseTP then
		tween:Cancel()
		game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"].CFrame = targetCFrame
	end
	if not tween then return tween end
	return tweenfunc
end

function GetToolFromTip(Tip)
	if not LocalPlayer.Character then return end
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") and v.ToolTip == Tip then
			return v
		end
	end
	local v = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") do
		if v:IsA("Tool") and v.ToolTip == Tip then
			return v
		end
	end
end
function GetMobName()
	if LocalPlayer.PlayerGui.Main.Quest.Visible then
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
function GetAllMob()
	return Collection:GetTagged("ActiveRig")
end
function EquipWeapon(Tools)
	if not LocalPlayer.Character then return end
	if game.Players.LocalPlayer.Backpack:FindFirstChild(Tools) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Tools)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	elseif GetToolFromTip(Tools) then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(GetToolFromTip(Tools))
	end
end
isnetworkowner = function()
	return true
end
function BringMob(mob)
	local Mob = workspace.Enemies:GetChildren()
	for i,v in pairs(Mob) do
		if v.Name == mob.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
		    if isnetworkowner(v.HumanoidRootPart) then
				local CFrameTo = mob.HumanoidRootPart.CFrame
				v.HumanoidRootPart.CFrame = CFrameTo
				v.HumanoidRootPart.Size = Vector3.new(70,70,70)
				v.Humanoid.PlatformStand = true
				v.Humanoid.Sit = true					
				v.HumanoidRootPart.CanCollide = false
			end
		end
	end
end

local FileName = "BloxFruit" .. tostring(game.Players.LocalPlayer.Name) .. ".json"

getgenv().scripts = {
    ["Select Melee Weapons"] = "",
	["AutoFarmLevel"] = false,
	World = {
		["Dressrosa"] = true,
		["Zou"] = true,
	},
    Edition = {
        ["PlayerHunterQuest"] = false,
        ["Bartilo"] = false,
        ["Factory"] = false,
        ["Flower"] = false,
        ["Racev3"] = false,
    },
    Stats = {
        Enabled = true,
        Melee = 2550,
        Defense = 2550,
        Sword = 1275,
        Fruit = 1275,
    },
}

function loadcheck()
    if isfile(FileName) then
        g = readfile(FileName)
            return g
        else
            writefile(FileName,game:GetService("HttpService"):JSONEncode(scripts))
        return
    end
end
function LoadSetting()
    if isfile(FileName) then
            vb = game:GetService("HttpService"):JSONDecode(readfile(FileName))
            scripts = vb
                return vb
            
        else
            loadcheck()
        return
    end
end

function SaveSetting()
    if isfile(FileName) then
            f = writefile
            writefile(FileName,game:GetService("HttpService"):JSONEncode(scripts))
                return f
        else
            loadcheck()
        return
    end
end


loadcheck()
LoadSetting()


local win = AlphaLib:New({
	Name = "Lago Edition Scripts",
	FolderToSave = "Lago"
})
local tab = win:Tab("Main")
local Combats = win:Tab("Combats")
local Stats = win:Tab("Stats")
local Misc = win:Tab("Miscellaneous")
local teleport = win:Tab("Teleport")
local Settings = win:Tab("Configuration")

local Mains = tab:Section("Mains")
local MainTab = tab:Section("Main Travel")
local SecondTab = tab:Section("Dressrosa")

local Directs = Stats:Section("Stats")
local Setup_Stats = Stats:Section("Setup Stats")

local world_tp = teleport:Section("World Teleport Selection")
local island_tp = teleport:Section("Island Teleport Selection")
local npc_tp = teleport:Section("Npc Teleport Selection")

local Sword = Mains:MultiDropdown("Select Sword", Sword_List,Sword_List,"Dropdown", function(v)
	_G.Selects_Sword = v
end)
local Melee = Mains:Dropdown("Select Melee", Melee_List,scripts["Select Melee Weapons"],"Dropdown", function(t)
	scripts["Select Melee Weapons"] = t
	SaveSetting()
end)
Mains:Toggle("Auto Farm Level", scripts["AutoFarmLevel"],"Toggle", function(v)
	StartMain = v
	scripts["AutoFarmLevel"] = v
	SaveSetting()
end)
MainTab:Toggle("Dressrosa Quest", scripts.World["Dressrosa"],"Toggle", function(v)
	scripts.World["Dressrosa"] = v
	SaveSetting()
end)
MainTab:Toggle("Player Hunter Quest", scripts.Edition["PlayerHunterQuest"],"Toggle", function(v)
	scripts.Edition["PlayerHunterQuest"] = v
	SaveSetting()
end)
SecondTab:Toggle("Zou Quest", scripts.World["Zou"],"Toggle", function(v)
	scripts.World["Zou"] = v
	SaveSetting()
end)
SecondTab:Toggle("Factory", scripts.Edition["Factory"],"Toggle", function(v)
	scripts.Edition["Factory"] = v
	SaveSetting()
end)
SecondTab:Toggle("Bartilo Quest", scripts.Edition["Bartilo"],"Toggle", function(v)
	scripts.Edition["Bartilo"] = v
	SaveSetting()
end)
SecondTab:Toggle("Flower Quest", scripts.Edition["Flower"],"Toggle", function(v)
	scripts.Edition["Flower"] = v
	SaveSetting()
end)
SecondTab:Toggle("Race v3 Quest", scripts.Edition["Racev3"],"Toggle", function(v)
	scripts.Edition["Racev3"] = v
	SaveSetting()
end)


-- stats tab --

Directs:Toggle("Auto Stats", scripts.Stats["Enabled"],"Toggle", function(v)
    scripts.Stats["Enabled"] = v
    SaveSetting()
end)

Setup_Stats:Textbox("Melee", false, function(t)
	scripts.Stats["Melee"] = t
	SaveSetting()
end)
Setup_Stats:Textbox("Defense", false, function(t)
	scripts.Stats["Defense"] = t
	SaveSetting()
end)
Setup_Stats:Textbox("Sword", false, function(t)
	scripts.Stats["Sword"] = t
	SaveSetting()
end)
Setup_Stats:Textbox("Devil Fruit", false, function(t)
	scripts.Stats["Fruit"] = t
	SaveSetting()
end)

-- tp section --
world_tp:Button("Main", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end)
world_tp:Button("DressRosa", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end)
world_tp:Button("Zou", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end)

local IslandTable = {}
for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren()) do
    table.insert(IslandTable,v.Name)
end
island_tp:Dropdown("Select Island", IslandTable,"","Dropdown", function(t)
	selectisland = t
end)
island_tp:Toggle("TelePort", false,"Toggle", function(t)
	teleport_island = t
end)

npc_tp:Dropdown("Select Npc", quest_fordropdown,"","Dropdown", function(t)
	selectnpc = t
end)
npc_tp:Toggle("TelePort", false,"Toggle", function(t)
	teleport_npc = t
end)

spawn(function()
	while task.wait() do
		if scripts["AutoFarmLevel"] then
			local Q = Checklevel()
			if LocalPlayer.Data.Level.Value >= 1 and LocalPlayer.Data.Level.Value <= 10 then
				if not LocalPlayer.PlayerGui.Main.Quest.Visible then
					repeat task.wait()
						totarget_spawn(Q.Npc,"Default")
					until Distance(Q.Npc.Position) <= 120
					if Distance(Q.Npc.Position) <= 50 then
						local args = {
							[1] = "StartQuest",
							[2] = Q.Name,
							[3] = Q.Value
						}
					
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
						repeat wait() until LocalPlayer.PlayerGui.Main.Quest.Visible
					end
				elseif LocalPlayer.PlayerGui.Main.Quest.Visible then
					Q.Mob = GetMobName()
					for i,v in pairs(GetAllMob()) do
						if Q.Mob and v.Name:lower():sub(1,#Q.Mob) == Q.Mob:lower() and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then							
							repeat wait()
								BringMob(v)
								EquipWeapon("Melee")
								toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
								pcall(function()
                                    Rigc.activeController:attack()
                                end)
								v.HumanoidRootPart.CanCollide = false
								v.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
								delay(10,function()
									v.Humanoid.Health = 0
								end)
							until not scripts["AutoFarmLevel"] or v.Humanoid.Health <= 0 or not v.Parent or not LocalPlayer.PlayerGui.Main.Quest.Visible
						end
					end
				end
			elseif LocalPlayer.Data.Level.Value >= 10 and LocalPlayer.Data.Level.Value <= 120 then
				for i,v in pairs(workspace.Enemies:GetChildren()) do
					if v.Name == "Shanda [Lv. 475]" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then						
						repeat wait()
							BringMob(v)
							EquipWeapon("Melee")
							toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
							pcall(function()
								Rigc.activeController:attack()
							end)
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(70, 70, 70)
							delay(10,function()
								v.Humanoid.Health = 0
							end)
						until not scripts["AutoFarmLevel"] or v.Humanoid.Health <= 0 or not v.Parent
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7862, 5545, -381))
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if scripts["AutoFarmLevel"] then
			pcall(function()
				Rigc.activeController.timeToNextAttack = 0
				Rigc.activeController.hitboxMagnitude = 100
				Rigc.activeController.focusStart = 0
				Rigc.activeController.blocking = false
				Rigc.activeController.attacking = false
				Rigc.activeController.humanoid.AutoRotate = true
				Rigc.activeController.increment = Maxincrement()
				if Rigc.activeController.data then
					Rigc.activeController.data.attackStartCallback = function()end
				end
				Attack()
			end)
		end
	end
end)
spawn(function()
	while task.wait() do
		if scripts["AutoFarmLevel"] then
			pcall(function()
				Attack()
			end)
		end
	end
end)

spawn(function()
    while wait() do
		pcall(function()
			if sethiddenproperty then
				sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
			end
		end)
    end
end)

task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if scripts["AutoFarmLevel"] then
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
						if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
							game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
						end
						local BodyVelocity = Instance.new("BodyVelocity")
						BodyVelocity.Name = "BodyVelocity1"
						BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
						BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
						BodyVelocity.Velocity = Vector3.new(0, 0, 0)
					end
				end
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			else
				if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
				end
			end
		end)
	end)
end)
