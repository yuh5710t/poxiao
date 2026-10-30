--═══════════════════════════════════════════════════--
--  破晓 | 作者：影月 | 炫光完美版 1/5
--═══════════════════════════════════════════════════--
if getgenv().PoxiaoLoaded then return end
getgenv().PoxiaoLoaded = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 【1. 炫酷光轴加载动画】
local animGui = Instance.new("ScreenGui", PlayerGui)
animGui.IgnoreGuiInset = true
animGui.DisplayOrder = 999

-- 中间文字
local title = Instance.new("TextLabel", animGui)
title.Size = UDim2.new(0, 400, 0, 60)
title.Position = UDim2.new(0.5, 0, 0.5, 0)
title.AnchorPoint = Vector2.new(0.5, 0.5)
title.BackgroundTransparency = 1
title.Text = "破 晓"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 50
title.TextTransparency = 1

-- 两侧光轴
local lineLeft = Instance.new("Frame", animGui)
lineLeft.Size = UDim2.new(0, 0, 0, 2)
lineLeft.Position = UDim2.new(0.5, -150, 0.5, 0)
lineLeft.AnchorPoint = Vector2.new(1, 0.5)
lineLeft.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

local lineRight = Instance.new("Frame", animGui)
lineRight.Size = UDim2.new(0, 0, 0, 2)
lineRight.Position = UDim2.new(0.5, 150, 0.5, 0)
lineRight.AnchorPoint = Vector2.new(0, 0.5)
lineRight.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- 播放特效
TweenService:Create(lineLeft, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 120, 0, 2)}):Play()
TweenService:Create(lineRight, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 120, 0, 2)}):Play()
TweenService:Create(title, TweenInfo.new(0.6, Enum.EasingStyle.Back), {TextTransparency = 0}):Play()

task.wait(1.2)
TweenService:Create(title, TweenInfo.new(0.4), {TextTransparency = 1, TextSize = 60}):Play()
TweenService:Create(lineLeft, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 2)}):Play()
TweenService:Create(lineRight, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 2)}):Play()
task.wait(0.5)
animGui:Destroy()

-- 【2. 长方形公告框 (居中)】
local noticeGui = Instance.new("ScreenGui", PlayerGui)
noticeGui.IgnoreGuiInset = true
noticeGui.DisplayOrder = 999

local bgFrame = Instance.new("Frame", noticeGui)
bgFrame.Size = UDim2.new(0, 400, 0, 250) -- 长方形
bgFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
bgFrame.AnchorPoint = Vector2.new(0.5, 0.5)
bgFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", bgFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", bgFrame).Color = Color3.fromRGB(200, 50, 50)

