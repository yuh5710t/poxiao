local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

local function pickGuiParent()
    local test = Instance.new("ScreenGui")
    local ok = pcall(function() test.Parent = CoreGui end)
    test:Destroy()
    return ok and CoreGui or playerGui
end
local guiParent = pickGuiParent()

local function newCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = radius or UDim.new(0, 10)
    c.Parent = parent
    return c
end

local Theme = {
    BgColor = Color3.fromRGB(15, 12, 20),
    PanelColor = Color3.fromRGB(22, 18, 30),
    GlowColor = Color3.fromRGB(160, 50, 255),
    TextColor = Color3.fromRGB(240, 240, 255),
    SubText = Color3.fromRGB(150, 150, 160)
}

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "ReyznLikeUI"
mainGui.ResetOnSpawn = false
mainGui.IgnoreGuiInset = true
mainGui.DisplayOrder = 999999
mainGui.Parent = guiParent

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.Size = UDim2.new(0.8, 0, 0.6, 0)
mainFrame.BackgroundColor3 = Theme.BgColor
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = mainGui
newCorner(mainFrame, UDim.new(0, 16))

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Theme.GlowColor
mainStroke.Thickness = 2
mainStroke.Transparency = 0.2
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Parent = mainFrame

-- 左侧侧边栏
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0.25, 0, 1, 0)
sidebar.BackgroundColor3 = Theme.PanelColor
sidebar.BackgroundTransparency = 0.3
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame
newCorner(sidebar, UDim.new(0, 16))

local sideStroke = Instance.new("UIStroke")
sideStroke.Color = Theme.GlowColor
sideStroke.Thickness = 1.5
sideStroke.Transparency = 0.5
sideStroke.Parent = sidebar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 60)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "👑 影月系统"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 22
titleLabel.ZIndex = 2
titleLabel.Parent = sidebar

local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(0.75, 0, 1, 0)
contentArea.Position = UDim2.new(0.25, 0, 0, 0)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, -30, 0, 60)
topBar.Position = UDim2.new(0, 15, 0, 15)
topBar.BackgroundColor3 = Theme.PanelColor
topBar.BackgroundTransparency = 0.5
topBar.BorderSizePixel = 0
topBar.ZIndex = 2
topBar.Parent = contentArea
newCorner(topBar, UDim.new(0, 12))

local userIcon = Instance.new("ImageLabel")
userIcon.Size = UDim2.fromOffset(40, 40)
userIcon.Position = UDim2.fromOffset(10, 10)
userIcon.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
userIcon.Image = "rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=150&h=150"
userIcon.ZIndex = 2
userIcon.Parent = topBar
newCorner(userIcon, UDim.new(1, 0))

local userInfo = Instance.new("TextLabel")
userInfo.Size = UDim2.new(0.5, 0, 1, 0)
userInfo.Position = UDim2.new(0.1, 10, 0, 0)
userInfo.BackgroundTransparency = 1
userInfo.Text = "玩家: " .. LocalPlayer.DisplayName
userInfo.TextColor3 = Theme.TextColor
userInfo.Font = Enum.Font.GothamMedium
userInfo.TextSize = 16
userInfo.TextXAlignment = Enum.TextXAlignment.Left
userInfo.ZIndex = 2
userInfo.Parent = topBarlocal scrollPage = Instance.new("ScrollingFrame")
scrollPage.Size = UDim2.new(1, -30, 1, -90)
scrollPage.Position = UDim2.new(0, 15, 0, 85)
scrollPage.BackgroundTransparency = 1
scrollPage.ScrollBarThickness = 2
scrollPage.ScrollBarImageColor3 = Theme.GlowColor
scrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollPage.Parent = contentArea

local pageLayout = Instance.new("UIListLayout")
pageLayout.Padding = UDim.new(0, 10)
pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
pageLayout.Parent = scrollPage

local navContainer = Instance.new("Frame")
navContainer.Size = UDim2.new(1, -20, 1, -80)
navContainer.Position = UDim2.new(0, 10, 0, 60)
navContainer.BackgroundTransparency = 1
navContainer.ZIndex = 2
navContainer.Parent = sidebar

local navLayout = Instance.new("UIListLayout")
navLayout.Padding = UDim.new(0, 10)
navLayout.SortOrder = Enum.SortOrder.LayoutOrder
navLayout.Parent = navContainer

local pages = {}
local currentBtn = nil

local function switchPage(pageId, btn)
    if currentBtn then
        TweenService:Create(currentBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.5}):Play()
        currentBtn.TextColor3 = Theme.SubText
    end
    currentBtn = btn
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
    btn.TextColor3 = Theme.TextColor

    for _, child in ipairs(scrollPage:GetChildren()) do
        if child:IsA("Frame") then
            child.Visible = false
        end
    end
    if pages[pageId] then
        pages[pageId].Visible = true
    end
end

