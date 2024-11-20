local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/OrionUIKeySystem.lua')))()
local Window = OrionLib:MakeWindow({Name = "VyrosxC | Key System 🔑", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystemConfig"})

-- Banco de dados local de chaves com UserID manualmente atribuídos
local KeyDatabase = {
    -- Adicione as chaves manualmente com UserID correspondente
    ["VyrosxC-99999"] = 1396119116,  -- @Alexg78909
    ["VyrosxC-43456"] = 1762542484,  -- @ericklopes16 
    ["VyrosxC-43824"] = 1980119628,  -- @CRXM_CRXM 
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
            Content = "This Key Already Exists In The System.",
            Image = "rbxassetid://89375684433942",
            Time = 5
        })
    else
        -- Adiciona a chave associada ao UserID
        KeyDatabase[key] = userID
        OrionLib:MakeNotification({
            Name = "Key Added",
            Content = "Key Successfully Added For UserID! " .. userID,
            Image = "rbxassetid://71378523145158",
            Time = 5
        })
    end
end

-- Criando a interface para inserir a chave
local Tab = Window:MakeTab({
    Name = "Key Validation",
    Icon = "rbxassetid://101023107339989",
    PremiumOnly = false
})

local Textbox = Tab:AddTextbox({
    Name = "Enter Your Premium Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local player = game.Players.LocalPlayer  -- Obtém o jogador local

        -- Verifica se a chave inserida é válida e associada ao jogador
        if IsKeyValid(Value, player) then
            OrionLib:MakeNotification({
                Name = "Key Validated",
                Content = "Key Is Valid And Accepted!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })

            -- Carregar o script adicional quando a chave for validada
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
})

-- Função para adicionar novas chaves manualmente
local function AddNewKey()
    local newKey = "VyrosxC-84393"  -- Altere aqui para adicionar uma nova chave
    local userID = "XXXXXXXXXX"  -- Substitua pelo UserID manualmente do jogador (exemplo)
    AddKey(newKey, userID)
end

-- Criando botão para adicionar uma chave manualmente ao script
local Button = Tab:AddButton({
    Name = "Verify Key",
    Callback = AddNewKey
})

-- Adicionando uma nova aba para exibir o "stats" do jogador
local StatsTab = Window:MakeTab({
    Name = "Player Stats",
    Icon = "rbxassetid://113927674495690",
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