local title = Instance.new("TextLabel", bgFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "⚠️ 系统公告 ⚠️"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

local desc = Instance.new("TextLabel", bgFrame)
desc.Size = UDim2.new(1, -40, 0, 120)
desc.Position = UDim2.new(0, 20, 0, 55)
desc.BackgroundTransparency = 1
desc.Text = "【免责声明】\n本脚本由 影月 制作，永久免费！\n如果你是通过付费购买的，那么你被骗了！\n严禁倒卖、圈钱！\n\n【更新内容】\n1. 全新光轴加载特效。\n2. 完美适配手机滑动。\n3. 通用2D透视，保护房子/造船正常。"
desc.TextColor3 = Color3.fromRGB(220, 220, 220)
desc.Font = Enum.Font.Gotham
desc.TextSize = 14
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.TextYAlignment = Enum.TextYAlignment.Top

local btnYes = Instance.new("TextButton", bgFrame)
btnYes.Size = UDim2.new(0, 200, 0, 35)
btnYes.Position = UDim2.new(0.5, 0, 1, -50)
btnYes.AnchorPoint = Vector2.new(0.5, 0)
btnYes.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
btnYes.Text = "我已知晓，进入脚本"
btnYes.TextColor3 = Color3.fromRGB(255, 255, 255)
btnYes.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnYes).CornerRadius = UDim.new(0, 6)btnYes.MouseButton1Click:Connect(function()
    noticeGui:Destroy()

    -- 进度条
    local loadingGui = Instance.new("ScreenGui", PlayerGui)
    loadingGui.IgnoreGuiInset = true
    local loadFrame = Instance.new("Frame", loadingGui)
    loadFrame.Size = UDim2.new(0, 200, 0, 50)
    loadFrame.Position = UDim2.new(1, -220, 1, -70)
    loadFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", loadFrame).Color = Color3.fromRGB(0, 255, 255)
    
    local loadText = Instance.new("TextLabel", loadFrame)
    loadText.Size = UDim2.new(1, 0, 0, 25) loadText.BackgroundTransparency = 1 loadText.Text = "加载核心: 0%" loadText.TextColor3 = Color3.new(1,1,1) loadText.Font = Enum.Font.Code
    local barBg = Instance.new("Frame", loadFrame)
    barBg.Size = UDim2.new(0.9, 0, 0, 8) barBg.Position = UDim2.new(0.05, 0, 0, 30) barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0) barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

    for _, pct in ipairs({25, 60, 85, 100}) do
        loadText.Text = "加载核心: " .. pct .. "%"
        TweenService:Create(barFill, TweenInfo.new(0.3), {Size = UDim2.new(pct / 100, 0, 1, 0)}):Play()
        task.wait(0.2)
    end
    loadText.Text = "✅ 加载成功！"
    task.wait(0.3)
    loadingGui:Destroy()

    -- 引入你发的 UI 源码 (前置依赖)
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")

    local Theme = {
        Accent = Color3.fromRGB(136, 166, 255), Background = Color3.fromRGB(16, 17, 21),
        Surface = Color3.fromRGB(21, 23, 28), SurfaceHover = Color3.fromRGB(27, 30, 36),
        SurfaceActive = Color3.fromRGB(35, 39, 47), Stroke = Color3.fromRGB(126, 152, 224),
        StrokeTransparency = 0.93, Text = Color3.fromRGB(96, 128, 224), SubText = Color3.fromRGB(74, 100, 180),
        Dim = Color3.fromRGB(54, 76, 138), Font = Enum.Font.Gotham, FontBold = Enum.Font.GothamBold,
    }
    local Ease = {
        Fast = TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        Base = TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    }
    local WindUI = { Theme = Theme, Flags = {}, Windows = {} }

    local function create(className, properties, children)
        local instance = Instance.new(className)
        if properties then
            for key, value in next, properties do
                if key ~= "Parent" then instance[key] = value end
            end
        end
        if children then for index = 1, #children do children[index].Parent = instance end end
        if properties and properties.Parent then instance.Parent = properties.Parent end
        return instance
    end
    local function round(instance, radius)
        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, radius or 8) corner.Parent = instance
    end
    local function border(instance, transparency, color)
        local stroke = Instance.new("UIStroke") stroke.Color = color or Theme.Stroke stroke.Transparency = transparency or 0.93 stroke.Parent = instance
    end
    local function tween(instance, properties, info)
        TweenService:Create(instance, info or Ease.Base, properties):Play()
        endlocal function getGuiParent() return LocalPlayer:WaitForChild("PlayerGui") end

