--═══════════════════════════════════════════════════--
-- 破晓 | 作者：影月 | 奢华尊享版 1/4
--═══════════════════════════════════════════════════--
if getgenv().PoxiaoLoaded then return end
getgenv().PoxiaoLoaded = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. 尊享光晕启动动画
local animGui = Instance.new("ScreenGui", PlayerGui)
animGui.IgnoreGuiInset = true animGui.DisplayOrder = 999
local animText = Instance.new("TextLabel", animGui)
animText.Size = UDim2.new(0, 400, 0, 80) animText.Position = UDim2.fromScale(0.5, 0.5) animText.AnchorPoint = Vector2.new(0.5, 0.5)
animText.BackgroundTransparency = 1 animText.Text = "破 晓" animText.TextColor3 = Color3.fromRGB(255, 255, 255) animText.Font = Enum.Font.GothamBlack animText.TextSize = 60 animText.TextTransparency = 1
local glow = Instance.new("UIStroke", animText) glow.Color = Color3.fromRGB(200, 30, 30) glow.Thickness = 6 glow.Transparency = 1

TweenService:Create(animText, TweenInfo.new(0.6, Enum.EasingStyle.Back), {TextTransparency = 0}):Play()
TweenService:Create(glow, TweenInfo.new(0.6), {Transparency = 0.2}):Play()
task.wait(1.2)
TweenService:Create(animText, TweenInfo.new(0.4), {TextTransparency = 1, TextSize = 100}):Play()
TweenService:Create(glow, TweenInfo.new(0.4), {Transparency = 1}):Play()
task.wait(0.5) animGui:Destroy()

-- 2. 防圈钱公告
local noticeGui = Instance.new("ScreenGui", PlayerGui)
noticeGui.IgnoreGuiInset = true noticeGui.DisplayOrder = 999
local noticeFrame = Instance.new("Frame", noticeGui)
noticeFrame.Size = UDim2.new(0, 380, 0, 250) noticeFrame.Position = UDim2.fromScale(0.5, 0.5) noticeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
noticeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25) Instance.new("UICorner", noticeFrame).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", noticeFrame).Color = Color3.fromRGB(200, 50, 50)

local titleBg = Instance.new("TextLabel", noticeFrame)
titleBg.Size = UDim2.new(1, 0, 0, 45) titleBg.BackgroundTransparency = 1 titleBg.Text = "⚠️ 破晓系统公告 ⚠️" titleBg.TextColor3 = Color3.fromRGB(255, 50, 50) titleBg.Font = Enum.Font.GothamBold titleBg.TextSize = 22
local descText = Instance.new("TextLabel", noticeFrame)
descText.Size = UDim2.new(1, -30, 0, 110) descText.Position = UDim2.new(0, 15, 0, 50) descText.BackgroundTransparency = 1
descText.Text = "【严正声明】\n本脚本由 影月 制作，永久免费！\n如果发现倒卖，请立刻举报！\n\n【尊享特权】\n底层暴力换图，绝不白屏。\n全功能拉满，无搜索框。"
descText.TextColor3 = Color3.fromRGB(220, 220, 220) descText.Font = Enum.Font.Gotham descText.TextSize = 14 descText.TextXAlignment = Enum.TextXAlignment.Left

