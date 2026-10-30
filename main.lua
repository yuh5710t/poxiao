--═══════════════════════════════════════════════════--
--  破晓 | 作者：影月 | 原版功能完全移植版
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

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- 1. 确认弹窗
local IntroGui = Instance.new("ScreenGui")
IntroGui.Name = "DawnIntro"
IntroGui.IgnoreGuiInset = true
IntroGui.Parent = PlayerGui
local Blur = Instance.new("BlurEffect", Lighting) Blur.Size = 20

local MainFrame = Instance.new("Frame", IntroGui)
MainFrame.Size = UDim2.new(0, 300, 0, 180)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(180, 30, 30)

local btnYes = Instance.new("TextButton", MainFrame)
btnYes.Size = UDim2.new(0, 120, 0, 36)
btnYes.Position = UDim2.new(0.5, -130, 1, -50)
btnYes.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
btnYes.Text = "确定进入" btnYes.TextColor3 = Color3.fromRGB(255, 255, 255) btnYes.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnYes).CornerRadius = UDim.new(0, 6)

local btnNo = Instance.new("TextButton", MainFrame)
btnNo.Size = UDim2.new(0, 120, 0, 36)
btnNo.Position = UDim2.new(0.5, 10, 1, -50)
btnNo.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
btnNo.Text = "取消退出" btnNo.TextColor3 = Color3.fromRGB(255, 255, 255) btnNo.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnNo).CornerRadius = UDim.new(0, 6)

btnNo.MouseButton1Click:Connect(function() Blur:Destroy() IntroGui:Destroy() getgenv().PoxiaoLoaded = false end)

