--═══════════════════════════════════════════════════--
-- 破晓 | 作者：影月 | 纯净开关丝滑版 1/3
--═══════════════════════════════════════════════════--
if getgenv().PoxiaoLoaded then return end
getgenv().PoxiaoLoaded = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. 纯净公告框
local noticeGui = Instance.new("ScreenGui", PlayerGui)
noticeGui.IgnoreGuiInset = true noticeGui.DisplayOrder = 999
local noticeFrame = Instance.new("Frame", noticeGui)
noticeFrame.Size = UDim2.new(0, 380, 0, 260) noticeFrame.Position = UDim2.fromScale(0.5, 0.5) noticeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
noticeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25) Instance.new("UICorner", noticeFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", noticeFrame).Color = Color3.fromRGB(200, 50, 50)

local titleBg = Instance.new("TextLabel", noticeFrame)
titleBg.Size = UDim2.new(1, 0, 0, 45) titleBg.BackgroundTransparency = 1 titleBg.Text = "⚠️ 破晓系统公告 ⚠️" titleBg.TextColor3 = Color3.fromRGB(255, 50, 50) titleBg.Font = Enum.Font.GothamBold titleBg.TextSize = 22
local descText = Instance.new("TextLabel", noticeFrame)
descText.Size = UDim2.new(1, -30, 0, 120) descText.Position = UDim2.new(0, 15, 0, 50) descText.BackgroundTransparency = 1
descText.Text = "【严正声明】\n本脚本由 影月 制作，永久免费！\n如果你是通过付费购买的，那么你被骗了！\n严禁倒卖、圈钱！\n\n【更新内容】\n1. 去除动画，秒进菜单。\n2. 增加左侧大号【开关】悬浮球。\n3. 修复背景图切换与删除。\n4. 满血 2D 透视与服务器功能。"
descText.TextColor3 = Color3.fromRGB(220, 220, 220) descText.Font = Enum.Font.Gotham descText.TextSize = 14 descText.TextXAlignment = Enum.TextXAlignment.Left descText.TextYAlignment = Enum.TextYAlignment.Top

local confirmBtn = Instance.new("TextButton", noticeFrame)
confirmBtn.Size = UDim2.new(0, 220, 0, 40) confirmBtn.Position = UDim2.new(0.5, 0, 1, -50) confirmBtn.AnchorPoint = Vector2.new(0.5, 0)
confirmBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30) confirmBtn.Text = "确定进入" confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255) confirmBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)

-- 2. 进度条 + 引用你发的 UI 源码
confirmBtn.MouseButton1Click:Connect(function()
    noticeGui:Destroy()
    local loadingGui = Instance.new("ScreenGui", PlayerGui)
    local loadBox = Instance.new("Frame", loadingGui)
    loadBox.Size = UDim2.new(0, 220, 0, 60) loadBox.Position = UDim2.new(1, -240, 1, -80) loadBox.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new("UICorner", loadBox).CornerRadius = UDim.new(0, 8)
    local barBg = Instance.new("Frame", loadBox)
    barBg.Size = UDim2.new(0.9, 0, 0, 8) barBg.Position = UDim2.new(0.05, 0, 0, 35) barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0) barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

    TweenService:Create(barFill, TweenInfo.new(0.5), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(0.6) loadingGui:Destroy()

    -- 引入你提供的源码 (基础函数)
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
    local WindUI = { Theme = Theme }
    local function create(className, properties, children)
        local instance = Instance.new(className)
        if properties then
            for key, value in next, properties do if key ~= "Parent" then instance[key] = value end end
        end
        if children then for index = 1, #children do children[index].Parent = instance end end
        if properties and properties.Parent then instance.Parent = properties.Parent end
        return instance
    end
    local function round(instance, radius)
        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, radius or 8) corner.Parent = instance
    end
    local function tween(instance, properties, info)
        TweenService:Create(instance, info or Ease.Base, properties):Play()
        end-- 创建主窗口与悬浮开关
