--// Variables \\--

getgenv().HoopFarm = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Chr = Player.Character

Player.CharacterAdded:Connect(function()
    Chr = Player.Character
end)

local ChrHead = Chr.Head
local Humanoid = Chr.Humanoid
local Root = Chr.HumanoidRootPart





--// Tables \\--

local Crystals = {}





--// Functions \\--

-- Function Expand Torso --
local function ExpandTorso()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local torso = character:WaitForChild("UpperTorso")

    local expansionRate = Vector3.new(2, 2, 2) 

    torso.Size = torso.Size + expansionRate
end




-- Function Reset Character --
local function ResetCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    character:BreakJoints()
	
    print("The character has been reset to its original state!")
end




-- Function City Teleports --
local function SelectCity(city)
    if city == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9686.27148, 58.9799881, 3110.75903, -0.993164003, 2.12365538e-08, -0.116727315, 2.63954707e-08, 1, -4.26504876e-08, 0.116727315, -4.54400002e-08, -0.993164003)
    elseif city == "Snow City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9672.77832, 58.9799881, 3768.75171, 0.991323948, -1.89020124e-08, -0.131441399, 1.31006459e-08, 1, -4.50012685e-08, 0.131441399, 4.28888676e-08, 0.991323948)
    elseif city == "Magma City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11051.4258, 216.940002, 4886.27832, 0.987576485, 3.03587235e-08, -0.157139242, -3.89276664e-08, 1, -5.14532452e-08, 0.157139242, 5.69310785e-08, 0.987576485)
    elseif city == "Legends Highway" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13095.9746, 214.580338, 5895.57568, 0.999146283, 0.0376458429, -0.0170128513, -0.037201196, 0.99897629, 0.0257374309, 0.0179643426, -0.0250825603, 0.999523938)
    end
end




-- Function Maps Teleports --
local function SelectMap(location)
    if location == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2506.85156, 14.74121, 4353.92725, -0.0108262217, 3.44026461e-08, 0.999941409, 4.99142838e-10, 1, -3.43992568e-08, -0.999941409, 1.26699637e-10, -0.0108262217)
    elseif location == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-346.1203, 3.85000086, 577.441223, 0.649530411, -5.26415e-08, 0.760335565, -2.8906797e-08, 1, 9.39287119e-08, -0.760335565, -8.29884286e-08, 0.649530411)
    end
end




-- Function Chest Teleports --
local function SelectChest(chest)
    if chest == "Main City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-668.435242, 64.7499619, -263.600342, -0.588192225, -6.5145052e-08, -0.808721185, 4.4101709e-09, 1, -8.37607317e-08, 0.808721185, -5.28340109e-08, -0.588192225)
    elseif chest == "Snow City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.912415, 72.749939, 2143.3291, -0.99671495, 7.0440322e-08, -0.080989778, 7.61660246e-08, 1, -6.76071892e-08, 0.080989778, -7.3553764e-08, -0.99671495)
    elseif chest == "Magma City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2482.57764, 68.8001709, 3992.08301, -0.688194096, 3.17123816e-09, 0.725526631, 2.77723515e-08, 1, 2.19723582e-08, -0.725526631, 3.52708263e-08, -0.688194096)
    end
end




-- Function Spawn Teleports --
local function SelectLocation(location)
    if location == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-555.846985, 3.80000067, 399.529388, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif location == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(262.487244, 645.934387, -180.146057, 0.999046028, 0, 0.043669384, 0, 1, 0, -0.043669384, 0, 0.999046028)
    elseif location == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(247.883865, 73.0481033, -272.587677, 0.993579924, -8.65447536e-09, -0.113132581, -5.42947631e-10, 1, -8.12669327e-08, 0.113132581, 8.08066147e-08, 0.993579924)
    end
end




-- Function Auto Race V1 --
_G.Farm = false

