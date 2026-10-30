--═══════════════════════════════════════════════════--
-- 破晓 | 作者：影月 | 手机完美适配版 1/4
--═══════════════════════════════════════════════════--
if getgenv().PoxiaoLoaded then return end
getgenv().PoxiaoLoaded = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 【1. 绝对居中 + 赛博霓虹启动动画】
local animGui = Instance.new("ScreenGui", PlayerGui)
animGui.IgnoreGuiInset = true -- 无视手机状态栏偏移
animGui.DisplayOrder = 999

-- 全屏黑底
local bgBlack = Instance.new("Frame", animGui)
bgBlack.Size = UDim2.new(1, 0, 1, 0)
bgBlack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgBlack.BackgroundTransparency = 1
TweenService:Create(bgBlack, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()

-- 居中发光文字
local animText = Instance.new("TextLabel", animGui)
animText.Size = UDim2.new(0, 400, 0, 100)
animText.Position = UDim2.fromScale(0.5, 0.5)
animText.AnchorPoint = Vector2.new(0.5, 0.5)
animText.BackgroundTransparency = 1
animText.Text = "破 晓"
animText.TextColor3 = Color3.fromRGB(255, 50, 50)
animText.Font = Enum.Font.GothamBlack
animText.TextSize = 60
animText.TextTransparency = 1

-- 霓虹光晕
local glow = Instance.new("UIStroke", animText)
glow.Color = Color3.fromRGB(255, 50, 50)
glow.Thickness = 5
glow.Transparency = 1

-- 霓虹展开动画
TweenService:Create(animText, TweenInfo.new(0.6, Enum.EasingStyle.Back), {TextTransparency = 0}):Play()
TweenService:Create(glow, TweenInfo.new(0.6), {Transparency = 0.2}):Play()
task.wait(0.8)

-- 呼吸闪烁特效
for i = 1, 3 do
    TweenService:Create(animText, TweenInfo.new(0.2), {TextSize = 70, TextTransparency = 0.2}):Play()
    TweenService:Create(glow, TweenInfo.new(0.2), {Thickness = 10}):Play()
    task.wait(0.2)
    TweenService:Create(animText, TweenInfo.new(0.2), {TextSize = 60, TextTransparency = 0}):Play()
    TweenService:Create(glow, TweenInfo.new(0.2), {Thickness = 5}):Play()
    task.wait(0.2)
end
task.wait(0.5)

-- 全屏淡出
TweenService:Create(bgBlack, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(animText, TweenInfo.new(0.4), {TextTransparency = 1, TextSize = 100}):Play()
TweenService:Create(glow, TweenInfo.new(0.4), {Transparency = 1}):Play()
task.wait(0.5)
animGui:Destroy()

-- 【2. 绝对居中公告框】
local noticeGui = Instance.new("ScreenGui", PlayerGui)
noticeGui.IgnoreGuiInset = true
noticeGui.DisplayOrder = 999
local noticeFrame = Instance.new("Frame", noticeGui)
noticeFrame.Size = UDim2.new(0, 380, 0, 260)
noticeFrame.Position = UDim2.fromScale(0.5, 0.5)
noticeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
noticeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", noticeFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", noticeFrame).Color = Color3.fromRGB(200, 50, 50)

local titleBg = Instance.new("TextLabel", noticeFrame)
titleBg.Size = UDim2.new(1, 0, 0, 45)
titleBg.BackgroundTransparency = 1
titleBg.Text = "⚠️ 破晓系统公告 ⚠️"
titleBg.TextColor3 = Color3.fromRGB(255, 50, 50)
titleBg.Font = Enum.Font.GothamBold
titleBg.TextSize = 22

local descText = Instance.new("TextLabel", noticeFrame)
descText.Size = UDim2.new(1, -30, 0, 120)
descText.Position = UDim2.new(0, 15, 0, 50)
descText.BackgroundTransparency = 1
descText.Text = "【严正声明】\n本脚本由 影月 制作，永久免费！\n如果你是通过付费购买的，那么你被骗了！\n严禁倒卖、圈钱！\n\n【版本更新】\n1. 手机端绝对居中，全新霓虹特效。\n2. 满血原版造船 / 保护房子。\n3. 移除了手机无法按的 F1 键。"
descText.TextColor3 = Color3.fromRGB(220, 220, 220)
descText.Font = Enum.Font.Gotham
descText.TextSize = 14
descText.TextXAlignment = Enum.TextXAlignment.Left
descText.TextYAlignment = Enum.TextYAlignment.Top

local confirmBtn = Instance.new("TextButton", noticeFrame)
confirmBtn.Size = UDim2.new(0, 220, 0, 40)
confirmBtn.Position = UDim2.new(0.5, 0, 1, -50)
confirmBtn.AnchorPoint = Vector2.new(0.5, 0)
confirmBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
confirmBtn.Text = "确定进入"
confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)confirmBtn.MouseButton1Click:Connect(function()
    noticeGui:Destroy()
    
    -- 【3. 进度条】
    local loadingGui = Instance.new("ScreenGui", PlayerGui)
    loadingGui.IgnoreGuiInset = true
    local loadBox = Instance.new("Frame", loadingGui)
    loadBox.Size = UDim2.new(0, 220, 0, 60)
    loadBox.Position = UDim2.new(1, -240, 1, -80)
    loadBox.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new("UICorner", loadBox).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", loadBox).Color = Color3.fromRGB(0, 255, 255)
    
    local loadLabel = Instance.new("TextLabel", loadBox)
    loadLabel.Size = UDim2.new(1, 0, 0, 25)
    loadLabel.Position = UDim2.new(0, 0, 0, 10)
    loadLabel.BackgroundTransparency = 1
    loadLabel.Text = "加载核心: 0%"
    loadLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadLabel.Font = Enum.Font.Code
    loadLabel.TextSize = 14
    
    local barBg = Instance.new("Frame", loadBox)
    barBg.Size = UDim2.new(0.9, 0, 0, 8)
    barBg.Position = UDim2.new(0.05, 0, 0, 35)
    barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
    
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

    for _, pct in ipairs({30, 70, 100}) do
        loadLabel.Text = "加载核心: " .. pct .. "%"
        TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(pct / 100, 0, 1, 0)}):Play()
        task.wait(0.3)
    end
    loadLabel.Text = "✅ 加载成功！"
    task.wait(0.4)
    loadingGui:Destroy()

    -- 【4. 引入 WasUIPro】
    local WasUIPro = loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
    WasUIPro:SetDefaultTheme("Dark")
    WasUIPro:SetDefaultRainbowMode("流动")
    WasUIPro:SetLanguage("中文") 

    getgenv().MainWindow = WasUIPro:CreateWindow({
        Title = "破晓 | 影月",
        WelcomeText = "手机完美适配版",
        MinimizedText = "破晓",
        Theme = "Dark",
        RainbowMode = "流动",
        DialogTitle = "确认关闭窗口",
        SnowEnabled = true,
        Folder = "Poxiao_Config",
        TitleTag = {
            { text = "影月", backgroundColor = Color3.fromRGB(200, 50, 50), textColor = Color3.fromRGB(255,255,255) }
        },
        FeatureNameColor = {Color3.fromRGB(255, 100, 100), Color3.fromRGB(200, 50, 50)}
    })

    task.wait(0.5)

    local tabGeneral = getgenv().MainWindow:Tab({ Title = "通用功能" })
    local catGeneral = tabGeneral:Category({ Title = "移动与战斗", IconName = "user" })

    local tabBoat = getgenv().MainWindow:Tab({ Title = "造船寻宝" })
    local catBoat = tabBoat:Category({ Title = "自动刷钱", IconName = "anchor" })

    local tabDefense = getgenv().MainWindow:Tab({ Title = "保护房子" })
    local catDefense = tabDefense:Category({ Title = "怪物透视", IconName = "shield" })

    local tabSettings = getgenv().MainWindow:Tab({ Title = "特效配置" })
    local catSettings = tabSettings:Category({ Title = "背景替换", IconName = "image" })-- 通用功能
