--═══════════════════════════════════════════════════--
--  破晓 | 作者：影月 | 满血复活版 1/5
--═══════════════════════════════════════════════════--
if getgenv().PoxiaoLoaded then return end
getgenv().PoxiaoLoaded = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- 1. 纯净动画
local animGui = Instance.new("ScreenGui", PlayerGui)
animGui.IgnoreGuiInset = true
local textLabel = Instance.new("TextLabel", animGui)
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "破晓加载中..."
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 30
textLabel.TextTransparency = 1
TweenService:Create(textLabel, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
task.wait(1.2)
TweenService:Create(textLabel, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
task.wait(0.5)
animGui:Destroy()

-- 2. 正方形公告
local noticeGui = Instance.new("ScreenGui", PlayerGui)
noticeGui.IgnoreGuiInset = true
noticeGui.DisplayOrder = 999
local bgFrame = Instance.new("Frame", noticeGui)
bgFrame.Size = UDim2.new(0, 320, 0, 320)
bgFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
bgFrame.AnchorPoint = Vector2.new(0.5, 0.5)
bgFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", bgFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", bgFrame).Color = Color3.fromRGB(200, 50, 50)

local title = Instance.new("TextLabel", bgFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "⚠️ 系统公告 ⚠️"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

local desc = Instance.new("TextLabel", bgFrame)
desc.Size = UDim2.new(1, -20, 0, 180)
desc.Position = UDim2.new(0, 10, 0, 45)
desc.BackgroundTransparency = 1
desc.Text = "【免责声明】\n本脚本由 影月 制作，永久免费！\n如果你是通过付费购买的，那么你被骗了！\n严禁倒卖、圈钱！\n\n【更新内容】\n1. 修复手机滑块与上下滑动。\n2. 拉满所有原版复杂功能。\n3. 背景替换已修复。"
desc.TextColor3 = Color3.fromRGB(220, 220, 220)
desc.Font = Enum.Font.Gotham
desc.TextSize = 14
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.TextYAlignment = Enum.TextYAlignment.Top

local btnYes = Instance.new("TextButton", bgFrame)
btnYes.Size = UDim2.new(0, 200, 0, 40)
btnYes.Position = UDim2.new(0.5, 0, 1, -60)
btnYes.AnchorPoint = Vector2.new(0.5, 0)
btnYes.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
btnYes.Text = "我已知晓，进入脚本"
btnYes.TextColor3 = Color3.fromRGB(255, 255, 255)
btnYes.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnYes).CornerRadius = UDim.new(0, 6)btnYes.MouseButton1Click:Connect(function()
    noticeGui:Destroy()

    -- 3. 右下角进度条
    local loadingGui = Instance.new("ScreenGui", PlayerGui)
    loadingGui.IgnoreGuiInset = true
    local loadFrame = Instance.new("Frame", loadingGui)
    loadFrame.Size = UDim2.new(0, 200, 0, 50)
    loadFrame.Position = UDim2.new(1, -220, 1, -70)
    loadFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", loadFrame).Color = Color3.fromRGB(0, 255, 255)

    local loadText = Instance.new("TextLabel", loadFrame)
    loadText.Size = UDim2.new(1, 0, 0, 25)
    loadText.BackgroundTransparency = 1
    loadText.Text = "加载核心: 0%"
    loadText.TextColor3 = Color3.fromRGB(255, 255, 255)
    loadText.Font = Enum.Font.Code
    loadText.TextSize = 14

    local barBg = Instance.new("Frame", loadFrame)
    barBg.Size = UDim2.new(0.9, 0, 0, 8)
    barBg.Position = UDim2.new(0.05, 0, 0, 30)
    barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

    local steps = {15, 40, 70, 95, 100}
    for _, pct in ipairs(steps) do
        loadText.Text = "加载核心: " .. pct .. "%"
        TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(pct / 100, 0, 1, 0)}):Play()
        task.wait(0.4)
    end
    loadText.Text = "✅ 加载成功！"
    task.wait(0.5)
    loadingGui:Destroy()

    -- 4. 创建主菜单
    getgenv().Window = WindUI:CreateWindow({
        Title = "破晓 | 影月",
        Folder = "Poxiao_Config",
        Size = UDim2.fromOffset(450, 300),
        Transparent = true,
        Theme = "Dark",
        Background = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        BackgroundImageTransparency = 0.6
    })

    getgenv().Window:EditOpenButton({
        Title = "菜单",
        Icon = "rbxassetid://81944629903864",
        Draggable = true,
    })
    
    -- 【强力修复手机滑动】
    task.delay(1, function()
        for _, v in pairs(PlayerGui:GetDescendants()) do
            if v:IsA("ScrollingFrame") then
                v.ScrollingDirection = Enum.ScrollingDirection.Y
                v.ScrollingEnabled = true
                v.CanvasSize = UDim2.new(0, 0, 0, 0)
                -- 解除透明层遮挡
                for _, child in pairs(v:GetChildren()) do
                    if child:IsA("Frame") and child.BackgroundTransparency == 1 then
                        child.Active = false
                    end
                end
            end
            -- 修复 Slider 滑块触控
            if v:IsA("ImageButton") and (v.Name:match("Slider") or v.Name:match("Thumb")) then
                v.Active = true
                v.Draggable = true
            end
        end
    end)
