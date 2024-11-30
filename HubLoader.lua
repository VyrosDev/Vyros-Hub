-- Load necessary libraries
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CkVyros/Vyros-Hub-UI/refs/heads/main/KeySystemUI.lua')))()
local DataStoreService = game:GetService("DataStoreService") -- Service for saving data
local PlayerData = DataStoreService:GetDataStore("KeyValidationData") -- Create a DataStore

local Player = game.Players.LocalPlayer -- Get the player's name
local Window = OrionLib:MakeWindow({
    Name = "Vyros Hub | Key System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroText = "Vyros Hub | Key System"       
})

-- Function to load the main script if the key is correct
function MakeScriptHub()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CkVyros/Vyros-Hub/refs/heads/main/Test.lua'))() -- Main script here
end

-- Check if the key has already been validated
local function HasValidatedKey()
    local success, result = pcall(function()
        return PlayerData:GetAsync(Player.UserId) -- Retrieve saved data for the player's UserId
    end)

    if success and result then
        return result -- Return true if key was previously validated
    end

    return false
end

-- Save that the key has been validated
local function SaveValidatedKey()
    pcall(function()
        PlayerData:SetAsync(Player.UserId, true) -- Save validation status
    end)
end

-- Notification for login
OrionLib:MakeNotification({
    Name = "Logged In!",
    Content = "Welcome "..Player.Name..".",
    Image = "rbxassetid://96062201354965",
    Time = 5
})

getgenv().Key = "ClarkyyxVyros" -- Set the correct key here
getgenv().KeyInput = "string" -- Initialize KeyInput
local linkCopied = false -- Flag to track if the link has been copied

-- Automatically load the main script if key was already validated
if HasValidatedKey() then
    OrionLib:MakeNotification({
        Name = "Key Found!",
        Content = "Key validated! Loading script...",
        Image = "rbxassetid://71378523145158",
        Time = 5
    })
    wait(1)
    MakeScriptHub() -- Load the main script
    return -- Exit this script since the key system isn't needed
end

-- Create a tab for the key system
local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://101023107339989",
    PremiumOnly = false
})

-- Textbox for key input
Tab:AddTextbox({
    Name = "Key",
    Default = "Enter Key",
    TextDisappear = true,
    Callback = function(Value)
        getgenv().KeyInput = Value
    end	  
})

-- Button to check the key
Tab:AddButton({
    Name = "Submit",
    Callback = function()
        if not linkCopied then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Your key is invalid.",
                Image = "rbxassetid://89375684433942",
                Time = 5
            })
            return
        end

        if getgenv().KeyInput == getgenv().Key then
            OrionLib:MakeNotification({
                Name = "Checking Key",
                Content = "Checking the key you entered...",
                Image = "rbxassetid://101023107339989",
                Time = 5
            })
            wait(2)
            OrionLib:MakeNotification({
                Name = "Correct Key!",
                Content = "The key you entered is correct.",
                Image = "rbxassetid://71378523145158",
                Time = 5
            })
            SaveValidatedKey() -- Save that the key was validated
            wait(1)
            OrionLib:Destroy() -- Destroy the key system UI
            wait(0.3)
            MakeScriptHub() -- Load the main script
        else
            OrionLib:MakeNotification({
                Name = "Checking Key",
                Content = "Checking the key you entered...",
                Image = "rbxassetid://101023107339989",
                Time = 5
            })
            wait(2)
            OrionLib:MakeNotification({
                Name = "Incorrect Key!",
                Content = "The key you entered is incorrect.",
                Image = "rbxassetid://89375684433942",
                Time = 5
            })
        end
    end
})

-- Button to copy the key link
Tab:AddButton({
    Name = "Get Key",
    Callback = function()
        setclipboard("Put The Link Here") -- Set the link for the key
        linkCopied = true -- Set the flag to true
        OrionLib:MakeNotification({
            Name = "Link Copied!",
            Content = "Paste the link into your browser.",
            Image = "rbxassetid://101023107339989",
            Time = 5
        })
    end    
})

OrionLib:Init() -- Initialize the UI
