--// Functions \\--


--// Vyros Hub \\--
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosDev/Vyros-Hub-UI/refs/heads/main/VyrosHubUI.lua')))()
local Window = OrionLib:MakeWindow({Name = "Vyros Hub | Death Ball", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Criando a Tab Principal
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://100789040568622",
    PremiumOnly = false
})

local StatsSection = Tab:AddSection({
    Name = "Player Info"
})

local UserIDLabel = Tab:AddLabel("UserID: " .. game.Players.LocalPlayer.UserId)
local StatusLabel = Tab:AddLabel("Status: Online")
local KeyLabel = Tab:AddLabel("Freemium Key: Valid ✅")

local StatsSection = Tab:AddSection({
    Name = "Player Time"
})

-- Variáveis para o contador de tempo no jogo
local timeInGame = 0  -- Tempo inicial em minutos

-- Função para pegar a hora atual em formato 24 horas
local function getCurrentTimeFormatted()
    local time = os.date("*t")  -- Obtém a data e hora atual
    local hour = time.hour
    local minute = time.min

    -- Ajusta para minutos com dois dígitos
    minute = string.format("%02d", minute)

    return string.format("%02d:%s", hour, minute)  -- Exibe no formato 24h
end

-- Adicionar os Labels para exibir o horário e o tempo no jogo
local TimeLabel = Tab:AddLabel("Hours: " .. getCurrentTimeFormatted())
local TimeInGameLabel = Tab:AddLabel("Game Time: 0d 00h 00m")  -- Adicionado depois, para ficar abaixo

-- Variáveis e label do FPS
local FPS = 0
local FPSLabel = Tab:AddLabel("FPS: Calculating...")

-- Função para atualizar o tempo de jogo
local function formatTime(minutes)
    local days = math.floor(minutes / 1440)  -- 1440 minutos em um dia
    local hours = math.floor((minutes % 1440) / 60)
    local mins = minutes % 60

    return string.format("%dd %02dh %02dm", days, hours, mins)
end

local function updateTimeInGame()
    timeInGame += 1  -- Incrementa o contador em 1 minuto
    TimeInGameLabel:Set("Game Time: " .. formatTime(timeInGame))
end

-- Função para atualizar os valores das estatísticas
local function UpdatePlayerStats()
    local player = game.Players.LocalPlayer
    local userID = player.UserId
    local playerStatus = "Online"  -- Status sempre online
    local playerKey = "Valid ✅"  -- Chave sempre válida

    -- Atualizar os Labels com os valores
    UserIDLabel:Set("UserID: " .. userID)
    StatusLabel:Set("Status: " .. playerStatus)
    KeyLabel:Set("Freemium Key: " .. playerKey)
end

-- Função para atualizar o horário
local function UpdateTime()
    TimeLabel:Set("Hours: " .. getCurrentTimeFormatted())
end

-- Função para calcular e atualizar o FPS
local function UpdateFPS()
    local frameCount = 0
    local lastUpdateTime = tick()
    
    game:GetService("RunService").RenderStepped:Connect(function()
        frameCount += 1
        local currentTime = tick()
        if currentTime - lastUpdateTime >= 1 then  -- Atualiza a cada segundo
            FPS = frameCount
            frameCount = 0
            lastUpdateTime = currentTime
            FPSLabel:Set("FPS: " .. FPS)  -- Atualiza o label de FPS
        end
    end)
end

-- Inicia o cálculo de FPS
UpdateFPS()

-- Atualiza o contador de tempo de jogo a cada minuto
task.spawn(function()
    while task.wait(60) do  -- Atualiza a cada 60 segundos (1 minuto)
        updateTimeInGame()
    end
end)

-- Atualiza as estatísticas e horário continuamente
game:GetService("RunService").Heartbeat:Connect(function()
    UpdatePlayerStats()
    UpdateTime()  -- Atualiza o horário
end)

local Section = Tab:AddSection({
    Name = "Main"
})

Tab:AddButton({
    Name = "Reset Character",  -- Nome do botão que aparece na UI
    Callback = function()
        ResetCharacter()  -- Chama a função para resetar o personagem
        print("The character has been reset to normal size!")
    end    
})

local Section = Tab:AddSection({
    Name = "Player Settings"
})	

local WalkSpeedTextbox = Tab:AddTextbox({
    Name = "Walk Speed",  -- Nome antes do valor
    Default = "500",  -- valor inicial da caixa
    TextDisappear = true,  -- faz o texto desaparecer quando o campo perde o foco
    Callback = function(value)
        -- Verifica se o valor inserido é um número válido
        local newWalkSpeed = tonumber(value)
        if newWalkSpeed then
            local currentJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
            setPlayerStats(newWalkSpeed, currentJumpPower)
        else
            print("Invalid value for WalkSpeed.")
        end
    end    
})

-- Adicionar um Textbox para digitar o JumpPower
local JumpPowerTextbox = Tab:AddTextbox({
    Name = "Jump Power",  -- Nome antes do valor
    Default = "200",  -- valor inicial da caixa
    TextDisappear = true,  -- faz o texto desaparecer quando o campo perde o foco
    Callback = function(value)
        -- Verifica se o valor inserido é um número válido
        local newJumpPower = tonumber(value)
        if newJumpPower then
            local currentWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
            setPlayerStats(currentWalkSpeed, newJumpPower)
        else
            print("Invalid value for JumpPower.")
        end
    end    
})

local Section = Tab:AddSection({
    Name = "Hip Height"
})

local HipHeightTextbox = Tab:AddTextbox({
    Name = "Hip Height",
    Default = "2.5",  -- valor inicial da caixa
    TextDisappear = true,  -- faz o texto desaparecer quando o campo perde o foco
    Callback = function(value)
        -- Verifica se o valor inserido é um número válido
        local newValue = tonumber(value)
        if newValue then
            setHipHeight(newValue)
            print("Hip height adjusted to: " .. newValue)
        else
            print("Invalid value for HipHeight.")
        end
    end    
})

local Section = Tab:AddSection({
	Name = "Game Options"
})

Tab:AddButton({
    Name = "Anti Kick",
    Callback = function()
        AntiKick()
        print("Anti-kick activated!")
    end    
})

Tab:AddButton({
    Name = "FPS Booster",
    Callback = function()
        optimizeFpsPing()  -- Chama a função de otimização
        print("Optimized graphics for better performance!")
    end    
})

local Section = Tab:AddSection({
	Name = "Emergency"
})

Tab:AddButton({
    Name = "Re-join The Game",  -- Nome do botão
    Callback = function()  -- Função chamada quando o botão for pressionado
        -- Teleporta o jogador de volta para o mesmo lugar onde ele está
        local teleportService = game:GetService("TeleportService")
        local player = game:GetService("Players").LocalPlayer
        teleportService:Teleport(game.PlaceId, player)  -- Teleporta para o PlaceId atual
        print("Trying to get into the game...")  -- Mensagem para confirmar que a ação foi executada
    end
})
