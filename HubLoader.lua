local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() --This Will Load The Script Code
local Window = Library.CreateLib("Vyros Hub | Key System", "DarkTheme") --This Will Make The Script Hub

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CkVyros/Vyros-Hub-UI/refs/heads/main/KeySystemUI.lua')))() 

local Player = game.Players.LocalPlayer
local linkCopied = false -- Flag to track if the link was copied

-- Store the UI instance to easily destroy it later
local UIInstance = nil

function CorrectKeyAndLoadTheScript()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/CkVyros/Vyros-Hub/refs/heads/main/Test.lua'))() --This Where You Put The Script That Will Be Loaded If The Key Is Correct
    DestroyUI() -- Destroy the key system interface after the script loads
end

-- Function to destroy the key system interface
function DestroyUI()
    if UIInstance and UIInstance.Parent then
        UIInstance:Destroy()
    end
end

OrionLib:MakeNotification({
    Name = "Logged In!",
    Content = "Welcome, "..Player.Name..".",
    Image = "rbxassetid://96062201354965",
    Time = 5
}) -- Notification

getgenv().Key = "ClarkyyxVyros" -- Set the correct key here
getgenv().KeyInput = "string" -- Initialize KeyInput

-- Create a new tab and section, and keep a reference to the main UI instance
UIInstance = Window
local Tab = Window:NewTab("KEY SYSTEM") -- Create a new tab
local Section = Tab:NewSection("Key System") -- Create a section

Section:NewTextBox("Enter Key", "Key", function(Value)
    getgenv().KeyInput = Value
end) 

Section:NewButton("Submit", "Check your key", function()
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
            Content = "The key you entered is valid.",
            Image = "rbxassetid://71378523145158",
            Time = 5
        })
        wait(0.3)
        CorrectKeyAndLoadTheScript()
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
            Content = "The key you entered is invalid.",
            Image = "rbxassetid://89375684433942",
            Time = 5
        })
    end
end)  

Section:NewButton("Get Key", "Copy the required link", function()
    setclipboard("Link here") -- Put your link here
    linkCopied = true -- Set the flag to true
    OrionLib:MakeNotification({
        Name = "Copied Link!",
        Content = "Successfully copied the link.",
        Image = "rbxassetid://71378523145158",
        Time = 5
    })
end)

OrionLib:Init()
