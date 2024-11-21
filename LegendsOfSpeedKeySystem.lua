local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosxC-Hub/VyrosxC/refs/heads/main/OrionUIKeySystem.lua')))()
local Window = OrionLib:MakeWindow({Name = "VyrosxC | Key System 🔑", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystemConfig"})

-- Banco de dados local de chaves com UserID manualmente atribuídos
local KeyDatabase = {
    -- Adicione as chaves manualmente com UserID correspondente
    ["VyrosxC-Alexg"] = 1396119116,  -- @Alexg78909 (Eu)
    ["VyrosxC-Clarkyy"] = 7532410585,  -- @zClarkyy (Eu)
    ["VyrosxC-FeHari"] = 5818980336,  -- @HA_FeHariAlt (Eu)
    ["VyrosxC-Gabezinn"] = 4933028875,  -- @Gabezinn_12 (Eu)  
    ["VyrosxC-janiszewskiblox"] = 4374535723,  -- @janiszewskiblox (Eu) 
    ["VyrosxC-Premium-94384"] = 1762542484,  -- @ericklopes16 (Erick)
    ["VyrosxC-Premium-81237"] = 5097989830,  -- @FX_BAHIANOOO (Alt Erick)
    ["VyrosxC-Premium-96934"] = 1980119628,  -- @CRXM_CRXM (Will)
    ["M4-Users008"] = 2628834524,  -- @M4N0TUE641 (Matue)
    ["VyrosxC-943823"] = 2852012097,  -- @Felpszin777 (AzureDarknessXs7) - 1 Dia Key, 21/11 - 23:00
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

-- Finaliza a inicialização da UI
OrionLib:Init()
