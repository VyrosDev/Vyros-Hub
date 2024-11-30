local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CkVyros/Vyros-Hub-UI/refs/heads/main/KeySystemUI.lua')))()
local Window = OrionLib:MakeWindow({Name = "Vyros Hub | Key System", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystemConfig"})

local CONFIG_FILE = "VyrosHub_KeyConfig.json" -- Nome do arquivo para salvar a key
local linkCopied = false -- Flag para verificar se o link foi copiado

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
local function IsKeyValid(key)
    return key == "ClarkyyxVyros" -- Verifica se a key é igual à correta
end

-- Carregar o script principal
local function LoadMainScript()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CkVyros/Vyros-Hub/refs/heads/main/Test.lua"))()
end

-- Criar interface para validação de key
local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://101023107339989",
    PremiumOnly = false
})

-- Identificar automaticamente o nome do jogador
local playerName = game.Players.LocalPlayer.Name

-- Exibir mensagem de boas-vindas com o nome do jogador
OrionLib:MakeNotification({
    Name = "Logged In!",
    Content = "Welcome, " .. playerName .. "!", -- Inclui o nome do jogador na mensagem
    Image = "rbxassetid://101023107339989",
    Time = 5
})

-- Função para validar e carregar o script
local function ValidateKey()
    local key = getgenv().KeyInput  -- Pega a key inserida
    if not linkCopied then
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Your key is invalid.",
            Image = "rbxassetid://89375684433942",
            Time = 5
        })
        return
    end

    if IsKeyValid(key) then
        OrionLib:MakeNotification({
            Name = "Valid Key",
            Content = "Key validated successfully!",
            Image = "rbxassetid://71378523145158",
            Time = 5
        })
        SaveKeyLocally(key) -- Salva a key localmente
        wait(1)
        OrionLib:Destroy() -- Fecha a interface
        wait(0.5)
        LoadMainScript() -- Carrega o script principal
    else
        OrionLib:MakeNotification({
            Name = "Invalid Key",
            Content = "Your key is invalid.",
            Image = "rbxassetid://89375684433942",
            Time = 5
        })
    end
end

-- Adicionar Textbox para entrada da key
Tab:AddTextbox({
    Name = "Enter Your Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        getgenv().KeyInput = Value -- Salva a key inserida em uma variável global
    end
})

-- Adicionar botão "Get Key"
Tab:AddButton({
    Name = "Get Key",
    Callback = function()
        setclipboard("get-keyy") -- Link para obter a key
        linkCopied = true -- Define o sinalizador como verdadeiro
        OrionLib:MakeNotification({
            Name = "Link Copied",
            Content = "Paste the link into your browser to get your key.",
            Image = "rbxassetid://101023107339989",
            Time = 5
        })
    end
})

-- Adicionar botão "Submit" para validar a key
Tab:AddButton({
    Name = "Submit",
    Callback = ValidateKey
})

-- Verificar se há uma key salva localmente e validá-la automaticamente
local savedKey = LoadSavedKey()

if savedKey then
    if IsKeyValid(savedKey) then
        OrionLib:MakeNotification({
            Name = "Key Found",
            Content = "Key loaded and validated automatically!",
            Image = "rbxassetid://71378523145158",
            Time = 5
        })
        wait(1)
        OrionLib:Destroy() -- Fecha a interface
        wait(0.5)
        LoadMainScript() -- Carrega o script principal
    else
        OrionLib:MakeNotification({
            Name = "Invalid Saved Key",
            Content = "You need a key.",
            Image = "rbxassetid://89375684433942",
            Time = 5
        })
    end
else
    OrionLib:MakeNotification({
        Name = "No Saved Key",
        Content = "You need a key.",
        Image = "rbxassetid://89375684433942",
        Time = 5
    })
end

-- Finaliza a UI
OrionLib:Init()
