--═══════════════════════════════════════════════════--
--  破晓  |  作者：影月
--═══════════════════════════════════════════════════--

if getgenv().PoxiaoLoaded then return end
getgenv().PoxiaoLoaded = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local function AddCorner(parent, radius)
    if parent:FindFirstChildOfClass("UICorner") then return parent:FindFirstChildOfClass("UICorner") end
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 6)
    corner.Parent = parent
    return corner
end

local function AddStroke(parent, color, thickness)
    if parent:FindFirstChildOfClass("UIStroke") then return parent:FindFirstChildOfClass("UIStroke") end
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Color3.fromRGB(150, 20, 20)
    stroke.Thickness = thickness or 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
    return stroke
end

local function Tween(obj, props, duration, easingStyle, easingDir)
    local info = TweenInfo.new(duration or 0.3, easingStyle or Enum.EasingStyle.Quad, easingDir or Enum.EasingDirection.Out)
    TweenService:Create(obj, info, props):Play()
end

local Conns = {}
local function AddConn(conn)
    table.insert(Conns, conn)
    return conn
end

local DefenseESPFolder = Instance.new("Folder")
DefenseESPFolder.Name = "PoxiaoDefenseESP"
DefenseESPFolder.Parent = PlayerGui

local success, WasUIPro = pcall(function()
    return loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
end)
if not success or not WasUIPro then
    warn("【破晓】WasUIPro 加载失败")
    return
end

WasUIPro:SetDefaultTheme("Dark")
WasUIPro:SetLanguage("中文")

local IntroGui = Instance.new("ScreenGui")
IntroGui.Name = "DawnIntro"
IntroGui.ResetOnSpawn = false
IntroGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
IntroGui.Parent = PlayerGui

local Blur = Instance.new("BlurEffect")
Blur.Size = 24
Blur.Parent = Lighting

