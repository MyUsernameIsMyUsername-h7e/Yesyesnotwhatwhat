local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local hrp = lp.Character:WaitForChild("HumanoidRootPart")

-- GUI setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ChestTpGUI"

local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 170, 0, 40)
button.Position = UDim2.new(0, 10, 0, 200)
button.Text = "Chest TP: OFF"
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Active = true
button.Draggable = true

-- Info label
local info = Instance.new("TextLabel", gui)
info.Size = UDim2.new(0, 200, 0, 40)
info.Position = UDim2.new(0, 10, 0, 250)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.new(1, 1, 1)
info.TextScaled = true
info.Text = "[Chest Collected: 0]"

-- Timelapse label
local timer = Instance.new("TextLabel", gui)
timer.Size = UDim2.new(0, 250, 0, 40)
timer.Position = UDim2.new(0, 10, 0, 290)
timer.BackgroundTransparency = 1
timer.TextColor3 = Color3.new(1, 1, 1)
timer.TextScaled = true
timer.Text = "[Timelapse: 0s, 0m, 0h, 0d]"

-- Toggle logic
local active = false
local chestCount = 0
local startTime = tick()

button.MouseButton1Click:Connect(function()
	active = not active
	button.Text = active and "Chest TP: ON" or "Chest TP: OFF"
end)

-- Teleport function
local function teleportToChest(chest)
	if chest and chest:FindFirstChild("TouchInterest") then
		hrp.CFrame = chest.CFrame + Vector3.new(0, 5, 0)
		chestCount += 1
		info.Text = "[Chest Collected: " .. chestCount .. "]"
		wait(0.1)
	end
end

-- Time update loop
task.spawn(function()
	while true do
		local elapsed = math.floor(tick() - startTime)
		local days = math.floor(elapsed / 86400)
		local hours = math.floor((elapsed % 86400) / 3600)
		local minutes = math.floor((elapsed % 3600) / 60)
		local seconds = elapsed % 60
		timer.Text = string.format("[Timelapse: %ds, %dm, %dh, %dd]", seconds, minutes, hours, days)
		wait(1)
	end
end)

-- Main chest scan loop
task.spawn(function()
	while true do
		if active then
			for _, chest in ipairs(workspace:GetDescendants()) do
				if chest:IsA("Part") and chest.Name:lower():find("chest") then
					teleportToChest(chest)
				end
			end
		end
		wait(1)
	end
end)
