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

local success, WasUIPro = pcall(function()
    return loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
end)
if not success or not WasUIPro then
    warn("【破晓】加载失败，请检查网络或加速器")
    getgenv().PoxiaoLoaded = false
    return
end
WasUIPro:SetDefaultTheme("Dark")
WasUIPro:SetLanguage("中文")

-- 弹窗 UI
local IntroGui = Instance.new("ScreenGui")
IntroGui.Name = "DawnIntro"
IntroGui.ResetOnSpawn = false
IntroGui.IgnoreGuiInset = true -- 解决手机偏移问题
IntroGui.DisplayOrder = 999
IntroGui.Parent = PlayerGui

local Blur = Instance.new("BlurEffect")
Blur.Size = 20
Blur.Parent = Lighting

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5) -- 强制居中
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Parent = IntroGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(180, 30, 30)

local title = Instance.new("TextLabel", MainFrame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "☽ 破 晓 ☾"
title.TextColor3 = Color3.fromRGB(255, 60, 60)
title.Font = Enum.Font.GothamBold
title.TextSize = 28

local sub = Instance.new("TextLabel", MainFrame)
sub.Size = UDim2.new(1, 0, 0, 20)
sub.Position = UDim2.new(0, 0, 0, 50)
sub.BackgroundTransparency = 1
sub.Text = "作者：影月"
sub.TextColor3 = Color3.fromRGB(180, 180, 180)
sub.Font = Enum.Font.Gotham
sub.TextSize = 14

local btnYes = Instance.new("TextButton", MainFrame)
btnYes.Size = UDim2.new(0, 120, 0, 36)
btnYes.Position = UDim2.new(0.5, -130, 1, -60)
btnYes.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
btnYes.Text = "确定进入"
btnYes.TextColor3 = Color3.fromRGB(255, 255, 255)
btnYes.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnYes).CornerRadius = UDim.new(0, 6)

local btnNo = Instance.new("TextButton", MainFrame)
btnNo.Size = UDim2.new(0, 120, 0, 36)
btnNo.Position = UDim2.new(0.5, 10, 1, -60)
btnNo.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
btnNo.Text = "取消退出"
btnNo.TextColor3 = Color3.fromRGB(255, 255, 255)
btnNo.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnNo).CornerRadius = UDim.new(0, 6)

MainFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 320, 0, 180)}):Play()

btnNo.MouseButton1Click:Connect(function()
    Blur:Destroy()
    IntroGui:Destroy()
    getgenv().PoxiaoLoaded = false
end)