local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.4
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 10
Overlay.Parent = IntroGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 220)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 11
MainFrame.Parent = IntroGui
AddCorner(MainFrame, 12)
AddStroke(MainFrame, Color3.fromRGB(150, 20, 20), 2)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -20, 0, 40)
TitleLabel.Position = UDim2.new(0, 10, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "☽ 破 晓 ☾"
TitleLabel.TextColor3 = Color3.fromRGB(220, 50, 50)
TitleLabel.TextSize = 28
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.ZIndex = 12
TitleLabel.Parent = MainFrame

local SubLabel = Instance.new("TextLabel")
SubLabel.Size = UDim2.new(1, -20, 0, 20)
SubLabel.Position = UDim2.new(0, 10, 0, 50)
SubLabel.BackgroundTransparency = 1
SubLabel.Text = "作者：影月 | 复古暗红控制台"
SubLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SubLabel.TextSize = 14
SubLabel.Font = Enum.Font.Gotham
SubLabel.ZIndex = 12
SubLabel.Parent = MainFrame

local DescLabel = Instance.new("TextLabel")
DescLabel.Size = UDim2.new(1, -40, 0, 60)
DescLabel.Position = UDim2.new(0, 20, 0, 80)
DescLabel.BackgroundTransparency = 1
DescLabel.Text = "此脚本用于辅助游戏体验，请遵守游戏规则。\n点击“确定进入”加载主菜单。"
DescLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
DescLabel.TextSize = 14
DescLabel.Font = Enum.Font.Gotham
DescLabel.TextWrapped = true
DescLabel.ZIndex = 12
DescLabel.Parent = MainFrame

local ConfirmBtn = Instance.new("TextButton")
ConfirmBtn.Size = UDim2.new(0, 120, 0, 36)
ConfirmBtn.Position = UDim2.new(0.5, -130, 1, -55)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
ConfirmBtn.Text = "确定进入"
ConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtn.TextSize = 14
ConfirmBtn.Font = Enum.Font.GothamBold
ConfirmBtn.ZIndex = 12
ConfirmBtn.Parent = MainFrame
AddCorner(ConfirmBtn, 6)

local CancelBtn = Instance.new("TextButton")
CancelBtn.Size = UDim2.new(0, 120, 0, 36)
CancelBtn.Position = UDim2.new(0.5, 10, 1, -55)
CancelBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CancelBtn.Text = "取消退出"
CancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CancelBtn.TextSize = 14
CancelBtn.Font = Enum.Font.GothamBold
CancelBtn.ZIndex = 12
CancelBtn.Parent = MainFrame
AddCorner(CancelBtn, 6)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
Tween(MainFrame, {Size = UDim2.new(0, 360, 0, 220), Position = UDim2.new(0.5, -180, 0.5, -110)}, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)local function ButtonHover(btn, baseColor, hoverColor)
    btn.MouseEnter:Connect(function() Tween(btn, {BackgroundColor3 = hoverColor}, 0.2) end)
    btn.MouseLeave:Connect(function() Tween(btn, {BackgroundColor3 = baseColor}, 0.2) end)
end
ButtonHover(ConfirmBtn, Color3.fromRGB(150,20,20), Color3.fromRGB(200,40,40))
ButtonHover(CancelBtn, Color3.fromRGB(60,60,60), Color3.fromRGB(90,90,90))

local IntroCompleted = false
local UserConfirmed = false

ConfirmBtn.MouseButton1Click:Connect(function()
    UserConfirmed = true
    IntroCompleted = true
    Tween(MainFrame, {Size = UDim2.new(0,0,0,0), Position = UDim2.new(0.5,0,0.5,0)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    task.wait(0.4)
    if Blur then Blur:Destroy() end
    IntroGui:Destroy()
    
    -- 启动动画
    local animGui = Instance.new("ScreenGui")
    animGui.Name = "WelcomeGui"
    animGui.ResetOnSpawn = false
    animGui.Parent = PlayerGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 400, 0, 60)
    textLabel.Position = UDim2.new(0.5, -200, 1, 50)
    textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "欢迎使用 破晓 脚本"
    textLabel.TextColor3 = Color3.fromRGB(255, 30, 30)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextTransparency = 1
    textLabel.Parent = animGui

    local textStroke = Instance.new("UIStroke", textLabel)
    textStroke.Color = Color3.fromRGB(0, 0, 0)
    textStroke.Thickness = 2

    local moveTween = TweenService:Create(textLabel, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -200, 0.5, 0), TextTransparency = 0})
    local fadeOutTween = TweenService:Create(textLabel, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1, Position = UDim2.new(0.5, -200, 0.3, 0)})

    task.wait(0.2)
    moveTween:Play()
    moveTween.Completed:Wait()
    task.wait(1)
    fadeOutTween:Play()
    fadeOutTween.Completed:Wait()
    animGui:Destroy()
end)

CancelBtn.MouseButton1Click:Connect(function()
    UserConfirmed = false
    IntroCompleted = true
    if Blur then Blur:Destroy() end
    IntroGui:Destroy()
    getgenv().PoxiaoLoaded = false
end)

while not IntroCompleted do task.wait() end
if not UserConfirmed then return end

local oldInstanceNew = Instance.new
local InstanceNewBackup = oldInstanceNew

local function HookedNew(class, parent)
    local obj = oldInstanceNew(class)
    if parent then obj.Parent = parent end
    if class == "Frame" or class == "TextButton" or class == "ImageButton" 
       or class == "TextLabel" or class == "ImageLabel" or class == "ScrollingFrame" then
        task.defer(function()
            if obj and obj.Parent then
                if not obj:FindFirstChildOfClass("UICorner") then
                    local corner = oldInstanceNew("UICorner")
                    corner.CornerRadius = UDim.new(0, 5)
                    corner.Parent = obj
                end
                if not obj:FindFirstChildOfClass("UIStroke") and class ~= "TextLabel" then
                    local stroke = oldInstanceNew("UIStroke")
                    stroke.Color = Color3.fromRGB(150, 20, 20)
                    stroke.Thickness = 1
                    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    stroke.Parent = obj
                end
            end
        end)
    end
    return obj
end
Instance.new = HookedNew

