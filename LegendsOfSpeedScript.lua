local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Criando a janela da UI
local Window = OrionLib:MakeWindow({
    Name = "Key System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KeySystemConfig"
})

-- Banco de dados local de chaves (associando chaves aos UserIDs)
local KeyDatabase = {}

-- Função para verificar se a chave é válida e associada ao jogador
local function IsKeyValid(key, player)
    -- Verifica se a chave existe e se está associada ao UserID correto
    local storedUserID = KeyDatabase[key]
    if storedUserID and storedUserID == player.UserId then
        return true
    end
    return false
end

-- Função para adicionar novas chaves manualmente com um UserID associado
local function AddKey(key, player)
    -- Verifica se a chave já está em uso
    for _, existingUserId in pairs(KeyDatabase) do
        if existingUserId == player.UserId then
            OrionLib:MakeNotification({
                Name = "Key Already Used",
                Content = "This key has already been used by another account.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            return
        end
    end
    -- Associa a chave ao UserID do jogador
    KeyDatabase[key] = player.UserId
    OrionLib:MakeNotification({
        Name = "Key Added",
        Content = "Key added successfully for this account.",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

-- Criando a interface para inserir a chave
local Tab = Window:MakeTab({
    Name = "Key Validation",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Textbox = Tab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local player = game.Players.LocalPlayer  -- Obtém o jogador local

        -- Verifica se a chave inserida é válida e associada ao jogador
        if IsKeyValid(Value, player) then
            OrionLib:MakeNotification({
                Name = "Key Validated",
                Content = "Key is valid and accepted!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Invalid Key",
                Content = "This key is either invalid or already used.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Função para adicionar novas chaves manualmente
local function AddNewKey()
    local newKey = "VyrosxC-84393"  -- Altere aqui para adicionar uma nova chave
    local player = game.Players.LocalPlayer  -- Obtém o jogador local
    AddKey(newKey, player)
end

-- Criando botão para adicionar uma chave manualmente ao script
local Button = Tab:AddButton({
    Name = "Add New Key",
    Callback = AddNewKey
})

-- Finaliza a inicialização da UI
OrionLib:Init()