btnYes.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0,0,0,0)}):Play()
    task.wait(0.3)
    Blur:Destroy()
    IntroGui:Destroy()

    -- 启动动画特效
    local animGui = Instance.new("ScreenGui")
    animGui.Name = "WelcomeGui"
    animGui.IgnoreGuiInset = true
    animGui.Parent = PlayerGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 400, 0, 80)
    textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "破 晓"
    textLabel.TextColor3 = Color3.fromRGB(255, 30, 30)
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.TextSize = 40
    textLabel.TextTransparency = 1
    textLabel.Parent = animGui

    local glow = Instance.new("UIStroke", textLabel)
    glow.Color = Color3.fromRGB(255, 100, 100)
    glow.Thickness = 5
    glow.Transparency = 1

    local subText = Instance.new("TextLabel")
    subText.Size = UDim2.new(0, 400, 0, 30)
    subText.Position = UDim2.new(0.5, 0, 0.5, 50)
    subText.AnchorPoint = Vector2.new(0.5, 0.5)
    subText.BackgroundTransparency = 1
    subText.Text = "作者：影月"
    subText.TextColor3 = Color3.fromRGB(200, 200, 200)
    subText.Font = Enum.Font.Gotham
    subText.TextSize = 18
    subText.TextTransparency = 1
    subText.Parent = animGui

    local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(textLabel, tweenInfo, {TextTransparency = 0, TextSize = 60}):Play()
    TweenService:Create(glow, tweenInfo, {Transparency = 0}):Play()
    task.wait(0.4)
    TweenService:Create(subText, tweenInfo, {TextTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 70)}):Play()

    task.wait(1.2)
    local fadeOut = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(textLabel, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(glow, fadeOut, {Transparency = 1}):Play()
    TweenService:Create(subText, fadeOut, {TextTransparency = 1}):Play()
    task.wait(0.6)
    animGui:Destroy()

    -- 创建主窗口（带蓝白剑客背景）
    local mainWindow = WasUIPro:CreateWindow({
        Title = "破晓",
        WelcomeText = "作者：影月",
        MinimizedText = "破晓",
        Theme = "Dark",
        Folder = "Poxiao_Config",
        Background = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        BackgroundImageTransparency = 0.6,
        FeatureNameColor = {Color3.fromRGB(255, 100, 100), Color3.fromRGB(200, 50, 50)}
    })

    -- 【注意】下面是第二段和第三段的代码插入点
    -- 把第二段和第三段直接拼在这下面！-- 1. 造船寻宝
local tabBoat = mainWindow:Tab({ Title = "造船寻宝" })
local catBoat = tabBoat:Category({ Title = "造船寻宝功能", IconName = "ship" })
local autoFarm = false
catBoat:Toggle({ Title = "自动刷钱 (拾取金币)", Value = false, Callback = function(s) autoFarm = s end })
RunService.Heartbeat:Connect(function()
    if autoFarm and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name:lower():match("gold") or obj.Name:lower():match("coin")) then
                if (obj.Position - hrp.Position).Magnitude < 120 then
                    pcall(function() firetouchinterest(hrp, obj, 0) firetouchinterest(hrp, obj, 1) end)
                end
            end
        end
    end
end)

-- 2. 保护房子
local tabDefense = mainWindow:Tab({ Title = "保护房子" })
local catDefense = tabDefense:Category({ Title = "保护房子功能", IconName = "shield" })
local zombieESP, bossESP = false, false
catDefense:Toggle({ Title = "透视怪物 / 僵尸", Value = false, Callback = function(s) zombieESP = s end })
catDefense:Toggle({ Title = "透视 Boss", Value = false, Callback = function(s) bossESP = s end })

