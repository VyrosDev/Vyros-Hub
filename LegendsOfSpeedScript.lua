local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/OrionUIKeySystem.lua')))()
local Window = OrionLib:MakeWindow({Name = "VyrosxC | Key System 🔑", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystemConfig"})

-- Banco de dados local de chaves com UserID manualmente atribuídos
local KeyDatabase = {
    -- Adicione as chaves manualmente com UserID correspondente
    ["VyrosxC-43456"] = 1762542484,  -- Exemplo: "chave" -> UserID
    ["VyrosxC-82384"] = 1396119116,  -- Outro exemplo de chave com outro UserID
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
    local userID = 1234567890  -- Substitua pelo UserID manualmente do jogador (exemplo)
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

local TabSection = Tab:AddSection({
    Name = "Your UserID"  -- Altere o nome para o que desejar
})	

    -- Atualiza o UserID
    UserIDLabel:Set("UserID: " .. player.UserId)

local TabSection = Tab:AddSection({
    Name = "Your Status"  -- Altere o nome para o que desejar
})	

    -- Verifica se o jogador está online (sempre estará para o jogador local, mas serve para outros jogadores)
    local isOnline = (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) and "🟢 Online" or "🔴 Offline"
    StatusLabel:Set("Status: " .. isOnline)

local TabSection = Tab:AddSection({
    Name = "Your Key Status"  -- Altere o nome para o que desejar
})

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

local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://96062201354965",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Information"
})

Tab:AddParagraph("VYROSXC HUB","Script Made By VyrosxC (@Alexg78909). Join Our Discord Server:")

Tab:AddButton({
    Name = "Click Here To See Discord Notification!",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "VyrosxC Hub",
            Content = "discord.gg/uydz6pZWMk",
            Image = "rbxassetid://101951842185056", 
            Time = 30  
        })
    end
})

local Section = Tab:AddSection({
	Name = "Collaborators"
})

Tab:AddParagraph("THANK YOU!","Collaboration By Demonnic_Fast (@ericklopes16)")

local Section = Tab:AddSection({
	Name = "V - 1.2.0"
})

OrionLib:MakeNotification({
	Name = "VyrosxC Hub",
	Content = "discord.gg/uydz6pZWMk",
	Image = "rbxassetid://101951842185056",
	Time = 30
})

-- Finaliza a inicialização da UI
OrionLib:Init()