local width, height = 550, 380
local screenGui = create("ScreenGui", { Name = "WindUI", ResetOnSpawn = false, Parent = PlayerGui })

-- 【核心修复】左上角巨大的悬浮开关
local toggleBtn = create("TextButton", {
    Name = "ToggleButton",
    Size = UDim2.fromOffset(60, 60),
    Position = UDim2.fromOffset(20, 120),
    BackgroundColor3 = Color3.fromRGB(180, 30, 30),
    Text = "开关",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    ZIndex = 100,
    Parent = screenGui
})
round(toggleBtn, 30)
local toggleStroke = Instance.new("UIStroke", toggleBtn)
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Thickness = 2

local root = create("Frame", { 
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), 
    Size = UDim2.fromOffset(width, height), BackgroundColor3 = Theme.Background, Parent = screenGui,
    Visible = false
})
round(root, 12)
local rootStroke = Instance.new("UIStroke", root) rootStroke.Color = Theme.Stroke rootStroke.Transparency = 0.8

-- 开关点击逻辑
toggleBtn.MouseButton1Click:Connect(function()
    root.Visible = not root.Visible
end)

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

-- 标题栏与侧边栏
create("TextLabel", { BackgroundTransparency = 1, Position = UDim2.fromOffset(20, 15), Size = UDim2.new(1,-40,0,20), Text = "破晓 | 影月", TextColor3 = Theme.Text, Font = Theme.FontBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, Parent = root })
local side = create("Frame", { Position = UDim2.fromOffset(0, 60), Size = UDim2.new(0, 150, 1, -60), BackgroundTransparency = 1, Parent = root })
local tabList = create("ScrollingFrame", { Position = UDim2.fromOffset(10, 10), Size = UDim2.new(1, -20, 1, -20), BackgroundTransparency = 1, ScrollBarThickness = 0, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, Parent = side })
create("UIListLayout", { Padding = UDim.new(0, 5), Parent = tabList })

local content = create("Frame", { Position = UDim2.fromOffset(150, 60), Size = UDim2.new(1, -150, 1, -60), BackgroundTransparency = 1, Parent = root })
local pageGroup = create("Frame", { Size = UDim2.fromScale(1,1), BackgroundTransparency = 1, Parent = content })

local window = { Tabs = {} }
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