local mainWindow = WasUIPro:CreateWindow({
    Title = "破晓",
    WelcomeText = "作者：影月 | 复古暗红控制台",
    MinimizedText = "破晓",
    Theme = "Dark",
    RainbowMode = "流动",
    DialogTitle = "确认关闭窗口",
    SnowEnabled = false,
    Folder = "Poxiao_Config",
    FrameColor = { Color3.fromRGB(150, 20, 20), Color3.fromRGB(200, 40, 40) },
    FeatureNameColor = { Color3.fromRGB(255, 100, 100), Color3.fromRGB(200, 50, 50) }
})

task.delay(4, function() Instance.new = InstanceNewBackup end)

task.delay(2, function()
    local screenGui
    for _, sg in pairs(PlayerGui:GetChildren()) do
        if sg:IsA("ScreenGui") then screenGui = sg break end
    end
    if not screenGui then return end
    for _, v in pairs(screenGui:GetDescendants()) do
        if (v:IsA("TextButton") or v:IsA("ImageButton")) and v.AbsoluteSize.X <= 70 and v.AbsoluteSize.Y <= 70 then
            if v.Name:lower():match("min") or v.Name:lower():match("toggle") or v.Name:lower():match("show") then
                local dragging, dragInput, mousePos, framePos = false
                v.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true mousePos = input.Position framePos = v.Position
                        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
                    end
                end)
                v.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if input == dragInput and dragging then
                        local delta = input.Position - mousePos
                        v.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
                    end
                end)
            end
        end
    end
end)local WalkSpeedValue = 16
local JumpPowerValue = 50
local InfJump = false
local Noclip = false
local AimbotEnabled = false
local AimbotSmooth = 0.15
local AimbotPart = "Head"
local TeamCheck = true
local FOV = 200

local function GetHumanoid(char) return char and char:FindFirstChildOfClass("Humanoid") end

local tabAnnounce = mainWindow:Tab({ Title = "公告" })
local catAnnounce = tabAnnounce:Category({ Title = "开发日志", IconName = "scroll-text" })

local logPara = catAnnounce:Paragraph({ Title = "系统公告", Desc = "", Icon = "file-text" })
local fullLog = "欢迎使用【破晓】脚本系统 v1.0\n作者：影月\n\n本次更新内容：\n- 全面重构 UI，采用复古暗红美学设计\n- 引入打字机特效与呼吸灯状态指示\n- 新增完整的移动、战斗与视觉模块\n- 支持 Build A Boat 自动刷钱与家园守护模式\n- 所有界面元素已执行全局圆角化与描边处理\n\n本工具仅供学习交流，请合理使用。"

task.spawn(function()
    if logPara and logPara.SetContent then
        for i = 1, #fullLog do
            if not logPara or not logPara.ContentLabel then break end
            logPara:SetContent(fullLog:sub(1, i))
            task.wait(0.04)
        end
    end
end)

local statusPara = catAnnounce:Paragraph({ Title = "● 系统在线", Desc = "服务器连接正常", Icon = "activity" })
task.spawn(function()
    while statusPara and statusPara.TitleLabel and statusPara.TitleLabel.Parent do
        Tween(statusPara.TitleLabel, {TextColor3 = Color3.fromRGB(50, 255, 50)}, 1)
        task.wait(1.2)
        if not statusPara or not statusPara.TitleLabel or not statusPara.TitleLabel.Parent then break end
        Tween(statusPara.TitleLabel, {TextColor3 = Color3.fromRGB(20, 80, 20)}, 1)
        task.wait(1.2)
    end
end)

local tabBasic = mainWindow:Tab({ Title = "基础功能" })
local catBasic = tabBasic:Category({ Title = "角色属性", IconName = "user" })

catBasic:Slider({ Title = "移动速度", Min = 16, Max = 300, Default = 16, Step = 1, Callback = function(v) WalkSpeedValue = v local hum = GetHumanoid(LocalPlayer.Character) if hum then hum.WalkSpeed = v end end })
catBasic:Slider({ Title = "跳跃力", Min = 50, Max = 200, Default = 50, Step = 1, Callback = function(v) JumpPowerValue = v local hum = GetHumanoid(LocalPlayer.Character) if hum then hum.JumpPower = v end end })
catBasic:Toggle({ Title = "无限跳", Value = false, Callback = function(state) InfJump = state end })
catBasic:Toggle({ Title = "穿墙", Value = false, Callback = function(state) Noclip = state end })