local confirmBtn = Instance.new("TextButton", noticeFrame)
confirmBtn.Size = UDim2.new(0, 200, 0, 40) confirmBtn.Position = UDim2.new(0.5, 0, 1, -50) confirmBtn.AnchorPoint = Vector2.new(0.5, 0)
confirmBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30) confirmBtn.Text = "确定进入" confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255) confirmBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)confirmBtn.MouseButton1Click:Connect(function()
    noticeGui:Destroy()
    local loadGui = Instance.new("ScreenGui", PlayerGui)
    local barBg = Instance.new("Frame", loadGui)
    barBg.Size = UDim2.new(0.5, 0, 0, 8) barBg.Position = UDim2.fromScale(0.5, 0.5) barBg.AnchorPoint = Vector2.new(0.5, 0.5) barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0, 0, 1, 0) barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    TweenService:Create(barFill, TweenInfo.new(0.5), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(0.6) loadGui:Destroy()

    -- 引入丝滑 WindUI
    local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
    getgenv().Window = WindUI:CreateWindow({
        Title = "破晓 | 影月", Folder = "Poxiao_Config", Size = UDim2.fromOffset(500, 320), Transparent = true, Theme = "Dark"
    })
    getgenv().Window:EditOpenButton({ Title = "菜单", Icon = "rbxassetid://81944629903864", Draggable = true })

    -- 【核心保证：底层贴图系统，绝不可能白屏】
    local bgGui = Instance.new("ScreenGui", PlayerGui)
    bgGui.Name = "PoxiaoBgLayer" bgGui.DisplayOrder = -1 bgGui.IgnoreGuiInset = true
    local bgImage = Instance.new("ImageLabel", bgGui)
    bgImage.Size = UDim2.new(1, 0, 1, 0) bgImage.BackgroundColor3 = Color3.fromRGB(15, 15, 20) -- 默认深渊底色
    bgImage.ImageTransparency = 0.4 bgImage.ScaleType = Enum.ScaleType.Crop bgImage.Visible = true

    task.wait(1)

    local Tabs = {
        General = getgenv().Window:Tab({ Title = "通用功能", Icon = "globe" }),
        Boat = getgenv().Window:Tab({ Title = "造船寻宝", Icon = "anchor" }),
        Defense = getgenv().Window:Tab({ Title = "保护房子", Icon = "shield" }),
        Scripts = getgenv().Window:Tab({ Title = "外部脚本", Icon = "code" }),
        Settings = getgenv().Window:Tab({ Title = "特效换图", Icon = "image" })
        }Tabs.General:Slider({ Title = "移动速度", Min = 16, Max = 300, Default = 16, Callback = function(v) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = v end 
end })
Tabs.General:Slider({ Title = "跳跃高度", Min = 50, Max = 300, Default = 50, Callback = function(v) 
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.JumpPower = v end 
end })

-- 2D 射线透视
local espOn = false
local Drawings = {}
Tabs.General:Toggle({ Title = "开启 2D 射线透视", Value = false, Callback = function(s) 
    espOn = s 
    if not s then for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end table.clear(Drawings) end
end })
RunService.RenderStepped:Connect(function()
    if not espOn then return end
    for _, v in pairs(Drawings) do pcall(function() v:Remove() end) end table.clear(Drawings)
    local cam = workspace.CurrentCamera
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

-- 换图区域
local bgUrls = {
    ["蓝白剑客"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg",
    ["水墨武士"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350411076_903.2a8b00.jpg",
    ["六花"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg",
    ["幸运星"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350983512_539.46bd11.jpg",
    ["甜点少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351022278_431.f2237d.png",
    ["派对少女"] = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793351024719_669.c6b066.png"
}

for name, url in pairs(bgUrls) do
    Tabs.Settings:Button({
        Title = "切换背景：" .. name,
        Callback = function()
            bgImage.Image = url
            WindUI:Notify({ Title = "成功", Content = "已切换：" .. name, Icon = "check", Duration = 2 })
        end
    })
end

Tabs.Settings:Button({
    Title = "❌ 删除背景图 (恢复默认)",
    Callback = function()
        bgImage.Image = ""
        WindUI:Notify({ Title = "已删除", Content = "恢复默认底图", Icon = "trash", Duration = 2 })
    end
})    -- 【造船寻宝】原版坐标
    local moveLoop, isMoving = nil, false
    local points = {Vector3.new(-43.1, 66.6, 1123.9), Vector3.new(-46.6, 49.7, 8677.5), Vector3.new(-53.3, -289.2, 8735.5), Vector3.new(-54.3, -358.2, 9490.3)}
    Tabs.Boat:Toggle({ Title = "自动刷钱 (路径飞行)", Value = false, Callback = function(state)
        isMoving = state
        if moveLoop then task.cancel(moveLoop) moveLoop = nil end
        if state then
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
    end })

    -- 【保护房子】透视
    local defOn = false
    Tabs.Defense:Toggle({ Title = "透视武器箱", Value = false, Callback = function(s)
        defOn = s
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
    end })

    -- 【豪华外部脚本】（占位，显示功能丰富）
    Tabs.Scripts:Button({ Title = "XK HUB", Callback = function() loadstring(game:HttpGet('https://github.com/devslopo/DVES/raw/main/XK%20Hub'))() end })
    Tabs.Scripts:Button({ Title = "沙脚本", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/114514lzkill/ShaHUB/refs/heads/main/ShaHUB"))() end })
    Tabs.Scripts:Button({ Title = "FE飞行", Callback = function() loadstring(game:HttpGet("https://pastefy.app/GcjGkx1H/raw"))() end })
end)
