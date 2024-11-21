local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/OrionUIKeySystem.lua')))()
local Window = OrionLib:MakeWindow({Name = "VyrosxC | Key System 🔑", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystemConfig"})

-- Banco de dados local de chaves com UserID manualmente atribuídos
local KeyDatabase = {
    ["VyrosxC-Alexg"] = 1396119116,  -- @Alexg78909 (Eu)
    ["VyrosxC-Clarkyy"] = 7532410585,  -- @zClarkyy (Eu)
    ["VyrosxC-FeHari"] = 5818980336,  -- @HA_FeHariAlt (Eu)
    ["VyrosxC-Gabezinn"] = 4933028875,  -- @Gabezinn_12 (Eu)  
    ["VyrosxC-janiszewskiblox"] = 4374535723,  -- @janiszewskiblox (Eu) 
    ["VyrosxC-Premium-94384"] = 1762542484,  -- @ericklopes16 (Erick)
    ["VyrosxC-Premium-81237"] = 5097989830,  -- @FX_BAHIANOOO (Alt Erick)
    ["VyrosxC-Premium-96934"] = 1980119628,  -- @CRXM_CRXM (Will)
    ["M4-Users008"] = 2628834524,  -- @M4N0TUE641 (Matue)
    -- ... (restante do banco de dados)
}

local savedKey = ""  -- Variável para armazenar a key carregada

-- Função para carregar a key salva
local function LoadSavedKey()
    local folder = Window.Flags.ConfigFolder
    local configFile = folder .. "/SavedKey.json"

    if isfile(configFile) then
        local savedData = game:GetService("HttpService"):JSONDecode(readfile(configFile))
        return savedData.key
    end

    return nil
end

-- Função para salvar a key localmente
local function SaveKeyLocally(key)
    local folder = Window.Flags.ConfigFolder
    local configFile = folder .. "/SavedKey.json"

    if not isfolder(folder) then
        makefolder(folder)
    end

    writefile(configFile, game:GetService("HttpService"):JSONEncode({ key = key }))
    print("Key salva localmente:", key)
end

-- Função para validar key
local function IsKeyValid(key, player)
    local storedUserID = KeyDatabase[key]
    if storedUserID and storedUserID == player.UserId then
        return true
    end
    return false
end

-- Criando a interface para inserir a chave
local Tab = Window:MakeTab({
    Name = "Key Validation",
    Icon = "rbxassetid://101023107339989",
    PremiumOnly = false
})

local player = game.Players.LocalPlayer  -- Jogador local

-- Função de callback para validar e salvar key
local function ValidateKey(Value)
    if IsKeyValid(Value, player) then
        OrionLib:MakeNotification({
            Name = "Key Validated",
            Content = "Key Is Valid And Accepted!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })

        SaveKeyLocally(Value)  -- Salvar key localmente
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/VyrosxCLegendsOfSpeed.lua"))()
    else
        OrionLib:MakeNotification({
            Name = "Invalid Key",
            Content = "This Key Is Either Invalid Or Already Used.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
end

-- Input para inserir a key
local Textbox = Tab:AddTextbox({
    Name = "Enter Your Premium Key",
    Default = "",
    TextDisappear = true,
    Callback = ValidateKey
})

-- Tentar carregar uma key salva automaticamente
savedKey = LoadSavedKey()

if savedKey then
    ValidateKey(savedKey)  -- Validar key salva automaticamente
else
    OrionLib:MakeNotification({
        Name = "No Saved Key",
        Content = "Please Enter Your Key Manually.",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

-- Finaliza a UI
OrionLib:Init()