end)task.spawn(function()
    while not getgenv().Window do task.wait(0.1) end
    local Window = getgenv().Window
    
    local Tabs = {
        General = Window:Tab({ Title = "通用功能", Icon = "globe" }),
        Boat = Window:Tab({ Title = "造船寻宝", Icon = "anchor" }),
        Defense = Window:Tab({ Title = "保护房子", Icon = "shield" }),
        Scripts = Window:Tab({ Title = "外部脚本", Icon = "code" }),
        Settings = Window:Tab({ Title = "特效配置", Icon = "image" })
    }

    -- 【通用功能】
    Tabs.General:Slider({ Title = "移动速度", Min = 16, Max = 300, Default = 16, Callback = function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = v end end })
    Tabs.General:Slider({ Title = "跳跃高度", Min = 50, Max = 300, Default = 50, Callback = function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = v end end })

    local noclip = false
    Tabs.General:Toggle({ Title = "穿墙", Value = false, Callback = function(s) noclip = s end })
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)

    local infJump = false
    Tabs.General:Toggle({ Title = "无限跳跃", Value = false, Callback = function(s) infJump = s end })
    UserInputService.InputBegan:Connect(function(i, g) 
        if not g and i.KeyCode == Enum.KeyCode.Space and infJump then 
            local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end 
        end 
    end)

    -- 2D 透视
    local espOn, showLine = false, true
    local Drawings = {}
    local function CleanDraws() for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end table.clear(Drawings) end

    Tabs.General:Toggle({ Title = "开启 2D 射线透视", Value = false, Callback = function(s) espOn = s if not s then CleanDraws() end end })
    Tabs.General:ColorPicker({ Title = "透视颜色", Default = Color3.fromRGB(255, 0, 0), Callback = function(c) getgenv().EspColor = c end })
    getgenv().EspColor = Color3.fromRGB(255, 0, 0)

    RunService.RenderStepped:Connect(function()
        if not espOn then return end
        CleanDraws()
        local cam = workspace.CurrentCamera
        local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, on = cam:WorldToViewportPoint(p.Character.Head.Position)
                if on then
                    local line = Drawing.new("Line")
                    line.From = center line.To = Vector2.new(pos.X, pos.Y)
                    line.Color = getgenv().EspColor line.Thickness = 1 line.Visible = true
                    table.insert(Drawings, line)
                    
                    local text = Drawing.new("Text")
                    text.Text = p.Name text.Size = 14 text.Center = true text.Outline = true
                    text.Color = getgenv().EspColor text.Position = Vector2.new(pos.X, pos.Y - 20) text.Visible = true
                    table.insert(Drawings, text)
                end
            end
        end
    end)-- 【造船寻宝】（完整飞行逻辑）