local function createNavBtn(name, pageId, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Theme.PanelColor
    btn.BackgroundTransparency = 0.5
    btn.Text = "   " .. name
    btn.TextColor3 = Theme.SubText
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 15
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.ZIndex = 2
    btn.Parent = navContainer
    newCorner(btn, UDim.new(0, 8))
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Theme.GlowColor
    stroke.Thickness = 1
    stroke.Transparency = 0.7
    stroke.Parent = btn

    btn.MouseButton1Click:Connect(function()
        switchPage(pageId, btn)
    end)
    return btn
end

-- 全中文标签
local tabs = {
    {Name = "主页", Id = "main"},
    {Name = "视觉", Id = "visuals"},
    {Name = "脚本", Id = "scripts"},
    {Name = "设置", Id = "settings"}
}

for i, tab in ipairs(tabs) do
    local page = Instance.new("Frame")
    page.Name = tab.Id
    page.Size = UDim2.new(1, 0, 0, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.LayoutOrder = i
    page.Parent = scrollPage
    
    local pLayout = Instance.new("UIListLayout")
    pLayout.Padding = UDim.new(0, 8)
    pLayout.Parent = page
    pLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.Size = UDim2.new(1, 0, 0, pLayout.AbsoluteContentSize.Y)
    end)
    
    pages[tab.Id] = page
    
    local btn = createNavBtn(tab.Name, tab.Id, i)
    if i == 1 then
        task.wait(0.1)
        switchPage(tab.Id, btn)
    end
end

local testBtn = Instance.new("TextButton")
testBtn.Size = UDim2.new(1, 0, 0, 45)
testBtn.BackgroundColor3 = Theme.PanelColor
testBtn.BackgroundTransparency = 0.3
testBtn.Text = "测试功能按钮"
testBtn.TextColor3 = Theme.TextColor
testBtn.Font = Enum.Font.GothamBold
testBtn.Parent = pages["main"]
newCorner(testBtn, UDim.new(0, 8))

-- 图片贴图特效
local SIDEBAR_BG = "https://i.ibb.co/HDCKdNSd/image.png"
local TOPBAR_BG  = "https://i.ibb.co/p6wd6mwd/image.png"
local MAIN_BG    = "https://i.ibb.co/DHnRRvRy/image.png"

local sideBgImage = Instance.new("ImageLabel")
sideBgImage.Size = UDim2.fromScale(1, 1)
sideBgImage.BackgroundTransparency = 1
sideBgImage.Image = SIDEBAR_BG
sideBgImage.ScaleType = Enum.ScaleType.Crop
sideBgImage.ZIndex = 0
sideBgImage.Parent = sidebar
newCorner(sideBgImage, UDim.new(0, 16))

local sideOverlay = Instance.new("Frame")
sideOverlay.Size = UDim2.fromScale(1, 1)
sideOverlay.BackgroundColor3 = Theme.BgColor
sideOverlay.BackgroundTransparency = 0.5
sideOverlay.BorderSizePixel = 0
sideOverlay.ZIndex = 1
sideOverlay.Parent = sidebar
newCorner(sideOverlay, UDim.new(0, 16))

local topBarBgImage = Instance.new("ImageLabel")
topBarBgImage.Size = UDim2.fromScale(1, 1)
topBarBgImage.BackgroundTransparency = 1
topBarBgImage.Image = TOPBAR_BG
topBarBgImage.ScaleType = Enum.ScaleType.Crop
topBarBgImage.ZIndex = 0
topBarBgImage.Parent = topBar
newCorner(topBarBgImage, UDim.new(0, 12))

local topBarOverlay = Instance.new("Frame")
topBarOverlay.Size = UDim2.fromScale(1, 1)
topBarOverlay.BackgroundColor3 = Theme.BgColor
topBarOverlay.BackgroundTransparency = 0.5
topBarOverlay.BorderSizePixel = 0
topBarOverlay.ZIndex = 1
topBarOverlay.Parent = topBar
newCorner(topBarOverlay, UDim.new(0, 12))

local mainBgImage = Instance.new("ImageLabel")
mainBgImage.Size = UDim2.fromScale(1, 1)
mainBgImage.BackgroundTransparency = 1
mainBgImage.Image = MAIN_BG
mainBgImage.ScaleType = Enum.ScaleType.Crop
mainBgImage.ZIndex = -1
mainBgImage.Parent = mainFrame
newCorner(mainBgImage, UDim.new(0, 16))

local mainBgOverlay = Instance.new("Frame")
mainBgOverlay.Size = UDim2.fromScale(1, 1)
mainBgOverlay.BackgroundColor3 = Theme.BgColor
mainBgOverlay.BackgroundTransparency = 0.7
mainBgOverlay.BorderSizePixel = 0
mainBgOverlay.ZIndex = -1
mainBgOverlay.Parent = mainFrame
newCorner(mainBgOverlay, UDim.new(0, 16))
