local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/DemonnicHub/FeHarixC/refs/heads/main/OrionUIScript.lua"))()

-- Configurações iniciais da interface
local Window = OrionLib:MakeWindow({
    Name = "Demonnic Hub | Key System 🔑",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionKeySystem"
})

-- Tab para o Key System
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://101023107339989",
    PremiumOnly = false
})

-- Seção para Inserir a Chave
KeyTab:AddSection({
    Name = "Enter your key"
})

-- Chaves válidas
local validKeys = {
    "VyrosxC-84393", -- Exemplo de chave 1
    "VyrosxC-43456", -- Exemplo de chave 2
    "VyrosxC-82384"  -- Exemplo de chave 3
}

-- Função para verificar se a chave inserida é válida
local function isKeyValid(inputKey)
    for _, key in ipairs(validKeys) do
        if inputKey == key then
            return true
        end
    end
    return false
end

-- Entrada de texto para a chave
KeyTab:AddTextbox({
    Name = "Enter your key",
    Default = "",
    TextDisappear = true,
    Callback = function(inputKey)
        if isKeyValid(inputKey) then
            OrionLib:MakeNotification({
                Name = "Access Granted!",
                Content = "Valid key! You have access to the script.",
                Image = "rbxassetid://71378523145158",
                Time = 5
            })
            -- Código para liberar o acesso ao script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DemonnicHub/VyrosxC/refs/heads/main/LegendsOfSpeedScript.lua"))()
        else
            OrionLib:MakeNotification({
                Name = "Invalid key",
                Content = "The key entered is not valid.",
                Image = "rbxassetid://89375684433942",
                Time = 5
            })
        end
    end
})

OrionLib:Init()
