print("starting...")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local BUILD_PATH = workspace["Private Building Areas"].SpunkyDaFloofBuildArea

local old = playerGui:FindFirstChild("buildsaver")
if old then
    print("old buildsaver ui deleted")
	old:Destroy()
end

getgenv().Support = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/goshky700/SerializationV3-SupportLibrary/main/SupportLibrary.txt"
	))()

getgenv().Serialization = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/goshky700/SerializationV3-SupportLibrary/main/SerializationV3.txt"
	))()

local screenGui = Instance.new("ScreenGui")
print("created buildsaver ui")
screenGui.Name = "buildsaver"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.2, 0, 0.045, 0)
textBox.Position = UDim2.new(0.5, 0, 0.5, 0)
textBox.AnchorPoint = Vector2.new(0.5, 0.5)
textBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
textBox.BorderSizePixel = 1
textBox.TextScaled = true
textBox.ClearTextOnFocus = false
textBox.TextEditable = false
textBox.TextColor3 = Color3.fromRGB(0,0,0)
textBox.Text = "wait..."
textBox.Parent = screenGui

local closeButton = Instance.new("TextButton")
textBox.AnchorPoint = Vector2.new(0.5, 0.5)
closeButton.Size = UDim2.new(0.032, 0, 0.045, 0)
closeButton.Position = UDim2.new(0.6, 0, 0.5, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255,0,0)
closeButton.Text = "X"
closeButton.TextScaled = true
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.Parent = screenGui

closeButton.MouseButton1Click:Connect(function()
    print("closed buildsaver ui")
	screenGui:Destroy()
end)

local function splitText(text, chunkSize)
	local chunks = {}
	local len = #text
	local start = 1
	while start <= len do
		table.insert(chunks, text:sub(start, start + chunkSize - 1))
		start = start + chunkSize
	end
	return chunks
end

local function getFromPath(path)
	local obj = game
	for part in path:gmatch("[^%.]+") do
		obj = obj:FindFirstChild(part)
		if not obj then
			return nil
		end
	end
	return obj
end

local function collect(root)
	local items = { root }
	for _, v in ipairs(root:GetDescendants()) do
		table.insert(items, v)
	end
	return items
end

local root = BUILD_PATH
if not root then
	textBox.Text = "path error"
	return
end

local ok, data = pcall(function()
	return Serialization.SerializeModel(collect(root))
end)

if not ok then
	textBox.Text = "serialize fail"
	return
end

local MAX_LEN = 20000
local start = 1
local yOffset = 0

while start <= #data do
	local tb = Instance.new("TextBox")
	tb.Size = textBox.Size
	tb.Position = textBox.Position + UDim2.new(0, 0, 0.05 * yOffset, 0) -- stack below
	tb.AnchorPoint = textBox.AnchorPoint
	tb.BackgroundColor3 = textBox.BackgroundColor3
	tb.BorderSizePixel = textBox.BorderSizePixel
	tb.TextScaled = textBox.TextScaled
	tb.ClearTextOnFocus = textBox.ClearTextOnFocus
	tb.TextEditable = textBox.TextEditable
	tb.TextColor3 = textBox.TextColor3
	tb.Text = data:sub(start, start + MAX_LEN - 1)
	tb.Parent = screenGui

	start = start + MAX_LEN
	yOffset = yOffset + 1
end
