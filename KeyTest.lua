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
    ["VyrosxC-Premium-9999"] = 1980119628,  -- @CRXM_CRXM (Will)
    ["M4-Users008"] = 2628834524,  -- @M4N0TUE641 (Matue)
    -- (restante do banco de dados...)
}

local CONFIG_FILE = "VyrosxC_KeyConfig.json"  -- Nome do arquivo para salvar a key

-- Função para carregar a key salva
local function LoadSavedKey()
    if isfile(CONFIG_FILE) then
        local savedData = game:GetService("HttpService"):JSONDecode(readfile(CONFIG_FILE))
        return savedData.key
    end
    return nil
end

-- Função para salvar a key localmente
local function SaveKeyLocally(key)
    local data = { key = key }
    writefile(CONFIG_FILE, game:GetService("HttpService"):JSONEncode(data))
    print("Key saved locally:", key)
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

-- Função para validar e carregar o script
local function ValidateKey(Value)
    if IsKeyValid(Value, player) then
        OrionLib:MakeNotification({
            Name = "Valid Key",
            Content = "Enjoy!",
            Image = "rbxassetid://71378523145158",
            Time = 5
        })

        SaveKeyLocally(Value)  -- Salvar key localmente
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/VyrosxCLegendsOfSpeed.lua"))()
    else
        OrionLib:MakeNotification({
            Name = "Invalid Key",
            Content = "Invalid or Already Used Key.",
            Image = "rbxassetid://89375684433942",
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

-- Tentar carregar e validar key salva automaticamente
local savedKey = LoadSavedKey()

if savedKey then
    if IsKeyValid(savedKey, player) then
        OrionLib:MakeNotification({
            Name = "Checking",
            Content = "Key Loaded And Validated!",
            Image = "rbxassetid://71378523145158",
            Time = 5
        })

        -- Carregar script automaticamente
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/VyrosxCLegendsOfSpeed.lua"))()
    else
        OrionLib:MakeNotification({
            Name = "Invalid Saved Key",
            Content = "Get A New Key!",
            Image = "rbxassetid://89375684433942",
            Time = 5
        })
    end
else
    OrionLib:MakeNotification({
        Name = "No Saved Key",
        Content = "Please Enter Your Key Manually.",
        Image = "rbxassetid://89375684433942",
        Time = 5
    })
end

-- Finaliza a UI
OrionLib:Init()