function WindUI:Notify(config)
    config = type(config) == "string" and { Content = config } or (config or {})
    local parent = getGuiParent()
    local sg = parent:FindFirstChild("WindUINotify") or create("ScreenGui", { Name = "WindUINotify", Parent = parent, ResetOnSpawn = false })
    local root = sg:FindFirstChild("Stack") or create("Frame", { Name = "Stack", AnchorPoint = Vector2.new(1,0), Position = UDim2.new(1,-18,0,18), Size = UDim2.fromOffset(0,0), BackgroundTransparency = 1, Parent = sg })
    local card = create("Frame", { Size = UDim2.fromOffset(250, 60), BackgroundColor3 = Theme.Surface, Parent = root, Position = UDim2.new(1, 0, 0, #root:GetChildren() * 65) })
    round(card, 10) border(card, 0.9)
    create("TextLabel", { BackgroundTransparency = 1, Position = UDim2.fromOffset(15, 10), Size = UDim2.new(1,-20,0,20), Text = config.Title or "通知", TextColor3 = Theme.Text, Font = Theme.FontBold, TextXAlignment = Enum.TextXAlignment.Left, Parent = card })
    create("TextLabel", { BackgroundTransparency = 1, Position = UDim2.fromOffset(15, 30), Size = UDim2.new(1,-20,0,20), Text = config.Content or "", TextColor3 = Theme.SubText, Font = Theme.Font, TextXAlignment = Enum.TextXAlignment.Left, Parent = card })
    task.delay(config.Duration or 3, function() if card then card:Destroy() end end)
end

function WindUI:CreateWindow(config)
    local width, height = 550, 380
    local screenGui = create("ScreenGui", { Name = "WindUI", ResetOnSpawn = false, Parent = getGuiParent() })
    local root = create("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(width, height), BackgroundColor3 = Theme.Background, Parent = screenGui })
    round(root, 12) border(root, 0.8)
    
    -- 拖动逻辑
    local drag, start, origin = false, Vector2.new(), UDim2.new()
    root.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            drag = true start = input.Position origin = root.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - start
            root.Position = UDim2.new(origin.X.Scale, origin.X.Offset + delta.X, origin.Y.Scale, origin.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then drag = false end
    end)

    create("TextLabel", { BackgroundTransparency = 1, Position = UDim2.fromOffset(20, 15), Size = UDim2.new(1,-40,0,20), Text = config.Title or "Menu", TextColor3 = Theme.Text, Font = Theme.FontBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, Parent = root })
    create("TextLabel", { BackgroundTransparency = 1, Position = UDim2.fromOffset(20, 35), Size = UDim2.new(1,-40,0,15), Text = config.Subtitle or "v1.0", TextColor3 = Theme.Dim, Font = Theme.Font, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = root })

    local side = create("Frame", { Position = UDim2.fromOffset(0, 60), Size = UDim2.new(0, 150, 1, -60), BackgroundTransparency = 1, Parent = root })
    local tabList = create("ScrollingFrame", { Position = UDim2.fromOffset(10, 10), Size = UDim2.new(1, -20, 1, -20), BackgroundTransparency = 1, ScrollBarThickness = 0, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = side })
    create("UIListLayout", { Padding = UDim.new(0, 5), Parent = tabList })

    local content = create("Frame", { Position = UDim2.fromOffset(150, 60), Size = UDim2.new(1, -150, 1, -60), BackgroundTransparency = 1, Parent = root })
    local pageGroup = create("Frame", { Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, Parent = content })

    local window = { Tabs = {}, CurrentTab = nil }

    function window:Tab(tConfig)
        local tab = { Page = create("ScrollingFrame", { Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, Visible = false, ScrollBarThickness = 2, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = pageGroup }) }
        create("UIListLayout", { Padding = UDim.new(0, 10), Parent = tab.Page })
        create("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), Parent = tab.Page })

        local btn = create("TextButton", { Size = UDim2.new(1,0,0,35), BackgroundColor3 = Theme.Surface, Text = tConfig.Title, TextColor3 = Theme.SubText, Font = Theme.Font, Parent = tabList })
        round(btn, 8)

        function tab:Select()
            for _, t in ipairs(window.Tabs) do t.Page.Visible = false t.Button.BackgroundColor3 = Theme.Surface t.Button.TextColor3 = Theme.SubText end
            tab.Page.Visible = true btn.BackgroundColor3 = Theme.SurfaceActive btn.TextColor3 = Theme.Text
        end
        tab.Button = btn
        btn.MouseButton1Click:Connect(function() tab:Select() end)
        table.insert(window.Tabs, tab)
        if #window.Tabs == 1 then tab:Select() end
        return tab
    end
    return window
end
getgenv().WindUI = WindUI
getgenv().MainWindow = WindUI:CreateWindow({ Title = "破晓 | 影月", Subtitle = "满血复活版" })
task.wait(1)local Tabs = {
    General = getgenv().MainWindow:Tab({ Title = "通用功能" }),
    Boat = getgenv().MainWindow:Tab({ Title = "造船寻宝" }),
    Defense = getgenv().MainWindow:Tab({ Title = "保护房子" }),
    Settings = getgenv().MainWindow:Tab({ Title = "特效配置" })
}

pcall(function()
    local function createLabel(text, parent)
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 25) lbl.BackgroundTransparency = 1
        lbl.Text = text lbl.TextColor3 = Color3.fromRGB(150,150,150) lbl.TextXAlignment = Enum.TextXAlignment.Left lbl.TextSize = 14
        lbl.Parent = parent
    end

    createLabel("移动速度 (输入并回车)", Tabs.General.Page)
    local speedInput = Instance.new("TextBox")
    speedInput.Size = UDim2.new(1, 0, 0, 30) speedInput.BackgroundColor3 = Color3.fromRGB(30,30,40) speedInput.TextColor3 = Color3.new(1,1,1) speedInput.Text = "16" speedInput.Parent = Tabs.General.Page
    speedInput.FocusLost:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedInput.Text) or 16
        end
    end)

    createLabel("跳跃高度 (输入并回车)", Tabs.General.Page)
    local jumpInput = Instance.new("TextBox")
    jumpInput.Size = UDim2.new(1, 0, 0, 30) jumpInput.BackgroundColor3 = Color3.fromRGB(30,30,40) jumpInput.TextColor3 = Color3.new(1,1,1) jumpInput.Text = "50" jumpInput.Parent = Tabs.General.Page
    jumpInput.FocusLost:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = tonumber(jumpInput.Text) or 50
        end
    end)
    
    local espOn = false
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,30) btn.Text = "开启 2D 射线透视" btn.BackgroundColor3 = Color3.fromRGB(30,30,40) btn.TextColor3 = Color3.new(1,1,1) btn.Parent = Tabs.General.Page
    btn.MouseButton1Click:Connect(function() espOn = not espOn btn.Text = "2D透视: " .. (espOn and "开" or "关") end)

    local Drawings = {}
    local cam = workspace.CurrentCamera
    RunService.RenderStepped:Connect(function()
        for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end
        table.clear(Drawings)
        if not espOn then return end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, on = cam:WorldToViewportPoint(p.Character.Head.Position)
                if on then
                    local line = Drawing.new("Line") line.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y) line.To = Vector2.new(pos.X, pos.Y) line.Color = Color3.fromRGB(255,0,0) line.Thickness = 1 line.Visible = true table.insert(Drawings, line)
                    local text = Drawing.new("Text") text.Text = p.Name text.Size = 14 text.Center = true text.Outline = true text.Color = Color3.fromRGB(255,0,0) text.Position = Vector2.new(pos.X, pos.Y - 20) text.Visible = true table.insert(Drawings, text)
                end
            end
        end
    end)