catGeneral:Slider({ Title = "移动速度", Min = 16, Max = 300, Default = 16, Callback = function(v) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = v end 
end })
catGeneral:Slider({ Title = "跳跃高度", Min = 50, Max = 300, Default = 50, Callback = function(v) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = v end 
end })

local noclip = false
catGeneral:Toggle({ Title = "穿墙", Value = false, Callback = function(s) noclip = s end })
RunService.Stepped:Connect(function()
    if noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

local flying = false
local flyBV = nil
catGeneral:Toggle({ Title = "开启飞行", Value = false, Callback = function(s)
    flying = s
    if flying then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            flyBV = Instance.new("BodyVelocity", hrp)
            flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            task.spawn(function()
                while flying and flyBV do
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        flyBV.Velocity = Vector3.new(0, 50, 0)
                    else
                        flyBV.Velocity = Vector3.new(0, 0, 0)
                    end
                    task.wait()
                end
            end)
        end
    else
        if flyBV then flyBV:Destroy() flyBV = nil end
    end
end })

-- 造船寻宝
local moveLoop, isMoving = nil, false
local points = {
    Vector3.new(-43.128983, 66.641129, 1123.932861),
    Vector3.new(-46.607533, 49.785690, 8677.564453),
    Vector3.new(-53.364597, -289.227875, 8735.583984),
    Vector3.new(-54.343830, -358.203461, 9490.367188)
}
catBoat:Toggle({ Title = "自动刷钱 (路径飞行)", Value = false, Callback = function(state)
    isMoving = state
    if moveLoop then task.cancel(moveLoop) moveLoop = nil end
    if state then
        moveLoop = task.spawn(function()
            while isMoving do
                local char = LocalPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if not root then task.wait(0.1) continue end
                for i = 1, #points - 1 do
                    if not isMoving then break end
                    local elapsed = 0
                    while elapsed < 10 and isMoving do
                        if not root or not root.Parent then break end
                        root.CFrame = CFrame.new(points[i]:Lerp(points[i+1], elapsed/10))
                        elapsed = elapsed + 0.01
                        task.wait(0.01)
                    end
                    if isMoving then task.wait(1) end
                end
            end
        end)
    end
end })

-- 保护房子透视
local function ESP_Zombie(state, name, title, color)
    if state then
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower() == name:lower() and obj:FindFirstChild("HumanoidRootPart") and not obj:FindFirstChild("ZombieESP") then
                local hl = Instance.new("Highlight", obj) hl.Name = "ZombieESP" hl.FillColor = color hl.FillTransparency = 0.5
                local bb = Instance.new("BillboardGui", obj) bb.Name = "ZombieESP" bb.Adornee = obj bb.Size = UDim2.new(0,120,0,40) bb.AlwaysOnTop = true
                local tl = Instance.new("TextLabel", bb) tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1 tl.Text = title tl.TextColor3 = color tl.TextScaled = true
            end
        end
    else
        for _, v in ipairs(Workspace:GetDescendants()) do if v.Name == "ZombieESP" then v:Destroy() end end
    end
end

catDefense:Toggle({ Title = "透视南瓜僵尸", Value = false, Callback = function(s) ESP_Zombie(s, "pumpkin", "南瓜", Color3.fromRGB(255, 165, 0)) end })
catDefense:Toggle({ Title = "透视普通僵尸", Value = false, Callback = function(s) ESP_Zombie(s, "zombie", "僵尸", Color3.fromRGB(0, 255, 0)) end })    -- 换背景
    local bgUrls = {
        ["蓝白剑客"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        ["水墨武士"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg",
        ["六花"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg",
        ["幸运星"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg",
        ["甜点少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png",
        ["派对少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
    }

    catSettings:Dropdown({
        Title = "选择背景图片",
        Values = { "蓝白剑客", "水墨武士", "六花", "幸运星", "甜点少女", "派对少女" },
        Value = "蓝白剑客",
        Multi = false,
        Callback = function(selected)
            local url = bgUrls[selected]
            if url then
                pcall(function()
                    for _, v in pairs(PlayerGui:GetDescendants()) do
                        if v:IsA("ImageLabel") and (v.Name:lower():match("background") or v.Name:lower():match("bg")) then
                            v.Image = url
                        end
                    end
                end)
                WasUIPro:Notify({ Title = "成功", Content = "背景图已切换！", Duration = 2 })
            end
        end
    })

    catSettings:Button({
        Text = "销毁隐藏 UI",
        Icon = "x-circle",
        Callback = function()
            if getgenv().MainWindow and getgenv().MainWindow.Destroy then
                getgenv().MainWindow:Destroy()
            end
            getgenv().PoxiaoLoaded = false
        end
    })
    
    -- 彻底删除了 F1 快捷键逻辑，手机用面板上的最小化按钮即可
end)
