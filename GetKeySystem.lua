local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/DemonnicHub/FeHarixC/refs/heads/main/RayFieldUI.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "Default",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true, -- Habilita o sistema de chave
    KeySettings = {
        Title = "Acesso ao Script",
        Subtitle = "Por favor insira sua chave",
        Note = "A chave foi fornecida a você após compra.",
        FileName = "Key", -- Nome do arquivo da chave
        SaveKey = true, -- Salvar a chave para o usuário
        GrabKeyFromSite = false, -- Desabilitado, já estamos usando uma chave fixa
        Key = {"Hello123"} -- A chave aceita (pode ser uma chave personalizada)
    }
})

local Tab = Window:CreateTab("Sistema de Chaves", 4483362458) -- Cria uma nova aba para o sistema de chaves
local Section = Tab:CreateSection("Insira sua chave de acesso") -- Seção onde o usuário inserirá a chave

-- Criar um campo de entrada para o usuário inserir a chave
local Input = Tab:CreateInput({
    Name = "Chave de Acesso",
    CurrentValue = "", -- Valor inicial vazio
    PlaceholderText = "Insira sua chave aqui",
    RemoveTextAfterFocusLost = true, -- Remover texto após o campo perder o foco
    Flag = "KeyInput", -- Identificador único para o campo de entrada
    Callback = function(Text)
        -- Função chamada quando o texto é alterado
        print("Chave inserida: " .. Text)
        -- Aqui você pode adicionar qualquer lógica para verificar a chave inserida
        -- Verificar se a chave fornecida é válida
        if Text == "Hello123" then
            Rayfield:Notify({
                Title = "Acesso Permitido",
                Content = "Chave válida! Você tem acesso ao script.",
                Duration = 3,
                Image = 4483362458,
            })
            -- Aqui você pode colocar o código para liberar o acesso ao script
        else
            Rayfield:Notify({
                Title = "Chave Inválida",
                Content = "A chave fornecida é inválida. Por favor, verifique.",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end
})

-- Exemplo de botão para verificar a chave
local Button = Tab:CreateButton({
    Name = "Verificar Chave",
    Callback = function()
        local key = Input:Get()  -- Obtém o valor do campo de entrada
        print("Verificando chave: " .. key)
        -- Aqui você pode adicionar a lógica de verificação
        if key == "Hello123" then
            Rayfield:Notify({
                Title = "Acesso Permitido",
                Content = "Chave válida! Você pode usar o script.",
                Duration = 3,
                Image = 4483362458,
            })
        else
            Rayfield:Notify({
                Title = "Chave Inválida",
                Content = "A chave fornecida é inválida.",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end
})

Button:Set("Verificar Chave") -- Configura o nome do botão

Rayfield:Destroy()