local Tabs = {
    General = window:Tab({ Title = "通用功能" }),
    Boat = window:Tab({ Title = "造船寻宝" }),
    Defense = window:Tab({ Title = "保护房子" }),
    Settings = window:Tab({ Title = "特效配置" })
}
task.wait(0.5)    -- 【通用功能】
    local function createLabel(text, parent)
        local lbl = create("TextLabel", { Size = UDim2.new(1, 0, 0, 25), BackgroundTransparency = 1, Text = text, TextColor3 = Theme.SubText, TextXAlignment = Enum.TextXAlignment.Left, TextSize = 14, Parent = parent })
    end

    createLabel("移动速度", Tabs.General.Page)
    local speedBox = create("TextBox", { Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Surface, TextColor3 = Color3.new(1,1,1), Text = "16", Parent = Tabs.General.Page })
    round(speedBox, 6)
    speedBox.FocusLost:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedBox.Text) or 16
        end
    end)

    createLabel("跳跃高度", Tabs.General.Page)
    local jumpBox = create("TextBox", { Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Surface, TextColor3 = Color3.new(1,1,1), Text = "50", Parent = Tabs.General.Page })
    round(jumpBox, 6)
    jumpBox.FocusLost:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = tonumber(jumpBox.Text) or 50
        end
    end)

    -- 【2D 透视】
    local espOn = false
    local espBtn = create("TextButton", { Size = UDim2.new(1,0,0,35), BackgroundColor3 = Theme.Surface, TextColor3 = Theme.Text, Text = "开启 2D 射线透视", Parent = Tabs.General.Page })
    round(espBtn, 6)
    local Drawings = {}
    local cam = workspace.CurrentCamera
    espBtn.MouseButton1Click:Connect(function()
        espOn = not espOn
        espBtn.Text = "2D透视: " .. (espOn and "开启" or "关闭")
        if not espOn then
            for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end
            table.clear(Drawings)
        end
    end)

    RunService.RenderStepped:Connect(function()
        if not espOn then return end
        for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end
        table.clear(Drawings)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, on = cam:WorldToViewportPoint(p.Character.Head.Position)
                if on then
                    local line = Drawing.new("Line") line.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y) line.To = Vector2.new(pos.X, pos.Y) line.Color = Color3.fromRGB(255,0,0) line.Visible = true table.insert(Drawings, line)
                    local text = Drawing.new("Text") text.Text = p.Name text.Size = 14 text.Center = true text.Outline = true text.Color = Color3.fromRGB(255,0,0) text.Position = Vector2.new(pos.X, pos.Y - 20) text.Visible = true table.insert(Drawings, text)
                end
            end
        end
    end)

    -- 【造船寻宝】
    local moveLoop, isMoving = nil, false
    local points = {Vector3.new(-43.1, 66.6, 1123.9), Vector3.new(-46.6, 49.7, 8677.5), Vector3.new(-53.3, -289.2, 8735.5), Vector3.new(-54.3, -358.2, 9490.3)}
    local boatBtn = create("TextButton", { Size = UDim2.new(1,0,0,35), BackgroundColor3 = Theme.Surface, TextColor3 = Theme.Text, Text = "自动刷钱 (路径飞行)", Parent = Tabs.Boat.Page })
    round(boatBtn, 6)
    boatBtn.MouseButton1Click:Connect(function()
        isMoving = not isMoving
        boatBtn.Text = "刷钱: " .. (isMoving and "开启" or "关闭")
        if moveLoop then task.cancel(moveLoop) end
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

    -- 【保护房子】
    local defBtn = create("TextButton", { Size = UDim2.new(1,0,0,35), BackgroundColor3 = Theme.Surface, TextColor3 = Theme.Text, Text = "开启武器箱透视", Parent = Tabs.Defense.Page })
    round(defBtn, 6)
    local defOn = false
    defBtn.MouseButton1Click:Connect(function()
        defOn = not defOn
        defBtn.Text = "武器箱透视: " .. (defOn and "开启" or "关闭")
        if defOn then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name:lower():find("hitbox") and not v:FindFirstChild("PoxiaoHL") then
                    local hl = Instance.new("Highlight", v) hl.Name = "PoxiaoHL" hl.FillColor = Color3.fromRGB(0,255,0) hl.FillTransparency = 0.5
                end
            end
        else
            for _, v in pairs(PlayerGui:GetDescendants()) do if v.Name == "PoxiaoHL" then v:Destroy() end end
            for _, v in pairs(workspace:GetDescendants()) do if v.Name == "PoxiaoHL" then v:Destroy() end end
        end
    end)

    -- 【特效配置】（背景替换与删除）
    local bgUrls = {
        ["蓝白剑客"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
        ["水墨武士"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg",
        ["六花"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg",
        ["幸运星"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg",
        ["甜点少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png",
        ["派对少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
    }

    local currentBg = create("ImageLabel", {
        Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 0, Visible = false, Parent = root
    })
    round(currentBg, 12)

    for name, url in pairs(bgUrls) do
        local btn = create("TextButton", { Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Surface, TextColor3 = Theme.Text, Text = "换背景: " .. name, Parent = Tabs.Settings.Page })
        round(btn, 6)
        btn.MouseButton1Click:Connect(function()
            currentBg.Image = url
            currentBg.Visible = true
            root.BackgroundTransparency = 0.5
        end)
    end

    local clearBtn = create("TextButton", { Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Theme.Danger, TextColor3 = Color3.new(1,1,1), Text = "删除背景图", Parent = Tabs.Settings.Page })
    round(clearBtn, 6)
    clearBtn.MouseButton1Click:Connect(function()
        currentBg.Visible = false
        root.BackgroundTransparency = 0
    end)
end)