end)    pcall(function()
        -- 造船
        local moveLoop, isMoving = nil, false
        local points = {
            Vector3.new(-43.128983, 66.641129, 1123.932861), Vector3.new(-46.607533, 49.785690, 8677.564453),
            Vector3.new(-53.364597, -289.227875, 8735.583984), Vector3.new(-54.343830, -358.203461, 9490.367188)
        }
        local boatBtn = Instance.new("TextButton")
        boatBtn.Size = UDim2.new(1, 0, 0, 35) boatBtn.BackgroundColor3 = Color3.fromRGB(30,30,40) boatBtn.TextColor3 = Color3.new(1,1,1) boatBtn.Text = "开启自动刷钱" boatBtn.Parent = Tabs.Boat.Page
        boatBtn.MouseButton1Click:Connect(function()
            isMoving = not isMoving
            boatBtn.Text = "自动刷钱: " .. (isMoving and "开启中" or "关闭")
            if moveLoop then task.cancel(moveLoop) moveLoop = nil end
            if isMoving then
                moveLoop = task.spawn(function()
                    while isMoving do
                        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
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
        end)

        -- 保护房子
        local defFolder = Instance.new("Folder", PlayerGui) defFolder.Name = "PoxiaoDef"
        local defBtn = Instance.new("TextButton")
        defBtn.Size = UDim2.new(1, 0, 0, 35) defBtn.BackgroundColor3 = Color3.fromRGB(30,30,40) defBtn.TextColor3 = Color3.new(1,1,1) defBtn.Text = "开启透视武器箱" defBtn.Parent = Tabs.Defense.Page
        local defOn = false
        defBtn.MouseButton1Click:Connect(function()
            defOn = not defOn
            defBtn.Text = "透视武器箱: " .. (defOn and "开启中" or "关闭")
            if defOn then
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("hitbox") and not defFolder:FindFirstChild(v.Name) then
                        local hl = Instance.new("Highlight", defFolder) hl.Name = v.Name hl.Adornee = v hl.FillColor = Color3.fromRGB(0,255,0)
                    end
                end
            else
                for _, v in pairs(defFolder:GetChildren()) do v:Destroy() end
            end
        end)
    end)

    pcall(function()
        local bgUrls = {
            ["蓝白剑客"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
            ["水墨武士"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg",
            ["六花"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg",
            ["幸运星"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg",
            ["甜点少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png",
            ["派对少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
        }

        for name, url in pairs(bgUrls) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30) btn.BackgroundColor3 = Color3.fromRGB(30,30,40) btn.TextColor3 = Color3.new(1,1,1) btn.Text = "切换背景: " .. name btn.Parent = Tabs.Settings.Page
            btn.MouseButton1Click:Connect(function()
                local oldBg = getgenv().MainWindow.Root:FindFirstChild("DynamicBg")
                if oldBg then oldBg:Destroy() end
                
                local img = Instance.new("ImageLabel", getgenv().MainWindow.Root)
                img.Name = "DynamicBg"
                img.Size = UDim2.fromScale(1,1) img.ZIndex = 0 img.Image = url img.ScaleType = Enum.ScaleType.Crop
                Instance.new("UICorner", img).CornerRadius = UDim.new(0, 12)
                img.Parent = getgenv().MainWindow.Root
                getgenv().MainWindow.Root.BackgroundTransparency = 0.4
                
                for _, child in pairs(getgenv().MainWindow.Root:GetChildren()) do
                    if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("ScrollingFrame") then child.ZIndex = 2 end
                end
            end)
        end
    end)
end)