AddConn(UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Space and InfJump then
        local hum = GetHumanoid(LocalPlayer.Character)
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end))

AddConn(RunService.Stepped:Connect(function()
    if Noclip then
        local char = LocalPlayer.Character
        if char then for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end
    end
end))

AddConn(LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local hum = GetHumanoid(char)
    if hum then hum.WalkSpeed = WalkSpeedValue hum.JumpPower = JumpPowerValue end
end))

local tabCombat = mainWindow:Tab({ Title = "战斗/自瞄" })
local catCombat = tabCombat:Category({ Title = "自瞄设置", IconName = "crosshair" })

catCombat:Toggle({ Title = "启用自瞄", Value = false, Callback = function(state) AimbotEnabled = state end })
catCombat:Slider({ Title = "平滑度", Min = 1, Max = 100, Default = 15, Step = 1, Callback = function(v) AimbotSmooth = v / 100 end })
catCombat:Toggle({ Title = "队伍检测", Value = true, Callback = function(state) TeamCheck = state end })
catCombat:Dropdown({ Title = "瞄准部位", Values = {"Head", "Torso", "HumanoidRootPart"}, Value = "Head", Multi = false, Callback = function(selected) AimbotPart = selected end })

local function GetClosestPlayer()
    local closest, minDist = nil, FOV
    local mousePos = UserInputService:GetMouseLocation()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local skip = false
            if TeamCheck and plr.Team == LocalPlayer.Team then skip = true end
            if not skip then
                local part = plr.Character:FindFirstChild(AimbotPart)
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                        if dist < minDist then minDist = dist closest = part end
                    end
                end
            end
        end
    end
    return closest
end

AddConn(RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local target = GetClosestPlayer()
        if target then
            local pos = Camera:WorldToViewportPoint(target.Position)
            local mouse = UserInputService:GetMouseLocation()
            local moveVec = (Vector2.new(pos.X, pos.Y) - mouse) * AimbotSmooth
            if mousemoverel then mousemoverel(moveVec.X, moveVec.Y) end
        end
    end
end))local ESPEnabled = false
local ESPBoxes = true
local ESPNames = true
local ESPDistance = true
local ESPColor = Color3.fromRGB(150, 20, 20)

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "PoxiaoESP"
ESPFolder.Parent = PlayerGui

local tabVisual = mainWindow:Tab({ Title = "视觉/透视" })
local catVisual = tabVisual:Category({ Title = "ESP 设置", IconName = "eye" })

catVisual:Toggle({ Title = "启用 ESP", Value = false, Callback = function(state)
    ESPEnabled = state
    if not state then for _, obj in pairs(ESPFolder:GetChildren()) do obj:Destroy() end end
end })
catVisual:Toggle({ Title = "显示方框", Value = true, Callback = function(state) ESPBoxes = state end })
catVisual:Toggle({ Title = "显示名字", Value = true, Callback = function(state) ESPNames = state end })
catVisual:Toggle({ Title = "显示距离", Value = true, Callback = function(state) ESPDistance = state end })

local function CreatePlayerESP(plr)
    local bb = Instance.new("BillboardGui")
    bb.Name = plr.Name .. "_ESP" bb.AlwaysOnTop = true bb.Size = UDim2.new(0, 200, 0, 60) bb.StudsOffset = Vector3.new(0, 3, 0) bb.Parent = ESPFolder
    local box = Instance.new("Frame") box.Name = "Box" box.Size = UDim2.new(0, 40, 0, 60) box.Position = UDim2.new(0.5, -20, 0.5, -30) box.BackgroundTransparency = 0.85 box.BackgroundColor3 = ESPColor box.BorderSizePixel = 0 box.Parent = bb AddCorner(box, 2)
    local nameLbl = Instance.new("TextLabel") nameLbl.Name = "Name" nameLbl.Size = UDim2.new(1, 0, 0, 14) nameLbl.Position = UDim2.new(0, 0, 0, -16) nameLbl.BackgroundTransparency = 1 nameLbl.TextColor3 = ESPColor nameLbl.TextStrokeTransparency = 0.5 nameLbl.TextSize = 12 nameLbl.Font = Enum.Font.GothamBold nameLbl.Parent = bb
    local distLbl = Instance.new("TextLabel") distLbl.Name = "Dist" distLbl.Size = UDim2.new(1, 0, 0, 14) distLbl.Position = UDim2.new(0, 0, 0, 46) distLbl.BackgroundTransparency = 1 distLbl.TextColor3 = Color3.fromRGB(255, 255, 255) distLbl.TextStrokeTransparency = 0.5 distLbl.TextSize = 10 distLbl.Font = Enum.Font.Gotham distLbl.Parent = bb
    return bb
