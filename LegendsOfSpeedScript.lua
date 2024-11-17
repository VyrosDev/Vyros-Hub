local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/DemonnicHub/FeHarixC/refs/heads/main/OrionUI.lua"))()

-- Configurações iniciais da interface
local Window = OrionLib:MakeWindow({
    Name = "Key System",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionKeySystem"
})

-- Tab para o Key System
local KeyTab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Seção para Inserir a Chave
KeyTab:AddSection({
    Name = "Insira sua chave abaixo:"
})

-- Variável para armazenar a chave válida
local validKey = "Hello123"

-- Entrada de texto para a chave
KeyTab:AddTextbox({
    Name = "Digite sua chave",
    Default = "",
    TextDisappear = true,
    Callback = function(inputKey)
        if inputKey == validKey then
            OrionLib:MakeNotification({
                Name = "Acesso Permitido!",
                Content = "Chave válida! Você tem acesso ao script.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            -- Código para liberar acesso ao script
        else
            OrionLib:MakeNotification({
                Name = "Chave Inválida",
                Content = "A chave inserida não é válida.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

OrionLib:Init()