-- Function Teleport Race V1 Main City --
local function teleportToMaps()
    while _G.Farm do
        pcall(function()
          
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(48.311, 36.315, -8680.453)
            wait(0.3)
        
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1686.075, 36.315, -5946.634)
            wait(0.3)
          
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001.331, 36.315, -10986.218)
            wait(0.3)
        end)
    end
end




-- Function Teleport Race V1 Space --
local function teleportToSpace()
    while _G.Farm do
        pcall(function()
        
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4970.01709, 36.0000916, -4805.07861, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            wait(0.3)

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4945.31689, 36.0000916, -4805.07861, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            wait(0.3)
        end)
    end
end




-- Fuction Teleport Race V1 Desert --
local function teleportToDesert()
    while _G.Farm do
        pcall(function()
          
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(636.770996, 161.306763, 9718.75, -0.999040902, 0.000210345868, -0.043785546, 0.00021885868, 0.99999994, -0.000189627055, 0.043785505, -0.000199028043, -0.999040961)
            wait(0.3)
     
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2061.12476, 219.799164, 17953.8984, 0.949868321, -9.90087301e-09, 0.312650263, 5.16601206e-10, 1, 3.00980716e-08, -0.312650263, -2.84276886e-08, 0.949868321)
            wait(0.3)
        end)
    end
end

local function stopAutoFarm()
    _G.Farm = false
end