end

AddConn(RunService.RenderStepped:Connect(function()
    if not ESPEnabled then for _, v in pairs(ESPFolder:GetChildren()) do v.Enabled = false end return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart
            local esp = ESPFolder:FindFirstChild(plr.Name .. "_ESP")
            if not esp then esp = CreatePlayerESP(plr) end
            esp.Enabled = true esp.Adornee = hrp
            local box, nameLbl, distLbl = esp:FindFirstChild("Box"), esp:FindFirstChild("Name"), esp:FindFirstChild("Dist")
            if box then box.Visible = ESPBoxes box.BackgroundColor3 = ESPColor end
            if nameLbl then nameLbl.Visible = ESPNames nameLbl.Text = plr.Name end
            if distLbl then distLbl.Visible = ESPDistance distLbl.Text = tostring(math.floor((hrp.Position - Camera.CFrame.Position).Magnitude)) .. "m" end
        else
            local esp = ESPFolder:FindFirstChild(plr.Name .. "_ESP")
            if esp then esp.Enabled = false end
        end
    end
end))

local tabMisc = mainWindow:Tab({ Title = "杂项" })
local catMisc = tabMisc:Category({ Title = "辅助功能", IconName = "settings" })

catMisc:Button({ Text = "Anti-AFK", Icon = "clock", Callback = function()
    local vu = game:GetService("VirtualUser")
    AddConn(LocalPlayer.Idled:Connect(function() vu:CaptureController() vu:ClickButton2(Vector2.new()) end))
    WasUIPro:Notify({ Title = "Anti-AFK", Content = "已启用", Duration = 2 })
end })
catMisc:Button({ Text = "一键满血", Icon = "heart", Callback = function() local hum = GetHumanoid(LocalPlayer.Character) if hum then hum.Health = hum.MaxHealth end end })
catMisc:Toggle({ Title = "夜视", Value = false, Callback = function(state)
    if state then Lighting.Brightness = 10 Lighting.GlobalShadows = false Lighting.ClockTime = 14 else Lighting.Brightness = 2 Lighting.GlobalShadows = true end
end })

local tabUI = mainWindow:Tab({ Title = "UI设置" })
local catUI = tabUI:Category({ Title = "界面控制", IconName = "monitor" })
catUI:Button({ Text = "销毁脚本 UI", Icon = "x-circle", Callback = function()
    for _, c in pairs(Conns) do pcall(function() c:Disconnect() end) end
    if ESPFolder then ESPFolder:Destroy() end if DefenseESPFolder then DefenseESPFolder:Destroy() end
    if mainWindow and mainWindow.Destroy then mainWindow:Destroy() end
    getgenv().PoxiaoLoaded = false
end })
catUI:Paragraph({ Title = "快捷键", Desc = "F1 显示/隐藏窗口", Icon = "keyboard" })local AutoFarmBoat = false
local AutoMoveEnd = false
local AutoSitDriver = false
local ZombieESPEnabled = false
local BossESPEnabled = false
local WeaponBoxESPEnabled = false

local tabBoat = mainWindow:Tab({ Title = "造船寻宝" })
local catBoat = tabBoat:Category({ Title = "Build A Boat", IconName = "ship" })

catBoat:Toggle({ Title = "自动刷钱 (拾取金币)", Value = false, Callback = function(state) AutoFarmBoat = state end })
catBoat:Toggle({ Title = "自动前往终点", Value = false, Callback = function(state) AutoMoveEnd = state end })
catBoat:Toggle({ Title = "自动驾驶", Value = false, Callback = function(state) AutoSitDriver = state end })

