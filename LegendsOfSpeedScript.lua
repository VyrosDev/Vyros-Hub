local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Criando a janela da UI
local Window = OrionLib:MakeWindow({
    Name = "Key System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KeySystemConfig"
})

-- Banco de dados local de chaves com UserID manualmente atribuídos
local KeyDatabase = {
    -- Adicione as chaves manualmente com UserID correspondente
    ["VyrosxC-43456"] = 1234567890,  -- Exemplo: "chave" -> UserID
    ["VyrosxC-82384"] = 9876543210,  -- Outro exemplo de chave com outro UserID
}

-- Função para verificar se a chave é válida e associada ao jogador
local function IsKeyValid(key, player)
    local storedUserID = KeyDatabase[key]
    -- Verifica se a chave está no banco e se o UserID corresponde ao jogador
    if storedUserID and storedUserID == player.UserId then
        return true
    end
    return false
end

-- Função para adicionar novas chaves manualmente com UserID
local function AddKey(key, userID)
    -- Verifica se a chave já está no banco
    if KeyDatabase[key] then
        OrionLib:MakeNotification({
            Name = "Key Already Exists",
            Content = "This key already exists in the system.",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    else
        -- Adiciona a chave associada ao UserID
        KeyDatabase[key] = userID
        OrionLib:MakeNotification({
            Name = "Key Added",
            Content = "Key successfully added for UserID " .. userID,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
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
    local userID = 1234567890  -- Substitua pelo UserID manualmente do jogador (exemplo)
    AddKey(newKey, userID)
end

-- Criando botão para adicionar uma chave manualmente ao script
local Button = Tab:AddButton({
    Name = "Add New Key",
    Callback = AddNewKey
})

-- Adicionando uma nova aba para exibir o "stats" do jogador
local StatsTab = Window:MakeTab({
    Name = "Player Stats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Adicionando Label para exibir as informações do jogador
local UserIDLabel = StatsTab:AddLabel("UserID: Loading...")
local StatusLabel = StatsTab:AddLabel("Status: Loading...")
local KeyStatusLabel = StatsTab:AddLabel("Key Status: Loading...")

-- Função para atualizar as informações do jogador
local function UpdatePlayerStats()
    local player = game.Players.LocalPlayer  -- Obtém o jogador local

    -- Atualiza o UserID
    UserIDLabel:Set("UserID: " .. player.UserId)

    -- Verifica se o jogador está online (sempre estará para o jogador local, mas serve para outros jogadores)
    local isOnline = (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) and "🟢 Online" or "🔴 Offline"
    StatusLabel:Set("Status: " .. isOnline)

    -- Atualiza o status da chave
    local key = Textbox:Get()  -- Pega a chave inserida no Textbox
    if IsKeyValid(key, player) then
        KeyStatusLabel:Set("Key Status: ✅ Valid")
    else
        KeyStatusLabel:Set("Key Status: ❌ Invalid")
    end
end

-- Atualiza as informações do jogador a cada 5 segundos
while true do
    wait(5)  -- A cada 5 segundos
    UpdatePlayerStats()  -- Atualiza os "stats" do jogador
end

-- Finaliza a inicialização da UI
OrionLib:Init()