local ESPFolder = Instance.new("Folder", PlayerGui)
RunService.RenderStepped:Connect(function()
    if not zombieESP and not bossESP then
        for _, v in pairs(ESPFolder:GetChildren()) do v:Destroy() end
        return
    end
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local n = obj.Name:lower()
            local isTarget = (zombieESP and n:match("zombie")) or (bossESP and n:match("boss"))
            if isTarget and not ESPFolder:FindFirstChild(obj.Name) then
                local hrp = obj:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local bb = Instance.new("BillboardGui", ESPFolder)
                    bb.Name = obj.Name bb.Adornee = hrp bb.AlwaysOnTop = true bb.Size = UDim2.new(0,100,0,30)
                    local tl = Instance.new("TextLabel", bb)
                    tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1
                    tl.Text = obj.Name tl.TextColor3 = bossESP and Color3.fromRGB(255,0,255) or Color3.fromRGB(255,0,0)
                    tl.TextScaled = true
                end
            end
        end
    end
end)    -- 3. 公告
    local tabAnnounce = mainWindow:Tab({ Title = "公告" })
    local catAnnounce = tabAnnounce:Category({ Title = "开发日志", IconName = "scroll-text" })
    catAnnounce:Paragraph({ Title = "系统公告", Desc = "欢迎使用【破晓】\n作者：影月\n\n支持：造船寻宝、保护房子、常规功能。", Icon = "file-text" })

    -- 4. 基础功能
    local tabBasic = mainWindow:Tab({ Title = "基础功能" })
    local catBasic = tabBasic:Category({ Title = "角色属性", IconName = "user" })
    catBasic:Slider({ Title = "移动速度", Min = 16, Max = 300, Default = 16, Callback = function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = v end end })
    catBasic:Slider({ Title = "跳跃力", Min = 50, Max = 200, Default = 50, Callback = function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = v end end })
    
    local InfJump = false
    catBasic:Toggle({ Title = "无限跳", Value = false, Callback = function(s) InfJump = s end })
    UserInputService.InputBegan:Connect(function(i, g) if not g and i.KeyCode == Enum.KeyCode.Space and InfJump then if LocalPlayer.Character then LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end end)

    -- 5. 战斗/自瞄
    local tabCombat = mainWindow:Tab({ Title = "战斗/自瞄" })
    local catCombat = tabCombat:Category({ Title = "自瞄设置", IconName = "crosshair" })
    local aimOn, aimSmooth = false, 0.15
    catCombat:Toggle({ Title = "启用自瞄", Value = false, Callback = function(s) aimOn = s end })
    catCombat:Slider({ Title = "平滑度", Min = 1, Max = 100, Default = 15, Callback = function(v) aimSmooth = v / 100 end })
    
    RunService.RenderStepped:Connect(function()
        if aimOn and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local closest, dist = nil, 200
            local mouse = UserInputService:GetMouseLocation()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                    local pos, on = Camera:WorldToViewportPoint(p.Character.Head.Position)
                    if on then
                        local d = (Vector2.new(pos.X, pos.Y) - mouse).Magnitude
                        if d < dist then dist = d closest = p.Character.Head end
                    end
                end
            end
            if closest and mousemoverel then
                local pos = Camera:WorldToViewportPoint(closest.Position)
                mousemoverel((pos.X - mouse.X)*aimSmooth, (pos.Y - mouse.Y)*aimSmooth)
            end
        end
    end)

    -- 6. 特效与配置
    local tabUI = mainWindow:Tab({ Title = "特效与配置" })
    local catUI = tabUI:Category({ Title = "菜单背景与特效", IconName = "settings" })
    
    catUI:Dropdown({
        Title = "切换菜单背景图",
        Values = { "蓝白剑客", "水墨武士", "六花" },
        Value = "蓝白剑客",
        Multi = false,
        Callback = function(selected)
            local imgUrl = ""
            if selected == "蓝白剑客" then
                imgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"
            elseif selected == "水墨武士" then
                imgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg"
            elseif selected == "六花" then
                imgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg"
            end
            pcall(function()
                for _, v in pairs(PlayerGui:GetDescendants()) do
                    if v:IsA("ImageLabel") and v.Name:lower():match("background") then
                        v.Image = imgUrl
                    end
                end
            end)
            WasUIPro:Notify({ Title = "背景已切换", Content = "当前背景：" .. selected, Duration = 2 })
        end
    })

    catUI:Slider({
        Title = "背景图片透明度",
        Min = 0, Max = 100, Default = 40, Step = 1,
        Callback = function(value)
            pcall(function()
                for _, v in pairs(PlayerGui:GetDescendants()) do
                    if v:IsA("ImageLabel") and v.Name:lower():match("background") then
                        v.ImageTransparency = value / 100
                    end
                end
            end)
        end
    })

    local rainbowBorderConn = nil
    catUI:Toggle({
        Title = "开启彩虹流光边框",
        Value = false,
        Callback = function(state)
            if state then
                if rainbowBorderConn then rainbowBorderConn:Disconnect() end
                rainbowBorderConn = RunService.RenderStepped:Connect(function()
                    local hue = tick() % 5 / 5
                    local color = Color3.fromHSV(hue, 1, 1)
                    pcall(function()
                        for _, v in pairs(PlayerGui:GetDescendants()) do
                            if v:IsA("UIStroke") and v.Thickness >= 1 then
                                v.Color = color
                            end
                        end
                    end)
                end)
            else
                if rainbowBorderConn then rainbowBorderConn:Disconnect() rainbowBorderConn = nil end
            end
        end
    })

    catUI:Button({ Text = "彻底销毁脚本 UI", Icon = "x-circle", Callback = function() if mainWindow then mainWindow:Destroy() end end })

    WasUIPro:Notify({ Title = "破晓", Content = "加载成功 | 作者：影月", Duration = 4 })
end)