-- Function Auto Race V1 --
local function toggleAutoRaces(state)
    _G.Farm = state
    if state then
        spawn(function()
            while _G.Farm do
                pcall(function()
                    -- Participar da corrida
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    wait(0.1)
                    local part = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(game:GetService("Workspace").raceMaps:GetDescendants()) do
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                wait(0.1)
            end
        end)
        
        if _G.SelectedTeleport == "Space" then
            teleportToSpace() 
        elseif _G.SelectedTeleport == "Main City" then
            teleportToMaps()
        elseif _G.SelectedTeleport == "Desert" then
            teleportToDesert() 
        end
    else
        stopAutoFarm()
    end
end




-- Function Anti-Kick --
local function AntiKick()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end




-- Function Low Graphics --
local function optimizeFpsPing()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end




-- Variables --
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")





-- Function Auto Race V2 --
game:GetService('ReplicatedStorage').raceInProgress.Changed:Connect(function()
    if AutoRaceToggle then 
        if game:GetService('ReplicatedStorage').raceInProgress.Value == true then
            game:GetService('ReplicatedStorage').rEvents.raceEvent:FireServer("joinRace") 
        end
    end
end)

game:GetService('ReplicatedStorage').raceStarted.Changed:Connect(function()
    if AutoRaceToggle then 
        if game:GetService('ReplicatedStorage').raceStarted.Value == true then
            for i, v in pairs(game:GetService('Workspace').raceMaps:GetChildren()) do
                local OldFinishPosition = v.finishPart.CFrame
                v.finishPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                wait()
                v.finishPart.CFrame = OldFinishPosition
            end
        end
    end
end)





-- Function Hip Height --
local function setHipHeight(value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.HipHeight = value
end





-- Function WalkSpeed And JumpPower --
local function setPlayerStats(walkSpeed, jumpPower)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.WalkSpeed = walkSpeed
    print("Speed ​​adjusted to: " .. walkSpeed)

    humanoid.JumpPower = jumpPower
    print("Jump power adjusted to: " .. jumpPower)
end





-- Function Rebirths Stopping Point --
local targetRebirth = 99999  
local currentRebirths = 0  

local function Rebirth()
    task.wait()
    local ohString1 = "rebirthRequest"
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(ohString1)
end

local function getCurrentRebirths()
    return game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value
end

local function autoRebirth()
    while true do
        currentRebirths = getCurrentRebirths()
        
        if currentRebirths >= targetRebirth then
            print("Rebirth target reached: " .. currentRebirths)
            break
        end
        
        Rebirth()
  
        task.wait(0.1)  
    end
end





-- Function Delete Barrier --
local function deleteBarrier()
    spawn(function()
        local boundaries = {
            game:GetService("Workspace").raceMaps.Grassland.boundaryParts,
            game:GetService("Workspace").raceMaps.Desert.boundaryParts,
            game:GetService("Workspace").raceMaps.Magma.boundaryParts		
        }

        for _, boundary in ipairs(boundaries) do
            for _, part in pairs(boundary:GetChildren()) do
                part:Destroy()  
            end
        end
        print("Barriers removed!")
    end)
end





-- Function Chat Spam --
local function sendChatMessage(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

_G.SendMessages = false  
_G.Interval = 1          
_G.Message = ""  





-- Function VyrosxC The Best Hub --
local function sendChatMessage(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end





-- Function Teleports --
local teleportEnabled = false

local function setupClickTeleport()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    mouse.Button1Down:Connect(function()
        if teleportEnabled then
            local targetPosition = mouse.Hit.Position
            if targetPosition then
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                end)
            end
        end
    end)
end

setupClickTeleport()





-- Function Auto Farm --
local selectedLocation = "None"
local selectedOrb = "None"
local collectionSpeed = "x150"
local isCollecting = false

local speedMap = {
    ["x50"] = 50, 
    ["x75"] = 75, 	
    ["x100"] = 100,
    ["x125"] = 125,	
    ["x150"] = 150,
    ["x175"] = 175,
    ["x200"] = 200
}

local function SetLocation(location)
    selectedLocation = location
    print("Selected location: " .. location)
end

local function SetOrb(orb)
    selectedOrb = orb
    print("Orb selected: " .. orb)
end

local function SetCollectionSpeed(speed)
    collectionSpeed = speed
    print("Selected collection speed: " .. speed)
end

local function CollectOrbs()
    if selectedLocation == "None" or selectedOrb == "None" then
        print("Select a location and an Orb before collecting.")
        return
    end

    local repetitions = speedMap[collectionSpeed] or 100 
    print("Collecting " .. selectedOrb .. " in " .. selectedLocation .. " with " .. repetitions .. " repetitions.")

    for i = 1, repetitions do
        game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", selectedOrb, selectedLocation)
    end
end





-- Function No Ping --
local function NoPing()
    while noPingEnabled do
        game:GetService("ReplicatedStorage").rEvents.someEvent:FireServer("pingCheck") 
        wait(0.1)  
    end
end





-- Function Hoops V2 --
local function HoopFarmV2()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("HumanoidRootPart") then
        local children = workspace.Hoops:GetChildren()
        for i, child in ipairs(children) do
            if child.Name == "Hoop" then
                child.CFrame = Chr.HumanoidRootPart.CFrame
            end    
        end
    end
end





-- Function Hoops V1 --
local function HoopFarm()
    if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
        for i, v in next, game:GetService("Workspace").Hoops:GetDescendants() do
            if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
            task.wait()
            firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 1)
            end
        end
    end
end




-- Function No Clip --
local noclipEnabled = false

local function toggleNoclip(state)
    noclipEnabled = state
    if noclipEnabled then
        print("Noclip activated")
    else
        print("Noclip disabled")
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)





--// Demonnic Hub UI \\--
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/OrionUILegendsOfSpeed.lua')))()
local Window = OrionLib:MakeWindow({Name = "VyrosxC Hub | Legends Of Speed ⚡", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://100789040568622",
    PremiumOnly = false
})

local StatsSection = Tab:AddSection({
    Name = "Player Info"
})

local UserIDLabel = Tab:AddLabel("UserID: " .. game.Players.LocalPlayer.UserId)
local StatusLabel = Tab:AddLabel("Status: Online 🟢")
local KeyLabel = Tab:AddLabel("Key: Valid ✅")

local function UpdatePlayerStats()
    local player = game.Players.LocalPlayer
    local userID = player.UserId
    local playerStatus = "Online 🟢" 
    local playerKey = "Valid ✅"  

    UserIDLabel:Set("UserID: " .. userID)
    StatusLabel:Set("Status: " .. playerStatus)
    KeyLabel:Set("Key: " .. playerKey)
end

game:GetService("RunService").Heartbeat:Connect(function()
    UpdatePlayerStats()
end)

local Section = Tab:AddSection({
    Name = "Main"
})

Tab:AddButton({
    Name = "Expand Torso",  
    Callback = function()
        ExpandTorso()  
        print("Successfully expanded torso!")
    end    
})

Tab:AddButton({
    Name = "Reset Character",  
    Callback = function()
        ResetCharacter() 
        print("The character has been reset to normal size!")
    end    
})

local Section = Tab:AddSection({
    Name = "Player Settigs"
})	

local WalkSpeedTextbox = Tab:AddTextbox({
    Name = "Walk Speed", 
    Default = "500",
    TextDisappear = true,  
    Callback = function(value)
       
        local newWalkSpeed = tonumber(value)
        if newWalkSpeed then
            local currentJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
            setPlayerStats(newWalkSpeed, currentJumpPower)
        else
            print("Invalid value for WalkSpeed.")
        end
    end    
})

local JumpPowerTextbox = Tab:AddTextbox({
    Name = "Jump Power", 
    Default = "200",
    TextDisappear = true, 
    Callback = function(value)
        local newJumpPower = tonumber(value)
        if newJumpPower then
            local currentWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
            setPlayerStats(currentWalkSpeed, newJumpPower)
        else
            print("Invalid value for JumpPower.")
        end
    end    
})

local Section = Tab:AddSection({
    Name = "Hip Height"
})

local HipHeightTextbox = Tab:AddTextbox({
    Name = "Hip Height",
    Default = "2.5",  
    TextDisappear = true,  
    Callback = function(value)
    
        local newValue = tonumber(value)
        if newValue then
            setHipHeight(newValue)
            print("Hip height adjusted to: " .. newValue)
        else
            print("Invalid value for HipHeight.")
        end
    end    
})

local Section = Tab:AddSection({
	Name = "Game Options"
})

Tab:AddButton({
    Name = "Anti-Kick",
    Callback = function()
        AntiKick()
        print("Anti-kick activated!")
    end    
})

Tab:AddButton({
    Name = "Low Graphics",
    Callback = function()
        optimizeFpsPing()  
        print("Optimized graphics for better performance!")
    end    
})

local Section = Tab:AddSection({
	Name = "Emergency"
})

Tab:AddButton({
    Name = "Re-join The Game", 
    Callback = function()  
        local teleportService = game:GetService("TeleportService")
        local player = game:GetService("Players").LocalPlayer
        teleportService:Teleport(game.PlaceId, player)  
        print("Trying to get into the game...")  
    end
})




-- Tab Teleports --
local Tab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://103168823763561",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "City Teleports"
})

