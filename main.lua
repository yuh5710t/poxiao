--═══════════════════════════════════════════════════--
-- 破晓 | 作者：影月 | 完整无截断版 1/5
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

local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)
if not success or not WindUI then
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "破晓", Text = "UI库加载失败", Duration = 5})
    getgenv().PoxiaoLoaded = false
    return
end

-- 炫酷光轴动画
local animGui = Instance.new("ScreenGui", PlayerGui)
animGui.IgnoreGuiInset = true
animGui.DisplayOrder = 999
local animText = Instance.new("TextLabel", animGui)
animText.Size = UDim2.new(0, 500, 0, 100)
animText.Position = UDim2.new(0.5, 0, 0.5, 0)
animText.AnchorPoint = Vector2.new(0.5, 0.5)
animText.BackgroundTransparency = 1
animText.Text = "破 晓"
animText.TextColor3 = Color3.fromRGB(255, 255, 255)
animText.Font = Enum.Font.GothamBlack
animText.TextSize = 0
animText.TextTransparency = 1

local line1 = Instance.new("Frame", animGui)
line1.Size = UDim2.new(0, 0, 0, 3)
line1.Position = UDim2.new(0.5, 0, 0.5, -40)
line1.AnchorPoint = Vector2.new(0.5, 0.5)
line1.BackgroundColor3 = Color3.fromRGB(200, 30, 30)

local line2 = Instance.new("Frame", animGui)
line2.Size = UDim2.new(0, 0, 0, 3)
line2.Position = UDim2.new(0.5, 0, 0.5, 40)
line2.AnchorPoint = Vector2.new(0.5, 0.5)
line2.BackgroundColor3 = Color3.fromRGB(200, 30, 30)

TweenService:Create(animText, TweenInfo.new(0.8, Enum.EasingStyle.Back), {TextSize = 80, TextTransparency = 0}):Play()
TweenService:Create(line1, TweenInfo.new(0.6), {Size = UDim2.new(0, 300, 0, 3)}):Play()
TweenService:Create(line2, TweenInfo.new(0.6), {Size = UDim2.new(0, 300, 0, 3)}):Play()
task.wait(1.5)
TweenService:Create(animText, TweenInfo.new(0.4), {TextSize = 0, TextTransparency = 1}):Play()
TweenService:Create(line1, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 3)}):Play()
TweenService:Create(line2, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 3)}):Play()
task.wait(0.5)
animGui:Destroy()

-- 正方形防圈钱公告
local noticeGui = Instance.new("ScreenGui", PlayerGui)
noticeGui.IgnoreGuiInset = true
noticeGui.DisplayOrder = 999
local noticeFrame = Instance.new("Frame", noticeGui)
noticeFrame.Size = UDim2.new(0, 350, 0, 320)
noticeFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
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
descText.Size = UDim2.new(1, -30, 0, 180)
descText.Position = UDim2.new(0, 15, 0, 50)
descText.BackgroundTransparency = 1
descText.Text = "【严正声明】\n本脚本由 影月 制作，永久免费！\n如果你是通过付费购买的，那么你被骗了！\n严禁倒卖、圈钱！\n\n【版本更新】\n1. 终极完美版，内置丝滑 UI。\n2. 满血原版造船寻宝 / 保护房子。\n3. 内置背景图片安全切换。\n4. 修复手机端滑块与滑动问题。"
descText.TextColor3 = Color3.fromRGB(220, 220, 220)
descText.Font = Enum.Font.Gotham
descText.TextSize = 14
descText.TextXAlignment = Enum.TextXAlignment.Left
descText.TextYAlignment = Enum.TextYAlignment.Top

local confirmBtn = Instance.new("TextButton", noticeFrame)
confirmBtn.Size = UDim2.new(0, 220, 0, 40)
confirmBtn.Position = UDim2.new(0.5, 0, 1, -60)
confirmBtn.AnchorPoint = Vector2.new(0.5, 0)
confirmBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
confirmBtn.Text = "我已知晓，进入脚本"
confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)confirmBtn.MouseButton1Click:Connect(function()
    noticeGui:Destroy()
    
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

    for _, pct in ipairs({25, 60, 85, 100}) do
        loadLabel.Text = "加载核心: " .. pct .. "%"
        TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(pct / 100, 0, 1, 0)}):Play()
        task.wait(0.3)
    end
    loadLabel.Text = "✅ 加载成功！"
    task.wait(0.4)
    loadingGui:Destroy()

    -- 创建主菜单窗口
    getgenv().MainWindow = WindUI:CreateWindow({
        Title = "破晓 | 影月",
        Folder = "Poxiao_Config",
        Size = UDim2.fromOffset(500, 350),
        Transparent = true,
        Theme = "Dark",
        Background = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        BackgroundImageTransparency = 0.6
    })

    -- 修复收起按钮尺寸
    getgenv().MainWindow:EditOpenButton({ Title = "菜单", Icon = "rbxassetid://81944629903864", Draggable = true })
    
    -- 强制等待UI加载完毕
    task.wait(1.5)
    
    local Tabs = {
        General = getgenv().MainWindow:Tab({ Title = "通用功能", Icon = "globe" }),
        Boat = getgenv().MainWindow:Tab({ Title = "造船寻宝", Icon = "anchor" }),
        Defense = getgenv().MainWindow:Tab({ Title = "保护房子", Icon = "shield" }),
        Scripts = getgenv().MainWindow:Tab({ Title = "外部脚本", Icon = "code" }),
        Settings = getgenv().MainWindow:Tab({ Title = "特效配置", Icon = "image" })
        }-- 【通用功能】