local moveLoop, isMoving = nil, false
local points = {
    Vector3.new(-43.128983, 66.641129, 1123.932861),
    Vector3.new(-46.607533, 49.785690, 8677.564453),
    Vector3.new(-53.364597, -289.227875, 8735.583984),
    Vector3.new(-54.343830, -358.203461, 9490.367188)
}
Tabs.Boat:Toggle({ Title = "自动刷钱 (路径)", Value = false, Callback = function(state)
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

-- 【保护房子】（塞满复杂透视逻辑）
local function ESP_WeaponBoxes(state)
    if not getgenv().WeaponBoxesESP then getgenv().WeaponBoxesESP = { Enabled = false, Boxes = {} } end
    local ESP = getgenv().WeaponBoxesESP
    if state then
        ESP.Enabled = true
        local function scan()
            for _, v in ipairs(Workspace:GetDescendants()) do
                if (v:IsA("BasePart") or v:IsA("Model")) and v.Name:lower():find("hitbox") and not ESP.Boxes[v] then
                    local hl = Instance.new("Highlight", v) hl.FillColor = Color3.fromRGB(0,255,0) hl.FillTransparency = 0.5
                    local bb = Instance.new("BillboardGui", v) bb.Adornee = v bb.Size = UDim2.new(0,100,0,30) bb.AlwaysOnTop = true
                    local tl = Instance.new("TextLabel", bb) tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1 tl.Text = "武器箱" tl.TextColor3 = Color3.fromRGB(0,255,0) tl.TextScaled = true
                    ESP.Boxes[v] = {hl, bb}
                end
            end
        end
        scan()
        task.spawn(function() while ESP.Enabled do task.wait(2) scan() end end)
    else
        ESP.Enabled = false
        for v, data in pairs(ESP.Boxes) do if data[1] then data[1]:Destroy() end if data[2] then data[2]:Destroy() end end
        ESP.Boxes = {}
    end
end

local function ESP_ZombieType(state, typeName, displayTitle, color)
    if state then
        local folder = Instance.new("Folder", PlayerGui) folder.Name = typeName.."ESP"
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower() == typeName:lower() and obj:FindFirstChild("HumanoidRootPart") then
                local hl = Instance.new("Highlight", obj) hl.FillColor = color hl.FillTransparency = 0.5
                local bb = Instance.new("BillboardGui", obj) bb.Adornee = obj bb.Size = UDim2.new(0,100,0,30) bb.AlwaysOnTop = true
                local tl = Instance.new("TextLabel", bb) tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1 tl.Text = displayTitle tl.TextColor3 = color tl.TextScaled = true
                folder.Parent = obj
            end
        end
    else
        local folder = PlayerGui:FindFirstChild(typeName.."ESP")
        if folder then folder:Destroy() end
    end
end

Tabs.Defense:Toggle({ Title = "透视武器箱", Value = false, Callback = function(s) ESP_WeaponBoxes(s) end })
Tabs.Defense:Toggle({ Title = "透视南瓜僵尸", Value = false, Callback = function(s) ESP_ZombieType(s, "pumpkin", "南瓜", Color3.fromRGB(255, 165, 0)) end })
Tabs.Defense:Toggle({ Title = "透视普通僵尸", Value = false, Callback = function(s) ESP_ZombieType(s, "zombie", "僵尸", Color3.fromRGB(0, 255, 0)) end })    -- 【外部脚本】（拉长代码量，防断）
    Tabs.Scripts:Button({ Title = "XK HUB", Callback = function() loadstring(game:HttpGet('https://github.com/devslopo/DVES/raw/main/XK%20Hub'))() end })
    Tabs.Scripts:Button({ Title = "沙脚本", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/114514lzkill/ShaHUB/refs/heads/main/ShaHUB"))() end })
    Tabs.Scripts:Button({ Title = "FE飞行", Callback = function() loadstring(game:HttpGet("https://pastefy.app/GcjGkx1H/raw"))() end })

    -- 【特效配置】（安全换背景）
    local bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"
    Tabs.Settings:Dropdown({
        Title = "选背景图", Values = { "蓝白剑客", "水墨武士", "六花", "幸运星", "甜点少女", "派对少女" }, Value = "蓝白剑客",
        Callback = function(sel)
            if sel == "蓝白剑客" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"
            elseif sel == "水墨武士" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg"
            elseif sel == "六花" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg"
            elseif sel == "幸运星" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg"
            elseif sel == "甜点少女" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png"
            elseif sel == "派对少女" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
            end
        end
    })
    
    Tabs.Settings:Button({ Title = "确定替换背景", Callback = function()
        for _, v in pairs(PlayerGui:GetDescendants()) do 
            if v:IsA("ImageLabel") and (v.Name == "Background" or v.Name:match("Bg")) then 
                v.Image = bgUrl 
            end 
        end
        WindUI:Notify({ Title = "系统", Content = "背景已替换", Icon = "check", Duration = 2 })
    end })

    Tabs.Settings:Button({ Text = "销毁脚本", Callback = function() CleanDraws() Window:Destroy() end })
end)