Tab:AddDropdown({
    Name = "Select City",
    Default = "None",
    Options = {"None","Main City", "Snow City", "Magma City", "Legends Highway"},
    Callback = function(Value)
        SelectCity(Value)
    end    
})

local Section = Tab:AddSection({
	Name = "Maps Teleports"
})

Tab:AddDropdown({
    Name = "Select Map",
    Default = "None",
    Options = {"None","Desert", "Space"},
    Callback = function(Value)
        SelectMap(Value) 
    end    
})

local Section = Tab:AddSection({
	Name = "Spawn Teleports"
})

Tab:AddDropdown({
    Name = "Select Spawn",
    Default = "None",
    Options = {"None", "Main City", "Desert", "Space"},
    Callback = function(Value)
        SelectLocation(Value) 
    end    
})

local Section = Tab:AddSection({
	Name = "Chest Teleports"
})

Tab:AddDropdown({
    Name = "Select Chest",
    Default = "None",
    Options = {"None","Main City Chest", "Snow City Chest", "Magma City Chest"},
    Callback = function(Value)
        SelectChest(Value) 
    end    
})




-- Tab Auto Farm --
local Tab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://78744214847458",
	PremiumOnly = false
})

local StatsSection = Tab:AddSection({
    Name = "Auto Farm"
})