Tabs.General:Slider({ Title = "移动速度", Min = 16, Max = 300, Default = 16, Callback = function(v) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = v end 
end })

Tabs.General:Slider({ Title = "跳跃高度", Min = 50, Max = 300, Default = 50, Callback = function(v) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = v end 
end })

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

-- 飞行功能
local flying = false
local flyBV = nil
Tabs.General:Toggle({ Title = "开启飞行 (按空格上升)", Value = false, Callback = function(s)
    flying = s
    if flying then
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            flyBV = Instance.new("BodyVelocity", hrp)
            flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            flyBV.Velocity = Vector3.new(0, 0, 0)
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

-- 2D 射线透视
local espOn = false
local Drawings = {}
local function CleanESP() for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end table.clear(Drawings) end

Tabs.General:Toggle({ Title = "开启 2D 射线透视", Value = false, Callback = function(s) espOn = s if not s then CleanESP() end end })
Tabs.General:ColorPicker({ Title = "透视颜色", Default = Color3.fromRGB(255, 0, 0), Callback = function(c) getgenv().EspColor = c end })
getgenv().EspColor = Color3.fromRGB(255, 0, 0)

RunService.RenderStepped:Connect(function()
    if not espOn then return end
    CleanESP()
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
end)

-- 自瞄
local aimOn = false
Tabs.General:Toggle({ Title = "自瞄 (按住右键)", Value = false, Callback = function(s) aimOn = s end })
RunService.RenderStepped:Connect(function()
    if not aimOn then return end
    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local closest, dist = nil, 300
        local mouse = UserInputService:GetMouseLocation()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, on = workspace.CurrentCamera:WorldToViewportPoint(p.Character.Head.Position)
                if on then
                    local d = (Vector2.new(pos.X, pos.Y) - mouse).Magnitude
                    if d < dist then dist = d closest = p.Character.Head end
                end
            end
        end
        if closest and mousemoverel then
            local pos = workspace.CurrentCamera:WorldToViewportPoint(closest.Position)
            mousemoverel((pos.X - mouse.X) * 0.2, (pos.Y - mouse.Y) * 0.2)
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

-- 【保护房子】（满血复杂透视）
local function ESP_WeaponBoxes(state)
    if state then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name:lower():find("hitbox") and not v:FindFirstChild("WeaponESP") then
                local hl = Instance.new("Highlight", v) hl.Name = "WeaponESP" hl.FillColor = Color3.fromRGB(0,255,0) hl.FillTransparency = 0.5
                local bb = Instance.new("BillboardGui", v) bb.Name = "WeaponESP" bb.Adornee = v bb.Size = UDim2.new(0,100,0,30) bb.AlwaysOnTop = true
                local tl = Instance.new("TextLabel", bb) tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1 tl.Text = "武器箱" tl.TextColor3 = Color3.fromRGB(0,255,0) tl.TextScaled = true
            end
        end
    else
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name == "WeaponESP" then v:Destroy() end
        end
    end
end

local function ESP_ZombieType(state, typeName, title, color)
    if state then
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:lower() == typeName:lower() and obj:FindFirstChild("HumanoidRootPart") and not obj:FindFirstChild("ZombieESP") then
                local hl = Instance.new("Highlight", obj) hl.Name = "ZombieESP" hl.FillColor = color hl.FillTransparency = 0.5
                local bb = Instance.new("BillboardGui", obj) bb.Name = "ZombieESP" bb.Adornee = obj bb.Size = UDim2.new(0,120,0,40) bb.AlwaysOnTop = true
                local tl = Instance.new("TextLabel", bb) tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1 tl.Text = title tl.TextColor3 = color tl.TextScaled = true
            end
        end
    else
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v.Name == "ZombieESP" then v:Destroy() end
        end
    end
end

Tabs.Defense:Toggle({ Title = "透视武器箱", Value = false, Callback = function(s) ESP_WeaponBoxes(s) end })
Tabs.Defense:Toggle({ Title = "透视南瓜僵尸", Value = false, Callback = function(s) ESP_ZombieType(s, "pumpkin", "南瓜", Color3.fromRGB(255, 165, 0)) end })
Tabs.Defense:Toggle({ Title = "透视普通僵尸", Value = false, Callback = function(s) ESP_ZombieType(s, "zombie", "僵尸", Color3.fromRGB(0, 255, 0)) end })    -- 【外部脚本】（增加代码丰富度）
    Tabs.Scripts:Button({ Title = "XK HUB", Callback = function() loadstring(game:HttpGet('https://github.com/devslopo/DVES/raw/main/XK%20Hub'))() end })
    Tabs.Scripts:Button({ Title = "沙脚本", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/114514lzkill/ShaHUB/refs/heads/main/ShaHUB"))() end })
    Tabs.Scripts:Button({ Title = "FE飞行", Callback = function() loadstring(game:HttpGet("https://pastefy.app/GcjGkx1H/raw"))() end })

    -- 【特效配置：安全换图】
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

    Tabs.Settings:Button({ Text = "销毁脚本", Callback = function() 
        CleanESP() 
        getgenv().MainWindow:Destroy() 
    end })
end)
