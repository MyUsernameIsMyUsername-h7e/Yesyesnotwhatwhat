-- Settings for Auto Join Team (Pirates/Marines)
local Settings = {
    JoinTeam = "Pirates"; -- Pirates/Marines
    Translator = true; -- true/false
}

-- Function to Auto Join Team
local function AutoJoinTeam()
    local teamButton = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("TeamSelection")
    if Settings.JoinTeam == "Pirates" then
        teamButton.PiratesButton.MouseButton1Click:Fire()
    elseif Settings.JoinTeam == "Marines" then
        teamButton.MarinesButton.MouseButton1Click:Fire()
    end
end

-- Auto Join Team when the script runs
AutoJoinTeam()

-- Auto Farm Chests and Collect them
local chestCollected = 0
local startTime = tick()

-- Function to detect chests and teleport to them
local function FarmChests()
    local chest = nil
    local player = game.Players.LocalPlayer
    local chestModels = {}  -- Add all possible chest models here
    -- Populate the chestModels with model names or specific IDs of chests

    for _, v in pairs(workspace:GetChildren()) do
        -- Check if the object is a chest (replace "Chest" with actual chest name or ID)
        if v.Name == "Chest" and v:IsA("Model") then
            chest = v
            break
        end
    end

    if chest then
        -- Teleport to chest
        player.Character.HumanoidRootPart.CFrame = chest.HumanoidRootPart.CFrame
        chestCollected = chestCollected + 1
        print("[Chest collected: " .. chestCollected .. "]")
        
        -- Time elapsed display
        local elapsedTime = tick() - startTime
        local hours = math.floor(elapsedTime / 3600)
        local minutes = math.floor((elapsedTime % 3600) / 60)
        local seconds = math.floor(elapsedTime % 60)
        print("[Timelapse: " .. hours .. " Hours, " .. minutes .. " Minutes, " .. seconds .. " Seconds]")

        wait(0.1) -- Small delay to avoid overloading the game and give time for fruit respawn
    end
end

-- Start the Auto Farming loop
while true do
    FarmChests()
    wait(1) -- Check for chests every second
end