Tab:AddDropdown({
    Name = "Select City",
    Default = "None",
    Options = {"None", "City", "Magma City"},
    Callback = function(Value)
        SetLocation(Value)
    end    
})

Tab:AddDropdown({
    Name = "Select Orb",
    Default = "None",
    Options = {"None", "Red Orb", "Yellow Orb"},
    Callback = function(Value)
        SetOrb(Value)
    end    
})

Tab:AddDropdown({
    Name = "Select Speed",
    Default = "None",
    Options = {"None","x50", "x75", "x100", "x125", "x175", "x200"},
    Callback = function(Value)
        SetCollectionSpeed(Value)
    end    
})

Tab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        isCollecting = state
        print("Auto Farm Status: " .. (isCollecting and "Enabled" or "Disabled"))

        while isCollecting do
            CollectOrbs()
            wait(0.3) 
        end
    end    
})

Tab:AddToggle({
    Name = "No Ping",
    Default = false,
    Callback = function(state)
        noPingEnabled = state 
        print("No Ping " .. (noPingEnabled and "Enabled" or "Disabled"))
        
        if noPingEnabled then
            NoPing() 
        end
    end    
})

local Section = Tab:AddSection({
	Name = "Hoops Farm"
})

Tab:AddToggle({
	Name = "Hoops V1",
	Default = false,
	Callback = function(Value)
		getgenv().Hoop = Value
        while Hoop do
            HoopFarm()
            task.wait()
        end
	end    
})

Tab:AddToggle({
	Name = "Hoops V2",
	Default = false,
	Callback = function(Value)
		getgenv().HoopV2 = Value
        while HoopV2 do
            HoopFarmV2()
            task.wait()
        end
	end    
})




-- Tab Stats --
local Tab = Window:MakeTab({
	Name = "Stats",
	Icon = "rbxassetid://113927674495690",
	PremiumOnly = false
})

local StatsSection = Tab:AddSection({
    Name = "Steps"
})

local StepsLabel = Tab:AddLabel("Steps: 0")

local StatsSection = Tab:AddSection({
    Name = "Rebirths"
})

local RebirthsLabel = Tab:AddLabel("Rebirths: 0")

local StatsSection = Tab:AddSection({
    Name = "Hoops"
})

local HoopsLabel = Tab:AddLabel("Hoops: 0")

local StatsSection = Tab:AddSection({
    Name = "Races"
})

local RacesLabel = Tab:AddLabel("Races: 0")

local function UpdateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:WaitForChild("leaderstats")

    local steps = leaderstats:WaitForChild("Steps").Value
    local rebirths = leaderstats:WaitForChild("Rebirths").Value
    local hoops = leaderstats:WaitForChild("Hoops").Value
    local races = leaderstats:WaitForChild("Races").Value

    StepsLabel:Set("Steps: " .. steps)
    RebirthsLabel:Set("Rebirths: " .. rebirths)
    HoopsLabel:Set("Hoops: " .. hoops)
    RacesLabel:Set("Races: " .. races)
end

game:GetService("RunService").Heartbeat:Connect(function()
    UpdateStats()
end)




-- Tab Auto Rebirth --
local Tab = Window:MakeTab({
	Name = "Auto Rebirth",
	Icon = "rbxassetid://124658295933505",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Rebirth Stopping Point"
})

