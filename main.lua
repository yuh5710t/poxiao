--═══════════════════════════════════════════════════--
--  破晓 | 作者：影月 | 第 1 段
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
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = Workspace.CurrentCamera

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local IntroGui = Instance.new("ScreenGui", PlayerGui)
IntroGui.IgnoreGuiInset = true
IntroGui.DisplayOrder = 999
local Blur = Instance.new("BlurEffect", Lighting) Blur.Size = 20

local MainFrame = Instance.new("Frame", IntroGui)
MainFrame.Size = UDim2.new(0, 350, 0, 260)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 10, 15)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(0, 255, 255)

local title = Instance.new("TextLabel", MainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "☽ 破晓系统终端 V3.0 ☾"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.Code title.TextSize = 22 title.ZIndex = 99

local desc = Instance.new("TextLabel", MainFrame)
desc.Size = UDim2.new(1, -20, 0, 140)
desc.Position = UDim2.new(0, 10, 0, 50)
desc.BackgroundTransparency = 1
desc.Text = "> 核心注入完毕...\n> 作者：影月\n> 状态：正常\n\n[系统公告]\n1. 火力全开！特效完全恢复！\n2. 造船寻宝/保护房子 100%原版\n3. 安全切换背景图，绝不乱码\n4. 增加全屏故障风启动特效\n\n> 按 [确定进入] 启动终端。"
desc.TextColor3 = Color3.fromRGB(220, 220, 220)
desc.Font = Enum.Font.Code desc.TextSize = 14
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.TextYAlignment = Enum.TextYAlignment.Top
desc.ZIndex = 99

local btnYes = Instance.new("TextButton", MainFrame)
btnYes.Size = UDim2.new(0, 130, 0, 36)
btnYes.Position = UDim2.new(0.5, -140, 1, -50)
btnYes.BackgroundColor3 = Color3.fromRGB(0, 150, 150)
btnYes.Text = "确定进入" btnYes.TextColor3 = Color3.new(1,1,1)
btnYes.Font = Enum.Font.Code btnYes.ZIndex = 99
Instance.new("UICorner", btnYes).CornerRadius = UDim.new(0, 4)

local btnNo = Instance.new("TextButton", MainFrame)
btnNo.Size = UDim2.new(0, 130, 0, 36)
btnNo.Position = UDim2.new(0.5, 10, 1, -50)
btnNo.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
btnNo.Text = "取消退出" btnNo.TextColor3 = Color3.new(1,1,1)
btnNo.Font = Enum.Font.Code btnNo.ZIndex = 99
Instance.new("UICorner", btnNo).CornerRadius = UDim.new(0, 4)

btnNo.MouseButton1Click:Connect(function() Blur:Destroy() IntroGui:Destroy() getgenv().PoxiaoLoaded = false end)btnYes.MouseButton1Click:Connect(function()
    IntroGui:Destroy() Blur:Destroy()

    local animGui = Instance.new("ScreenGui", PlayerGui)
    animGui.IgnoreGuiInset = true animGui.DisplayOrder = 999
    
    local bg = Instance.new("Frame", animGui)
    bg.Size = UDim2.new(1, 0, 1, 0) bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    
    local scanline = Instance.new("Frame", bg)
    scanline.Size = UDim2.new(1, 0, 0, 10)
    scanline.Position = UDim2.new(0, 0, -0.1, 0)
    scanline.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    
    local animText = Instance.new("TextLabel", bg)
    animText.Size = UDim2.new(1, 0, 1, 0)
    animText.BackgroundTransparency = 1
    animText.Text = "破晓" animText.TextColor3 = Color3.new(1,1,1)
    animText.Font = Enum.Font.GothamBlack
    animText.TextSize = 0 animText.TextTransparency = 1
    
    local glow = Instance.new("UIStroke", animText)
    glow.Color = Color3.fromRGB(255, 30, 30) glow.Thickness = 15 glow.Transparency = 1

    TweenService:Create(scanline, TweenInfo.new(0.6, Enum.EasingStyle.Linear), {Position = UDim2.new(0, 0, 1, 0)}):Play()
    TweenService:Create(animText, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextSize = 120, TextTransparency = 0}):Play()
    TweenService:Create(glow, TweenInfo.new(0.5), {Transparency = 0.1}):Play()
    
    task.wait(0.6)
    for i = 1, 4 do
        animText.TextColor3 = Color3.fromRGB(255, 0, 0)
        animText.Position = UDim2.new(0, math.random(-10, 10), 0, math.random(-5, 5))
        task.wait(0.04)
        animText.TextColor3 = Color3.fromRGB(0, 255, 255)
        animText.Position = UDim2.new(0, math.random(-10, 10), 0, math.random(-5, 5))
        task.wait(0.04)
    end
    animText.TextColor3 = Color3.new(1,1,1) animText.Position = UDim2.new(0,0,0,0)
    
    task.wait(1)
    TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(animText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(glow, TweenInfo.new(0.5), {Transparency = 1}):Play()
    task.wait(0.6)
    animGui:Destroy()

    getgenv().Window = WindUI:CreateWindow({
        Title = "破晓 | 影月",
        Folder = "Poxiao_Config",
        Size = UDim2.fromOffset(450, 320),
        Transparent = true, Theme = "Dark",
        Background = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        BackgroundImageTransparency = 0.5
    })

    getgenv().Window:EditOpenButton({
        Title = "菜单",
        Icon = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg",
        Draggable = true,
    })
    
    task.delay(1, function()
        for _, v in pairs(PlayerGui:GetDescendants()) do
            if v:IsA("ImageButton") and (v.Name:match("Open") or v.Name:match("Toggle")) then
                v.Size = UDim2.fromOffset(55, 55) v.BackgroundTransparency = 1
            end
        end
    end)
end)task.spawn(function()
    while not getgenv().Window do task.wait(0.1) end
    local Window = getgenv().Window
    
    local Tabs = {
        Announce = Window:Tab({ Title = "系统公告", Icon = "bell" }),
        Boat = Window:Tab({ Title = "造船寻宝", Icon = "anchor" }),
        Defense = Window:Tab({ Title = "保护房子", Icon = "shield" }),
        General = Window:Tab({ Title = "通用功能", Icon = "globe" }),
        Settings = Window:Tab({ Title = "特效与配置", Icon = "settings" })
    }

    local logPara = Tabs.Announce:Paragraph({ Title = "破晓核心更新 V3.0", Desc = "作者：影月", Image = "file-text" })
    task.spawn(function()
        local fullLog = "【欢迎使用破晓系统终端】\n\n本次火力全开更新：\n\n1. 恢复了故障风启动动画。\n2. 采用底层安全替换机制，完美替换背景。\n3. 《造船寻宝》4点坐标飞行。\n4. 《保护房子》全透视保留。\n5. 《通用功能》新增开源级2D射线方框透视（可改色）。\n\n祝您游戏愉快！"
        local txt = ""
        for i = 1, #fullLog do
            txt = txt .. fullLog:sub(i,i)
            logPara:SetContent(txt)
            task.wait(0.03)
        end
    end)

    local moveLoop = nil
    local isMoving = false
    local points = {
        Vector3.new(-43.128983, 66.641129, 1123.932861),
        Vector3.new(-46.607533, 49.785690, 8677.564453),
        Vector3.new(-53.364597, -289.227875, 8735.583984),
        Vector3.new(-54.343830, -358.203461, 9490.367188)
    }

    Tabs.Boat:Toggle({
        Title = "自动刷钱 (路径飞行)",
        Value = false,
        Callback = function(state)
            isMoving = state
            if moveLoop then task.cancel(moveLoop) moveLoop = nil end
            if state then
                moveLoop = task.spawn(function()
                    while isMoving do
                        local char = LocalPlayer.Character
                        local myRoot = char and char:FindFirstChild("HumanoidRootPart")
                        if not myRoot then task.wait(0.1) continue end
                        for i = 1, #points - 1 do
                            if not isMoving then break end
                            local elapsed = 0
                            while elapsed < 10 and isMoving do
                                if not myRoot or not myRoot.Parent then break end
                                myRoot.CFrame = CFrame.new(points[i]:Lerp(points[i+1], elapsed/10))
                                elapsed = elapsed + 0.01
                                task.wait(0.01)
                            end
                            if isMoving then task.wait(1) end
                        end
                    end
                end)
            end
        end
    })function ESP_WeaponBoxes(state)
    if not getgenv().WeaponBoxesESP then getgenv().WeaponBoxesESP = { Enabled = false, Boxes = {}, Connection = nil, SearchInterval = nil } end
    local ESP = getgenv().WeaponBoxesESP
    local function CreateESPForBox(hitbox)
        if ESP.Boxes[hitbox] or not hitbox or not hitbox.Parent then return end
        local highlight = Instance.new("Highlight", hitbox)
        highlight.FillColor = Color3.fromRGB(0, 255, 0) highlight.FillTransparency = 0.5
        local billboard = Instance.new("BillboardGui", hitbox)
        billboard.Adornee = hitbox billboard.Size = UDim2.new(0, 150, 0, 40) billboard.AlwaysOnTop = true
        local tl = Instance.new("TextLabel", billboard)
        tl.Size = UDim2.new(1,0,1,0) tl.BackgroundTransparency = 1 tl.Text = "武器箱" tl.TextColor3 = Color3.fromRGB(0,255,0) tl.TextSize = 16
        ESP.Boxes[hitbox] = { Highlight = highlight, Billboard = billboard }
    end
    local function ScanForBoxes()
        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if (descendant:IsA("BasePart") or descendant:IsA("Model")) and descendant.Name:lower():find("hitbox") then CreateESPForBox(descendant) end
        end
    end
    if state then
        if ESP.Enabled then return end
        ESP.Enabled = true ScanForBoxes()
        ESP.SearchInterval = task.spawn(function() while ESP.Enabled do task.wait(2) ScanForBoxes() end end)
    else
        ESP.Enabled = false
        if ESP.SearchInterval then task.cancel(ESP.SearchInterval) ESP.SearchInterval = nil end
        for _, espData in pairs(ESP.Boxes) do
            if espData.Highlight then espData.Highlight:Destroy() end
            if espData.Billboard then espData.Billboard:Destroy() end
        end
        ESP.Boxes = {}
    end
end

function ESP_Bosses(state)
    if not _G.BossESP then _G.BossESP = { Active = false, Connections = {}, ESPObjects = {} } end
    local ESP = _G.BossESP
    local function CreateBossESP(boss)
        if ESP.ESPObjects[boss] then return end
        local highlight = Instance.new("Highlight", boss)
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        local billboard = Instance.new("BillboardGui", boss)
        billboard.AlwaysOnTop = true billboard.Size = UDim2.new(0, 200, 0, 80)
        local nameLabel = Instance.new("TextLabel", billboard)
        nameLabel.Size = UDim2.new(1, 0, 0, 25) nameLabel.BackgroundTransparency = 1 nameLabel.Text = boss.Name nameLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        ESP.ESPObjects[boss] = { Billboard = billboard, Highlight = highlight }
    end
    if state then
        if ESP.Active then return end
        ESP.Active = true
        for _, obj in pairs(Workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and string.sub(obj.Name, 1, 5) == "Boss_" then CreateBossESP(obj) end
        end
    else
        ESP.Active = false
        for _, obj in pairs(ESP.ESPObjects) do if obj.Billboard then obj.Billboard:Destroy() end if obj.Highlight then obj.Highlight:Destroy() end end
        ESP.ESPObjects = {}
    end
end

Tabs.Defense:Toggle({ Title = "透视武器箱", Callback = function(s) ESP_WeaponBoxes(s) end })
Tabs.Defense:Toggle({ Title = "透视 Boss", Callback = function(s) ESP_Bosses(s) end })-- 【通用功能：战斗与移动】把原来保护房子的自瞄穿墙全挪过来
local aimConn = nil
local function AimAssist(state)
    if state then
        if aimConn then aimConn:Disconnect() end
        aimConn = RunService.RenderStepped:Connect(function()
            if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local bestTarget, bestDist = nil, math.huge
                local camPos, camLook = Camera.CFrame.Position, Camera.CFrame.LookVector
                for _, model in ipairs(Workspace:GetDescendants()) do
                    if model:IsA("Model") and model ~= LocalPlayer.Character then
                        local humanoid = model:FindFirstChildOfClass("Humanoid")
                        local head = model:FindFirstChild("Head")
                        if humanoid and humanoid.Health > 0 and head then
                            local dist = (head.Position - camPos).Magnitude
                            if dist <= 200 then
                                local angle = math.deg(math.acos(math.clamp(camLook:Dot((head.Position - camPos).Unit), -1, 1)))
                                if angle <= 60 and dist < bestDist then bestDist, bestTarget = dist, head end
                            end
                        end
                    end
                end
                if bestTarget then Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, bestTarget.Position), 0.15) end
            end
        end)
    else
        if aimConn then aimConn:Disconnect() aimConn = nil end
    end
end

local noclipConn = nil
local function Noclip(state)
    if state then
        if noclipConn then return end
        noclipConn = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    end
end

Tabs.General:Slider({ Title = "移动速度", Min = 16, Max = 500, Default = 16, Callback = function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = v end end })
Tabs.General:Slider({ Title = "跳跃高度", Min = 50, Max = 300, Default = 50, Callback = function(v) if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = v end end })

local infiniteJump = false
Tabs.General:Toggle({ Title = "无限跳跃", Value = false, Callback = function(s) infiniteJump = s end })
UserInputService.InputBegan:Connect(function(i, g) if not g and i.KeyCode == Enum.KeyCode.Space and infiniteJump then local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end end)

Tabs.General:Toggle({ Title = "穿墙", Callback = function(s) Noclip(s) end })
Tabs.General:Toggle({ Title = "自瞄辅助 (按住右键)", Callback = function(s) AimAssist(s) end })
Tabs.General:Toggle({ Title = "X光透视", Callback = function(s)
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part:IsDescendantOf(LocalPlayer.Character) then part.LocalTransparencyModifier = s and 0.7 or 0 end
    end
end })
Tabs.General:Divider()    local ESP2D = {
        Enabled = false, ShowBox = true, ShowTracer = true, ShowName = true, ShowDistance = true,
        BoxColor = Color3.fromRGB(255, 0, 0), TracerColor = Color3.fromRGB(0, 255, 255),
        TargetType = "玩家", CustomName = ""
    }
    local Drawings = {}

    local function CleanupDrawings()
        for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end
        table.clear(Drawings)
    end

    Tabs.General:Toggle({ Title = "开启 2D 视觉透视", Value = false, Callback = function(s)
        ESP2D.Enabled = s
        if not s then CleanupDrawings() end
    end })

    Tabs.General:Dropdown({
        Title = "透视目标", Values = { "玩家", "NPC", "自定义名字" }, Value = "玩家",
        Callback = function(v) ESP2D.TargetType = v end
    })

    Tabs.General:Input({
        Title = "自定义透视名字", Placeholder = "输入名字", Callback = function(text) ESP2D.CustomName = text end
    })

    Tabs.General:Toggle({ Title = "绘制方框", Value = true, Callback = function(s) ESP2D.ShowBox = s end })
    Tabs.General:Toggle({ Title = "绘制天线 (射线)", Value = true, Callback = function(s) ESP2D.ShowTracer = s end })
    Tabs.General:ColorPicker({ Title = "方框颜色", Default = Color3.fromRGB(255, 0, 0), Callback = function(c) ESP2D.BoxColor = c end })
    Tabs.General:ColorPicker({ Title = "天线颜色", Default = Color3.fromRGB(0, 255, 255), Callback = function(c) ESP2D.TracerColor = c end })

    RunService.RenderStepped:Connect(function()
        if not ESP2D.Enabled then return end
        CleanupDrawings()
        local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)

        for _, obj in pairs(Workspace:GetDescendants()) do
            local isTarget, targetPos, targetName = false, nil, obj.Name
            if ESP2D.TargetType == "玩家" then
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj ~= LocalPlayer.Character and Players:GetPlayerFromCharacter(obj) then
                    isTarget = true targetPos = obj:GetPivot().Position
                end
            elseif ESP2D.TargetType == "NPC" then
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                    isTarget = true targetPos = obj:GetPivot().Position
                end
            elseif ESP2D.TargetType == "自定义名字" then
                if (obj:IsA("Model") or obj:IsA("BasePart")) and ESP2D.CustomName ~= "" and string.find(string.lower(obj.Name), string.lower(ESP2D.CustomName)) then
                    isTarget = true targetPos = obj:IsA("Model") and obj:GetPivot().Position or obj.Position
                end
            end

            if isTarget and targetPos then
                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
                if onScreen then
                    local distance = (Camera.CFrame.Position - targetPos).Magnitude
                    local boxSize = 1500 / math.max(distance, 1)
                    
                    if ESP2D.ShowBox then
                        local box = Drawing.new("Square")
                        box.Color = ESP2D.BoxColor box.Thickness = 1 box.Filled = false
                        box.Size = Vector2.new(boxSize * 0.6, boxSize)
                        box.Position = Vector2.new(screenPos.X - box.Size.X / 2, screenPos.Y - box.Size.Y / 2)
                        box.Visible = true table.insert(Drawings, box)
                    end
                    if ESP2D.ShowTracer then
                        local tracer = Drawing.new("Line")
                        tracer.Color = ESP2D.TracerColor tracer.Thickness = 1
                        tracer.From = screenCenter tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                        tracer.Visible = true table.insert(Drawings, tracer)
                    end
                end
            end
        end
    end)

    -- 安全换图
    local bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"
    Tabs.Settings:Dropdown({
        Title = "选择背景图", Values = { "蓝白剑客", "水墨武士", "六花", "幸运星", "甜点少女", "派对少女" }, Value = "蓝白剑客",
        Callback = function(selected)
            if selected == "蓝白剑客" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"
            elseif selected == "水墨武士" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg"
            elseif selected == "六花" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg"
            elseif selected == "幸运星" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg"
            elseif selected == "甜点少女" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png"
            elseif selected == "派对少女" then bgUrl = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
            end
        end
    })
    Tabs.Settings:Button({ Title = "确定替换背景", Callback = function()
        for _, v in pairs(PlayerGui:GetDescendants()) do if v:IsA("ImageLabel") and (v.Name == "Background" or v.Name:match("Bg")) then v.Image = bgUrl end end
        WindUI:Notify({ Title = "系统", Content = "背景替换成功", Icon = "check", Duration = 2 })
    end })
    Tabs.Settings:Button({ Text = "销毁脚本", Callback = function() CleanupDrawings() getgenv().Window:Destroy() end })
end)