AddConn(RunService.Heartbeat:Connect(function()
    if AutoFarmBoat then
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name:lower():match("gold") or obj.Name:lower():match("coin") or obj.Name:lower():match("money")) then
                if (obj.Position - hrp.Position).Magnitude < 120 then pcall(function() firetouchinterest(hrp, obj, 0) firetouchinterest(hrp, obj, 1) end) end
            end
        end
    end
    if AutoMoveEnd then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp, target = char.HumanoidRootPart, nil
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name:lower():match("treasure") or obj.Name:lower():match("end") or obj.Name:lower():match("chest")) then if obj.Size.Magnitude > 10 then target = obj break end end
            end
            if target then local hum = GetHumanoid(char) if hum then hum:MoveTo(target.Position) end end
        end
    end
    if AutoSitDriver then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            if hum.SeatPart == nil then
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("VehicleSeat") or obj:IsA("Seat") then
                        if obj.Name:lower():match("drive") or obj.Name:lower():match("pilot") or obj.Name:lower():match("seat") then
                            if (obj.Position - char.HumanoidRootPart.Position).Magnitude < 50 then obj:Sit(hum) break end
                        end
                    end
                end
            end
        end
    end
end))

local tabDefense = mainWindow:Tab({ Title = "家园守护" })
local catDefense = tabDefense:Category({ Title = "怪物与物资透视", IconName = "shield" })

catDefense:Toggle({ Title = "透视僵尸", Value = false, Callback = function(state) ZombieESPEnabled = state end })
catDefense:Toggle({ Title = "透视 Boss", Value = false, Callback = function(state) BossESPEnabled = state end })
catDefense:Toggle({ Title = "透视武器箱", Value = false, Callback = function(state) WeaponBoxESPEnabled = state end })

local function CreateDefenseESP(target, labelText, color)
    if not target or DefenseESPFolder:FindFirstChild(tostring(target) .. "_" .. labelText) then return end
    local bb = Instance.new("BillboardGui")
    bb.Name = tostring(target) .. "_" .. labelText bb.AlwaysOnTop = true bb.Size = UDim2.new(0, 120, 0, 40) bb.StudsOffset = Vector3.new(0, 2, 0) bb.Parent = DefenseESPFolder
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0) label.BackgroundTransparency = 1 label.Text = labelText label.TextColor3 = color label.TextStrokeTransparency = 0.3 label.TextSize = 14 label.Font = Enum.Font.GothamBold label.Parent = bb
    bb.Adornee = target return bb
end

AddConn(RunService.RenderStepped:Connect(function()
    for _, v in pairs(DefenseESPFolder:GetChildren()) do
        if v:IsA("BillboardGui") and (not v.Adornee or not v.Adornee.Parent) then v:Destroy() end
    end
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") then
            local name = obj.Name:lower()
            if ZombieESPEnabled and (name:match("zombie") or name:match("monster") or name:match("enemy") or name:match("mutant")) then
                local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso") or obj:FindFirstChild("Head") or obj
                CreateDefenseESP(hrp, "[僵尸]", Color3.fromRGB(255, 0, 0))
            end
            if BossESPEnabled and (name:match("boss") or name:match("king") or name:match("giant")) then
                local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso") or obj:FindFirstChild("Head") or obj
                CreateDefenseESP(hrp, "[BOSS]", Color3.fromRGB(255, 0, 255))
            end
            if WeaponBoxESPEnabled and (name:match("weapon") or name:match("gun") or name:match("crate") or name:match("box") or name:match("chest")) then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                CreateDefenseESP(part, "[武器箱]", Color3.fromRGB(0, 255, 255))
            end
        end
    end
end))

print("【破晓】所有模块加载完成 | 作者：影月")
WasUIPro:Notify({ Title = "破晓", Content = "脚本已加载 | 作者：影月", Duration = 4 })

local isVisible = true
AddConn(UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        isVisible = not isVisible
        mainWindow:SetVisible(isVisible)
    end
end))