Tab:AddTextbox({
    Name = "Put Rebirth",
    Default = "0",
    TextDisappear = true,
    Callback = function(value)
        local target = tonumber(value)
        if target then
            targetRebirth = target
            print("Rebirth goal set to: " .. targetRebirth)
        else
            print("Invalid value!")
        end
    end
})

Tab:AddToggle({
    Name = "Rebirth Stopping Point",
    Default = false,
    Callback = function(value)
        if value then
            autoRebirth()
        else
            print("Auto-rebirth disabled.")
        end
    end
})

local Section = Tab:AddSection({
	Name = "Auto Rebirth"
})

Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().AutoRebirth = Value
        while AutoRebirth do
            Rebirth()
            task.wait()
        end
	end    
})




-- Tab Auto Race --
local Tab = Window:MakeTab({
	Name = "Auto Race",
	Icon = "rbxassetid://97860628277392",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Auto Race"
})

local Dropdown = Tab:AddDropdown({
    Name = "Select Map",
    Default = "None",
    Options = {"None","Main City", "Space", "Desert"},
    Callback = function(selectedOption)
        _G.SelectedTeleport = selectedOption
        print("Selected Teleport: " .. selectedOption)
    end
})

Tab:AddToggle({
    Name = "Auto Race V1",
    Default = false,
    Callback = function(Value)
        toggleAutoRaces(Value)
    end
})

Tab:AddToggle({
    Name = "Auto Race V2",
    Default = false, 
    Callback = function(Value)
        AutoRaceToggle = Value  
        print("Auto Race:", Value)
    end
})

local Section = Tab:AddSection({
	Name = "Fast Races"
})

Tab:AddToggle({
    Name = "Auto Fill Race",  
    Callback = function(value) 
        autoFillRaceActive = value 
        
        if autoFillRaceActive then
            spawn(function()
                while autoFillRaceActive do  
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace", true)
                    wait()  
                end
            end)
        end
    end    
})

local Section = Tab:AddSection({
	Name = "Extra"
})

Tab:AddButton({
    Name = "Delete Barriers",
    Callback = function()
        deleteBarrier() 
    end    
})




-- Tab PC Exploits --
local Tab = Window:MakeTab({
	Name = "PC Exploits",
	Icon = "rbxassetid://92103740798042",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Note"
})

Tab:AddParagraph("READ","The Above Acripts Are Fully Compatible With Mob, But Are PC Specific.")

local Section = Tab:AddSection({
	Name = "Auto Race"
})

Tab:AddButton({
    Name = "Auto Race - Script", 
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/AutoRacePC.lua"))()
    end    
})

local Section = Tab:AddSection({
	Name = "Auto Farm"
})

Tab:AddButton({
    Name = "Auto Farm - Script",  
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/AutoFarmPC.lua"))()
    end    
})




-- Tab Chat Spam --
local Tab = Window:MakeTab({
	Name = "Chat Spam",
	Icon = "rbxassetid://112552741196505",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Chat Spam"
})

Tab:AddTextbox({
    Name = "Chat Spam",
    Default = "Here",
    TextDisappear = false,
    Callback = function(Value)
        _G.Message = Value  
})

Tab:AddTextbox({
    Name = "Interval",
    Default = "1", 
    TextDisappear = false,
    Callback = function(Value)
        _G.Interval = tonumber(Value) or 1  
    end
})


Tab:AddToggle({
    Name = "Send Spam",
    Default = false,
    Callback = function(Value)
        _G.SendMessages = Value 
        if Value then
            spawn(function() 
                while _G.SendMessages do
                    if _G.Message ~= "" then  
                        sendChatMessage(_G.Message)  
                    end
                    wait(_G.Interval)  
                end
            end)
        end
    end
})

local Section = Tab:AddSection({
	Name = "VyrosxC Hub Spam"
})

Tab:AddButton({
    Name = "Click Here To Help Us!",
    Callback = function()
        spawn(function()
            for i = 1, 5 do
                sendChatMessage("VyrosxC The Best Hub!") 
                wait(0.2)  
            end
        end)
    end
})




