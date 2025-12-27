local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()
local playerGui = player:WaitForChild("PlayerGui")

getgenv().Support = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/goshky700/SerializationV3-SupportLibrary/main/SupportLibrary.txt"
))()
getgenv().Serialization = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/goshky700/SerializationV3-SupportLibrary/main/SerializationV3.txt"
))()

local oldGui = playerGui:FindFirstChild("ScreenGui")
if oldGui then oldGui:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "ScreenGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.Parent = gui
frame.Size = UDim2.new(0.36, 0, 0.46, 0)
frame.Position = UDim2.new(0.32, 0, 0.27, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.new(1, 1, 1)
frame.Visible = false

local title = Instance.new("TextLabel")
title.Name = "TextLabel"
title.Parent = frame
title.Size = UDim2.new(0.95, 0, 0.1, 0)
title.Position = UDim2.new(0.5, 0, 0, 0)
title.AnchorPoint = Vector2.new(0.5, 0)
title.BackgroundTransparency = 1
title.TextStrokeTransparency = 0
title.Text = [[{- build saver v2 -}]]
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.ArimoBold
title.TextXAlignment = Enum.TextXAlignment.Left

local directoryBox = Instance.new("TextBox")
directoryBox.Name = "directory"
directoryBox.Parent = frame
directoryBox.Size = UDim2.new(0.385, 0, 0.076, 0)
directoryBox.Position = UDim2.new(0.025, 0, 0.137, 0)
directoryBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
directoryBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
directoryBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
directoryBox.BorderSizePixel = 1
directoryBox.TextColor3 = Color3.new(1, 1, 1)
directoryBox.TextStrokeTransparency = 0
directoryBox.TextScaled = true
directoryBox.PlaceholderText = "directory"
directoryBox.Text = ""
directoryBox.ClearTextOnFocus = false
directoryBox.TextXAlignment = Enum.TextXAlignment.Left

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "directoryset"
statusLabel.Parent = frame
statusLabel.Size = UDim2.new(0.5475, 0, 0.076, 0)
statusLabel.Position = UDim2.new(0.4275, 0, 0.137, 0)
statusLabel.BackgroundColor3 = Color3.fromRGB(40,40,40)
statusLabel.Text = "Directory set:"
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.TextStrokeTransparency = 0
statusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
statusLabel.BorderSizePixel = 1
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

local partsFoundLabel = Instance.new("TextLabel")
partsFoundLabel.Name = "partsfound"
partsFoundLabel.Parent = frame
partsFoundLabel.Size = UDim2.new(0.5475, 0, 0.076, 0)
partsFoundLabel.Position = UDim2.new(0.4275, 0, 0.248, 0)
partsFoundLabel.BackgroundColor3 = Color3.fromRGB(40,40,40)
partsFoundLabel.Text = "Parts found:"
partsFoundLabel.TextColor3 = Color3.new(1, 1, 1)
partsFoundLabel.TextStrokeTransparency = 0
partsFoundLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
partsFoundLabel.BorderSizePixel = 1
partsFoundLabel.TextScaled = true
partsFoundLabel.Font = Enum.Font.SourceSans
partsFoundLabel.TextXAlignment = Enum.TextXAlignment.Left

local saveButton = Instance.new("TextButton")
saveButton.Name = "save"
saveButton.Parent = frame
saveButton.Size = UDim2.new(0.23, 0, 0.08, 0)
saveButton.Position = UDim2.new(0.585, 0, 0.36, 0)
saveButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
saveButton.Text = "SAVE"
saveButton.TextColor3 = Color3.new(1, 1, 1)
saveButton.TextStrokeTransparency = 0
saveButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
saveButton.BorderSizePixel = 1
saveButton.TextScaled = true
saveButton.Font = Enum.Font.ArialBold

local selectButton = Instance.new("TextButton")
selectButton.Name = "selectpart"
selectButton.Parent = frame
selectButton.Size = UDim2.new(0.23, 0, 0.08, 0)
selectButton.Position = UDim2.new(0.1025, 0, 0.245, 0)
selectButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
selectButton.Text = "select part"
selectButton.TextColor3 = Color3.new(1, 1, 1)
selectButton.TextStrokeTransparency = 0
selectButton.TextScaled = true
selectButton.Font = Enum.Font.ArimoBold
selectButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
selectButton.BorderSizePixel = 1

local copyButton = Instance.new("TextButton")
copyButton.Name = "copybutton"
copyButton.Parent = frame
copyButton.Size = UDim2.new(0.23, 0, 0.08, 0)
copyButton.Position = UDim2.new(0.1025, 0, 0.845, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
copyButton.Text = "copy all"
copyButton.TextColor3 = Color3.new(1, 1, 1)
copyButton.TextStrokeTransparency = 0
copyButton.TextScaled = true
copyButton.Font = Enum.Font.ArimoBold
copyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
copyButton.BorderSizePixel = 1

local resultFrame = Instance.new("Frame")
resultFrame.Name = "A"
resultFrame.Parent = frame
resultFrame.Size = UDim2.new(0.5475, 0, 0.475, 0)
resultFrame.Position = UDim2.new(0.4275, 0, 0.479, 0)
resultFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
resultFrame.BorderSizePixel = 1
resultFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = resultFrame
scrollFrame.Size = UDim2.new(1,0,1,0)
scrollFrame.CanvasSize = UDim2.new(0,0,100,0)
scrollFrame.ScrollBarThickness = 0
scrollFrame.BackgroundTransparency = 1
scrollFrame.ClipsDescendants = true

local uiGrid = Instance.new("UIGridLayout")
uiGrid.Parent = scrollFrame
uiGrid.CellPadding = UDim2.new(0.7,0,0,0)
uiGrid.CellSize = UDim2.new(0.2,0,0.003,0)

local resultTemplate = Instance.new("TextLabel")
resultTemplate.Name = "result"
resultTemplate.Parent = scrollFrame
resultTemplate.Size = UDim2.new(0.2,0,0.2,0)
resultTemplate.Visible = false
resultTemplate.BackgroundColor3 = Color3.fromRGB(80,80,80)
resultTemplate.Text = "Result:"
resultTemplate.TextColor3 = Color3.new(1,1,1)
resultTemplate.TextStrokeTransparency = 0
resultTemplate.BorderColor3 = Color3.fromRGB(0,0,0)
resultTemplate.BorderSizePixel = 1
resultTemplate.TextScaled = true

local dataBox = Instance.new("TextBox")
dataBox.Name = "data"
dataBox.Parent = resultTemplate
dataBox.Size = UDim2.new(4,0,1,0)
dataBox.Position = UDim2.new(1,0,0,0)
dataBox.BackgroundColor3 = Color3.fromRGB(140,140,140)
dataBox.Text = ""
dataBox.TextColor3 = Color3.new(1,1,1)
dataBox.TextTransparency = 1
dataBox.BorderColor3 = Color3.fromRGB(0,0,0)
dataBox.BorderSizePixel = 1
dataBox.ClearTextOnFocus = false
dataBox.TextEditable = false

local openButton = Instance.new("TextButton")
openButton.Name = "open"
openButton.Parent = gui
openButton.Size = UDim2.new(0.078, 0, 0.047, 0)
openButton.Position = UDim2.new(0, 0, 0.476, 0)
openButton.BackgroundColor3 = Color3.new(0, 0, 0)
openButton.BackgroundTransparency = 0.2
openButton.BorderSizePixel = 2
openButton.BorderColor3 = Color3.new(1, 1, 1)
openButton.Text = "Build Saver"
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextStrokeTransparency = 0
openButton.TextScaled = true
openButton.Font = Enum.Font.SourceSansBold

openButton.MouseButton1Click:Connect(function()
	if frame then
		frame.Visible = not frame.Visible
	end
end)

local toggled = false
local selectionBox = Instance.new("SelectionBox")
selectionBox.LineThickness = 0.05
selectionBox.Color3 = Color3.fromRGB(255, 255, 255)
selectionBox.Parent = gui
local hoveredPart = nil

selectButton.MouseButton1Click:Connect(function()
	toggled = not toggled
	if toggled then
		selectButton.BorderSizePixel = 2
		selectButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
	else
		selectButton.BorderSizePixel = 1
		selectButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		selectionBox.Adornee = nil
	end
end)

mouse.Move:Connect(function()
	if not toggled then return end
	if mouse.Target and mouse.Target:IsA("BasePart") then
		hoveredPart = mouse.Target
		selectionBox.Adornee = hoveredPart
	else
		hoveredPart = nil
		selectionBox.Adornee = nil
	end
end)

mouse.Button1Down:Connect(function()
	if not toggled or not hoveredPart then return end
	directoryBox.Text = hoveredPart:GetFullName()
end)

local function findByPath(path)
	local current = game
	for name in string.gmatch(path, "[^%.]+") do
		current = current:FindFirstChild(name)
		if not current then return nil end
	end
	return current
end

local function countParts(instance)
	if instance:IsA("BasePart") then return 1 end
	local count = 0
	for _, obj in ipairs(instance:GetDescendants()) do
		if obj:IsA("BasePart") then
			count += 1
		end
	end
	return count
end

directoryBox:GetPropertyChangedSignal("Text"):Connect(function()
	local path = directoryBox.Text
	if path == "" then
		statusLabel.Text = ""
		partsFoundLabel.Text = "Parts found: 0"
		return
	end
	local target = findByPath(path)
	if target then
		statusLabel.Text = "Directory set: " .. path
		partsFoundLabel.Text = "Parts found: " .. countParts(target)
	else
		statusLabel.Text = "Directory set: not found"
		partsFoundLabel.Text = "Parts found: 0"
	end
end)

local MAX_LEN = 20000
saveButton.MouseButton1Click:Connect(function()
	local path = directoryBox.Text
	if path == "" then return end
	local root = findByPath(path)
	if not root then
		warn("directory not found")
		return
	end

	for _, child in ipairs(scrollFrame:GetChildren()) do
		if child:IsA("TextLabel") and child.Name:match("Result") then
			child:Destroy()
		end
	end

local allItems = {root}
for _, obj in ipairs(root:GetDescendants()) do
    table.insert(allItems, obj)
end

local ok, data = pcall(function()
    return Serialization.SerializeModel(allItems)
end)

if not ok then
    warn("Serialization failed:", data)
    return
end
	
	local startIndex = 1
	local resultIndex = 1
	while startIndex <= #data do
		local chunk = data:sub(startIndex, startIndex + MAX_LEN - 1)
		local resultLabel = resultTemplate:Clone()
		resultLabel.Visible = true
		resultLabel.Name = "Result " .. resultIndex
		resultLabel.Text = "Result " .. resultIndex .. ":"
		resultLabel.Parent = scrollFrame

		local dataBox = resultLabel:FindFirstChild("data")
		if dataBox then
			dataBox.Text = chunk
		end

		startIndex = startIndex + MAX_LEN
		resultIndex += 1
	end
end)

copyButton.MouseButton1Click:Connect(function()
	local results = {}

	for _, child in ipairs(scrollFrame:GetChildren()) do
		if child:IsA("TextLabel") and child.Name:match("^Result %d+$") then
			table.insert(results, child)
		end
	end

	table.sort(results, function(a, b)
		local ai = tonumber(a.Name:match("%d+"))
		local bi = tonumber(b.Name:match("%d+"))
		return ai < bi
	end)

	local combined = {}
	for _, result in ipairs(results) do
		local dataBox = result:FindFirstChild("data")
		if dataBox then
			table.insert(combined, dataBox.Text)
		end
	end

	local finalText = table.concat(combined, "")

	if setclipboard then
		setclipboard(finalText)
	else
		warn("clipboard function not supported")
	end
end)