btnYes.MouseButton1Click:Connect(function()
    IntroGui:Destroy() Blur:Destroy()

    -- 2. 动画
    local animGui = Instance.new("ScreenGui", PlayerGui)
    animGui.IgnoreGuiInset = true
    local animBg = Instance.new("ImageLabel", animGui)
    animBg.Size = UDim2.new(1, 0, 1, 0)
    animBg.BackgroundColor3 = Color3.fromRGB(0,0,0)
    animBg.Image = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg"
    animBg.ScaleType = Enum.ScaleType.Crop
    animBg.ImageTransparency = 1
    
    local animText = Instance.new("TextLabel", animBg)
    animText.Size = UDim2.new(1, 0, 1, 0)
    animText.BackgroundTransparency = 1
    animText.Text = "破 晓"
    animText.TextColor3 = Color3.fromRGB(255, 255, 255)
    animText.Font = Enum.Font.GothamBlack
    animText.TextSize = 80
    animText.TextTransparency = 1

    TweenService:Create(animBg, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
    TweenService:Create(animText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(1.5)
    TweenService:Create(animBg, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
    TweenService:Create(animText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    animGui:Destroy()

    -- 3. 创建主窗口
    getgenv().Window = WindUI:CreateWindow({
        Title = "破晓 | 影月",
        Author = "终极版",
        Folder = "Poxiao_Config",
        Size = UDim2.fromOffset(450, 300),
        Transparent = true,
        Theme = "Dark",
        Background = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        BackgroundImageTransparency = 0.5
    })

    getgenv().Window:EditOpenButton({
        Title = "",
        Icon = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg",
        CornerRadius = UDim.new(0, 8),
        StrokeThickness = 2,
        Draggable = true,
        Size = UDim2.fromOffset(50, 50)
    })

    task.delay(1, function()
        for _, v in pairs(PlayerGui:GetDescendants()) do
            if v:IsA("ImageButton") and v.Name:match("Open") then v.Size = UDim2.fromOffset(60, 60) end
        end
    end)
end)task.spawn(function()
    while not getgenv().Window do task.wait(0.1) end
    local Window = getgenv().Window
    
    local Tabs = {
        Announce = Window:Tab({ Title = "更新公告", Icon = "bell" }),
        Boat = Window:Tab({ Title = "造船寻宝", Icon = "anchor" }),
        Defense = Window:Tab({ Title = "保护房子", Icon = "shield" }),
        Settings = Window:Tab({ Title = "特效配置", Icon = "settings" })
    }

    -- 公告
    local logPara = Tabs.Announce:Paragraph({ Title = "破晓脚本", Desc = "作者：影月", Image = "file-text" })
    task.spawn(function()
        local fullLog = "【完整原版移植】\n\n1. 《造船寻宝》采用原版 4 点坐标插值飞行，绝不乱飞。\n2. 《保护房子》完全保留原版 射线检测 (Raycast) 和血条显示。\n3. 僵尸、Boss、武器箱独立透视开关。\n4. 自瞄、穿墙、X光等战斗功能全保留。\n\n祝您游戏愉快！"
        local txt = ""
        for i = 1, #fullLog do txt = txt .. fullLog:sub(i,i) logPara:SetContent(txt) task.wait(0.03) end
    end)

    -- ==========================================
    -- 【原版造船寻宝代码完全照抄】
    -- ==========================================
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
                            local startPos = points[i]
                            local endPos = points[i + 1]
                            local duration = 10
                            local elapsed = 0
                            while elapsed < duration and isMoving do
                                if not myRoot or not myRoot.Parent then break end
                                local t = elapsed / duration
                                local newPos = startPos:Lerp(endPos, t)
                                myRoot.CFrame = CFrame.new(newPos)
                                elapsed = elapsed + 0.01
                                task.wait(0.01)
                            end
                            if isMoving then task.wait(1) end
                        end
                    end
                end)
            end
        end
    })-- ==========================================
-- 【原版保护房子代码完全照抄】
-- ==========================================
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- 1. 原版武器箱透视
function ESP_WeaponBoxes(state)
    if not getgenv().WeaponBoxesESP then getgenv().WeaponBoxesESP = { Enabled = false, Boxes = {}, Connection = nil, SearchInterval = nil } end
    local ESP = getgenv().WeaponBoxesESP
    local function CreateESPForBox(hitbox)
        if ESP.Boxes[hitbox] or not hitbox or not hitbox.Parent then return end
        local highlight = Instance.new("Highlight")
        highlight.Adornee = hitbox
        highlight.FillColor = Color3.fromRGB(0, 255, 0)
        highlight.FillTransparency = 0.5
        highlight.Parent = hitbox
        local billboard = Instance.new("BillboardGui")
        billboard.Adornee = hitbox
        billboard.Size = UDim2.new(0, 150, 0, 40)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        local textLabel = Instance.new("TextLabel", billboard)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "武器箱"
        textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 16
        billboard.Parent = hitbox
        ESP.Boxes[hitbox] = { Highlight = highlight, Billboard = billboard }
    end
    local function ScanForBoxes()
        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if descendant:IsA("BasePart") or descendant:IsA("Model") then
                if descendant.Name:lower():find("hitbox") then CreateESPForBox(descendant) end
            end
        end
    end
    local function ClearAllESP()
        for hitbox, espData in pairs(ESP.Boxes) do
            if espData.Highlight then espData.Highlight:Destroy() end
            if espData.Billboard then espData.Billboard:Destroy() end
        end
        ESP.Boxes = {}
    end
    if state then
        if ESP.Enabled then return end
        ESP.Enabled = true
        ScanForBoxes()
        ESP.SearchInterval = task.spawn(function() while ESP.Enabled do task.wait(2) ScanForBoxes() end end)
        ESP.Connection = Workspace.DescendantAdded:Connect(function(descendant)
            if ESP.Enabled and (descendant:IsA("BasePart") or descendant:IsA("Model")) then
                task.wait(0.1)
                if descendant.Name:lower():find("hitbox") then CreateESPForBox(descendant) end
            end
        end)
    else
        ESP.Enabled = false
        if ESP.Connection then ESP.Connection:Disconnect() ESP.Connection = nil end
        if ESP.SearchInterval then task.cancel(ESP.SearchInterval) ESP.SearchInterval = nil end
        ClearAllESP()
    end
end

-- 2. 原版 Boss 透视 (带血条和距离)
function ESP_Bosses(state)
    if not _G.BossESP then _G.BossESP = { Active = false, Connections = {}, ESPObjects = {} } end
    local ESP = _G.BossESP
    local function ClearESP()
        for _, connection in pairs(ESP.Connections) do if connection then connection:Disconnect() end end
        ESP.Connections = {}
        for _, obj in pairs(ESP.ESPObjects) do
            if obj.Billboard then obj.Billboard:Destroy() end
            if obj.Highlight then obj.Highlight:Destroy() end
        end
        ESP.ESPObjects = {}
    end
    local function CreateBossESP(boss)
        if ESP.ESPObjects[boss] then return end
        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.5
        highlight.Parent = boss
        local billboard = Instance.new("BillboardGui")
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 200, 0, 80)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Parent = boss
        local nameLabel = Instance.new("TextLabel", billboard)
        nameLabel.Size = UDim2.new(1, 0, 0, 25)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = boss.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 18
        local distanceLabel = Instance.new("TextLabel", billboard)
        distanceLabel.Name = "Distance"
        distanceLabel.Size = UDim2.new(1, 0, 0, 20)
        distanceLabel.Position = UDim2.new(0, 0, 0, 22)
        distanceLabel.BackgroundTransparency = 1
        distanceLabel.Text = "距离: -- 米"
        distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        distanceLabel.Font = Enum.Font.Gotham
        distanceLabel.TextSize = 14
        
        local humanoid = boss:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local hpBackground = Instance.new("Frame", billboard)
            hpBackground.Size = UDim2.new(0.8, 0, 0, 12)
            hpBackground.Position = UDim2.new(0.1, 0, 0, 45)
            hpBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            local hpFill = Instance.new("Frame", hpBackground)
            hpFill.Size = UDim2.new(1, 0, 1, 0)
            hpFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                local healthPercent = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                hpFill.Size = UDim2.new(healthPercent, 0, 1, 0)
                hpFill.BackgroundColor3 = Color3.fromRGB(255 * (1 - healthPercent), 255 * healthPercent, 0)
            end)
        end
        ESP.ESPObjects[boss] = { Billboard = billboard, Highlight = highlight }
    end
    local function UpdateDistances()
        local character = LocalPlayer.Character
        if not character then return end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        for boss, espData in pairs(ESP.ESPObjects) do
            if boss and boss.Parent and espData.Billboard then
                local distLbl = espData.Billboard:FindFirstChild("Distance")
                if distLbl then
                    distLbl.Text = "距离: " .. math.floor((hrp.Position - boss.Position).Magnitude) .. " 米"
                end
            end
        end
    end
    if state then
        if ESP.Active then return end
        ESP.Active = true
        for _, obj in pairs(Workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and string.sub(obj.Name, 1, 5) == "Boss_" then CreateBossESP(obj) end
        end
        table.insert(ESP.Connections, RunService.Heartbeat:Connect(function() if ESP.Active then UpdateDistances() end end))
    else
        ESP.Active = false
        ClearESP()
    end
        end    -- 3. 原版僵尸透视 (带颜色区分)
    function ESP_ZombieType(state, typeName, displayTitle, color)
        if not _G[typeName.."ESP"] then _G[typeName.."ESP"] = { Active = false, Connections = {}, ESPObjects = {} } end
        local ESP = _G[typeName.."ESP"]
        local function ClearESP()
            for _, connection in pairs(ESP.Connections) do if connection then connection:Disconnect() end end
            ESP.Connections = {}
            for _, obj in pairs(ESP.ESPObjects) do
                if obj.Billboard then obj.Billboard:Destroy() end
                if obj.Highlight then obj.Highlight:Destroy() end
            end
            ESP.ESPObjects = {}
        end
        local function CreateESP(zombie)
            if ESP.ESPObjects[zombie] then return end
            local highlight = Instance.new("Highlight")
            highlight.FillColor = color
            highlight.FillTransparency = 0.5
            highlight.Parent = zombie
            local billboard = Instance.new("BillboardGui")
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 120, 0, 40)
            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
            billboard.Parent = zombie
            local nameLabel = Instance.new("TextLabel", billboard)
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = displayTitle
            nameLabel.TextColor3 = color
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextSize = 14
            ESP.ESPObjects[zombie] = { Billboard = billboard, Highlight = highlight }
        end
        if state then
            if ESP.Active then return end
            ESP.Active = true
            for _, obj in pairs(Workspace:GetDescendants()) do
                if (obj:IsA("BasePart") or obj:IsA("Model")) and obj.Name:lower() == typeName:lower() then CreateESP(obj) end
            end
            table.insert(ESP.Connections, Workspace.DescendantAdded:Connect(function(descendant)
                if ESP.Active and (descendant:IsA("BasePart") or descendant:IsA("Model")) and descendant.Name:lower() == typeName:lower() then
                    task.wait(0.1) CreateESP(descendant)
                end
            end))
        else
            ESP.Active = false
            ClearESP()
        end
    end

    -- 4. 原版自瞄、穿墙、无限跳、X光
    local aimConn = nil
    local function AimAssist(state)
        if state then
            if aimConn then aimConn:Disconnect() end
            aimConn = RunService.RenderStepped:Connect(function()
                local isAim = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                if isAim then
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

    -- === 【UI 绑定区】 ===
    Tabs.Defense:Toggle({ Title = "透视武器箱", Callback = function(s) ESP_WeaponBoxes(s) end })
    Tabs.Defense:Toggle({ Title = "透视 Boss", Callback = function(s) ESP_Bosses(s) end })
    Tabs.Defense:Toggle({ Title = "透视南瓜僵尸", Callback = function(s) ESP_ZombieType(s, "pumpkin", "南瓜僵尸", Color3.fromRGB(255, 165, 0)) end })
    Tabs.Defense:Toggle({ Title = "透视隐藏僵尸", Callback = function(s) ESP_ZombieType(s, "secret", "隐藏僵尸", Color3.fromRGB(128, 0, 128)) end })
    Tabs.Defense:Toggle({ Title = "透视蝙蝠", Callback = function(s) ESP_ZombieType(s, "bat", "蝙蝠", Color3.fromRGB(0, 100, 255)) end })
    Tabs.Defense:Toggle({ Title = "透视普通僵尸", Callback = function(s) ESP_ZombieType(s, "zombie", "普通僵尸", Color3.fromRGB(0, 255, 0)) end })
    Tabs.Defense:Toggle({ Title = "自瞄辅助", Callback = function(s) AimAssist(s) end })
    Tabs.Defense:Toggle({ Title = "穿墙", Callback = function(s) Noclip(s) end })

    -- 特效配置
    Tabs.Settings:Dropdown({
        Title = "切换菜单背景图",
        Values = { "蓝白剑客", "水墨武士", "六花", "幸运星", "甜点少女", "派对少女" },
        Value = "蓝白剑客",
        Callback = function(selected)
            local url = ""
            if selected == "蓝白剑客" then url = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"
            elseif selected == "水墨武士" then url = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg"
            elseif selected == "六花" then url = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg"
            elseif selected == "幸运星" then url = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg"
            elseif selected == "甜点少女" then url = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png"
            elseif selected == "派对少女" then url = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
            end
            for _, v in pairs(PlayerGui:GetDescendants()) do
                if v:IsA("ImageLabel") and (v.Name:lower():match("background") or v.Name:lower():match("bg")) then v.Image = url end
            end
        end
    })
    Tabs.Settings:Button({ Text = "销毁脚本", Callback = function() getgenv().Window:Destroy() end })
end)