-- Tab Rebirths --
local Tab = Window:MakeTab({
	Name = "Rebirths",
	Icon = "rbxassetid://99813545305255",
	PremiumOnly = false
})

Tab:AddParagraph("GLITCHABLE REBIRTHS","The Best Legends Of Speed ​​Rebirths, From 1K To 12K 💀⚡")

local Section = Tab:AddSection({
	Name = "Rebirth Amount - Pet Rarity"
})

Tab:AddParagraph("999 | Epic Pets | Red Orb, Magma City | +25","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("1499 | Advanced Pets | Red Orb, Magma City | +27","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("1749 | Unique Pets | Red Orb, Magma City | +36","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("2399 | Epic Pets | Red Orb, Magma City | +40","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("2999 | Unique Pets | Red Orb, Magma City | +48","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("3749 | Unique Pets | Red Orb, Magma City | +54","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("4399 | Epic Pets | Red Orb, Magma City | +55","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("5499 | Unique Pets | Red Orb, Magma City | +66","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("6499 | Unique Pets | Red Orb, Magma City | +72","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("8749 | Unique Pets | Red Orb, Magma City | +84","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("9999 | Unique Pets | Red Orb, Magma City | +90","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("12749 | Unique Pets | Red Orb, Magma City | +102","Level 1 Glitches Instantly (FAST REBIRTH)")

local Section = Tab:AddSection({
	Name = "Note"
})

Tab:AddParagraph("READ","All The Mentioned Rebirths Require a Game Pass, That Is, It Will Only Work Properly If You Have Some Passes Like: Infinite Level, 2x Level, 2x Rebirths, +2 Pet Slots. Good Luck!")




-- Tab Extra --
local Tab = Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://89185070084837",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Misc"
})

Tab:AddToggle({
	Name = "Click TP",
	Default = false,
	Callback = function(state)
		teleportEnabled = state
	end
})

Tab:AddToggle({
    Name = "No Clip",
    Default = false,
    Callback = function(Value)
        toggleNoclip(Value)
    end
})

local GravityTextbox = Tab:AddTextbox({
    Name = "Gravity",
    Default = "196.2", 
    TextDisappear = true,
    Callback = function(Value)
    
        local gravityValue = tonumber(Value)
        if gravityValue then
    
            workspace.Gravity = gravityValue
        else
          
            OrionLib:MakeNotification({
                Name = "Invalid Input!",
                Content = "Please enter a valid number for gravity.",
                Image = "rbxassetid://89375684433942",
                Time = 5
            })
        end  
    end    
})




-- Tab Credits --
local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://96062201354965",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Information"
})

Tab:AddParagraph("VYROSXC HUB","Script Made By VyrosxC (@Alexg78909). Join Our Discord Server:")

Tab:AddButton({
    Name = "Click Here To See Discord Notification!",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "VyrosxC Hub",
            Content = "discord.gg/uydz6pZWMk",
            Image = "rbxassetid://101951842185056", 
            Time = 30  
        })
    end
})

local Section = Tab:AddSection({
	Name = "Collaborators"
})

Tab:AddParagraph("THANK YOU!","Collaboration By Demonnic_Fast (@ericklopes16)")

local Section = Tab:AddSection({
	Name = "V - 1.2.0"
})

OrionLib:MakeNotification({
	Name = "VyrosxC Hub",
	Content = "discord.gg/uydz6pZWMk",
	Image = "rbxassetid://101951842185056",
	Time = 20
})

OrionLib:MakeNotification({
	Name = "Premium User",
	Content = "Your Key Is Validated!",
	Image = "rbxassetid://101023107339989",
	Time = 15
})

OrionLib:MakeNotification({
	Name = "Script Version",
	Content = "V - 1.2.0",
	Image = "rbxassetid://83863323756908",
	Time = 10
})



OrionLib:Init()
