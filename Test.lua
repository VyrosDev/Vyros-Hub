--// Variables \\--

getgenv().HoopFarm = false

getgenv().OpenEgg = false -- Fixo

getgenv().eggOpen = false -- Temporário

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Chr = Player.Character

Player.CharacterAdded:Connect(function()
    Chr = Player.Character
end)

local ChrHead = Chr.Head
local Humanoid = Chr.Humanoid
local Root = Chr.HumanoidRootPart

--// Tables \\--

local Crystals = {}

--// Functions \\--

-- Function Expand Torso --
local function ExpandTorso()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local torso = character:WaitForChild("UpperTorso")

    -- Definindo a taxa de expansão
    local expansionRate = Vector3.new(2, 2, 2) 

    -- Expande o torso
    torso.Size = torso.Size + expansionRate
end

-- Function Reset Character --
local function ResetCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    -- Destrói a estrutura atual do personagem (quebrando os joints)
    character:BreakJoints()

    -- O Roblox vai automaticamente gerar um novo personagem, retornando ao seu estado inicial
    print("The character has been reset to its original state!")
end

-- Function City Teleports --
local function SelectCity(city)
    if city == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9686.27148, 58.9799881, 3110.75903, -0.993164003, 2.12365538e-08, -0.116727315, 2.63954707e-08, 1, -4.26504876e-08, 0.116727315, -4.54400002e-08, -0.993164003)
    elseif city == "Snow City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9672.77832, 58.9799881, 3768.75171, 0.991323948, -1.89020124e-08, -0.131441399, 1.31006459e-08, 1, -4.50012685e-08, 0.131441399, 4.28888676e-08, 0.991323948)
    elseif city == "Magma City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11051.4258, 216.940002, 4886.27832, 0.987576485, 3.03587235e-08, -0.157139242, -3.89276664e-08, 1, -5.14532452e-08, 0.157139242, 5.69310785e-08, 0.987576485)
    elseif city == "Legends Highway" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13095.9746, 214.580338, 5895.57568, 0.999146283, 0.0376458429, -0.0170128513, -0.037201196, 0.99897629, 0.0257374309, 0.0179643426, -0.0250825603, 0.999523938)
    end
end

-- Function Maps Teleports --
local function SelectMap(location)
    if location == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2506.85156, 14.74121, 4353.92725, -0.0108262217, 3.44026461e-08, 0.999941409, 4.99142838e-10, 1, -3.43992568e-08, -0.999941409, 1.26699637e-10, -0.0108262217)
    elseif location == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-346.1203, 3.85000086, 577.441223, 0.649530411, -5.26415e-08, 0.760335565, -2.8906797e-08, 1, 9.39287119e-08, -0.760335565, -8.29884286e-08, 0.649530411)
    end
end

-- Function Chest Teleports --
local function SelectChest(chest)
    if chest == "Main City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-668.435242, 64.7499619, -263.600342, -0.588192225, -6.5145052e-08, -0.808721185, 4.4101709e-09, 1, -8.37607317e-08, 0.808721185, -5.28340109e-08, -0.588192225)
    elseif chest == "Snow City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.912415, 72.749939, 2143.3291, -0.99671495, 7.0440322e-08, -0.080989778, 7.61660246e-08, 1, -6.76071892e-08, 0.080989778, -7.3553764e-08, -0.99671495)
    elseif chest == "Magma City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2482.57764, 68.8001709, 3992.08301, -0.688194096, 3.17123816e-09, 0.725526631, 2.77723515e-08, 1, 2.19723582e-08, -0.725526631, 3.52708263e-08, -0.688194096)
    end
end

-- Function Spawn Teleports --
local function SelectLocation(location)
    if location == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-555.846985, 3.80000067, 399.529388, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif location == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(262.487244, 645.934387, -180.146057, 0.999046028, 0, 0.043669384, 0, 1, 0, -0.043669384, 0, 0.999046028)
    elseif location == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(247.883865, 73.0481033, -272.587677, 0.993579924, -8.65447536e-09, -0.113132581, -5.42947631e-10, 1, -8.12669327e-08, 0.113132581, 8.08066147e-08, 0.993579924)
    end
end

-- Function Auto Race V1 --
_G.Farm = false

-- Função para teletransportar-se para os 3 mapas (exemplo original)
local function teleportToMaps()
    while _G.Farm do
        pcall(function()
            -- Teleporte para Grassland
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(48.311, 36.315, -8680.453)
            wait(0.3)
            -- Teleporte para Magma
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1686.075, 36.315, -5946.634)
            wait(0.3)
            -- Teleporte para Desert
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001.331, 36.315, -10986.218)
            wait(0.3)
        end)
    end
end

-- Função para teletransportar-se para o Space
local function teleportToSpace()
    while _G.Farm do
        pcall(function()
            -- Teleporte para o ponto de início do Space
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4970.01709, 36.0000916, -4805.07861, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            wait(0.3)
            -- Teleporte para o ponto de vitória do Space
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4945.31689, 36.0000916, -4805.07861, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            wait(0.3)
        end)
    end
end

-- Função para teletransportar-se para o Desert
local function teleportToDesert()
    while _G.Farm do
        pcall(function()
            -- Teleporte para o ponto de início do Desert
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(636.770996, 161.306763, 9718.75, -0.999040902, 0.000210345868, -0.043785546, 0.00021885868, 0.99999994, -0.000189627055, 0.043785505, -0.000199028043, -0.999040961)
            wait(0.3)
            -- Teleporte para o ponto de vitória do Desert
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2061.12476, 219.799164, 17953.8984, 0.949868321, -9.90087301e-09, 0.312650263, 5.16601206e-10, 1, 3.00980716e-08, -0.312650263, -2.84276886e-08, 0.949868321)
            wait(0.3)
        end)
    end
end

-- Função para parar o auto farm
local function stopAutoFarm()
    _G.Farm = false
end

-- Função Auto Race
local function toggleAutoRaces(state)
    _G.Farm = state
    if state then
        spawn(function()
            while _G.Farm do
                pcall(function()
                    -- Participar da corrida
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    wait(0.1)
                    -- Interagir com checkpoints na corrida
                    local part = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(game:GetService("Workspace").raceMaps:GetDescendants()) do
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                wait(0.1)
            end
        end)
        
        -- Chama o teleporte conforme o mapa selecionado
        if _G.SelectedTeleport == "Space" then
            teleportToSpace() -- Teleporte para o Space
        elseif _G.SelectedTeleport == "Main City" then
            teleportToMaps() -- Teleporte para os 3 mapas originais
        elseif _G.SelectedTeleport == "Desert" then
            teleportToDesert() -- Teleporte para o Desert
        end
    else
        stopAutoFarm()
    end
end

-- Function Anti-Kick --
local function AntiKick()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- Function Low Graphics --
local function optimizeFpsPing()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")


-- Function Auto Race V2 --
game:GetService('ReplicatedStorage').raceInProgress.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceInProgress.Value == true then
            game:GetService('ReplicatedStorage').rEvents.raceEvent:FireServer("joinRace")  -- Envia o evento para o servidor para entrar na corrida
        end
    end
end)

game:GetService('ReplicatedStorage').raceStarted.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceStarted.Value == true then
            -- Teleporta o jogador para a posição de corrida quando a corrida começar
            for i, v in pairs(game:GetService('Workspace').raceMaps:GetChildren()) do
                local OldFinishPosition = v.finishPart.CFrame
                v.finishPart.CFrame = Player.Character.HumanoidRootPart.CFrame
                wait()
                v.finishPart.CFrame = OldFinishPosition
            end
        end
    end
end)

-- Function Hip Height --
local function setHipHeight(value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.HipHeight = value
end

-- Function WalkSpeed e JumpPower --
local function setPlayerStats(walkSpeed, jumpPower)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Ajusta a velocidade
    humanoid.WalkSpeed = walkSpeed
    print("Speed ​​adjusted to: " .. walkSpeed)
    
    -- Ajusta o poder de pulo
    humanoid.JumpPower = jumpPower
    print("Jump power adjusted to: " .. jumpPower)
end

-- Function Rebirths Stopping Point"
local targetRebirth = 99999  -- Valor alvo de rebirths (inicialmente definido como 999)
local currentRebirths = 0  -- Número atual de rebirths (vai ser atualizado com base no jogo)

-- Função para realizar o rebirth
local function Rebirth()
    task.wait(0.7)
    local ohString1 = "rebirthRequest"
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(ohString1)
end

-- Monitorando o número atual de renascimentos (rebirths)
local function getCurrentRebirths()
    -- Aqui você vai acessar a informação de rebirths do jogador
    -- Como não tenho acesso exato à variável no seu jogo, vou simular com uma variável fictícia
    return game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value
end

-- Função que realiza o rebirth automaticamente enquanto o número de rebirths não atingir o alvo
local function autoRebirth()
    while true do
        -- Atualiza o número atual de renascimentos
        currentRebirths = getCurrentRebirths()
        
        -- Se atingiu o número alvo de rebirths, para a execução
        if currentRebirths >= targetRebirth then
            print("Rebirth target reached: " .. currentRebirths)
            break
        end
        
        -- Realiza o rebirth
        Rebirth()
        
        -- Aguardar algum tempo entre os rebirths (ajuste conforme necessário)
        task.wait(0.7)  -- Aguarda 7 segundos entre os rebirths
    end
end

-- Function Delete Barrier --
local function deleteBarrier()
    spawn(function()
        local boundaries = {
            game:GetService("Workspace").raceMaps.Grassland.boundaryParts,
            game:GetService("Workspace").raceMaps.Desert.boundaryParts,
            game:GetService("Workspace").raceMaps.Magma.boundaryParts		
        }

        for _, boundary in ipairs(boundaries) do
            for _, part in pairs(boundary:GetChildren()) do
                part:Destroy()  -- Remove a barreira (parte)
            end
        end
        print("Barriers removed!")
    end)
end

-- Function Chat Flood --
local function sendChatMessage(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- Variáveis globais para controle
_G.SendMessages = false  
_G.Interval = 1          
_G.Message = ""  

-- Function Demonnic The Best Hub --
local function sendChatMessage(message)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

-- Variável para controlar o estado do Toggle
local teleportEnabled = false

-- Função para detectar cliques e teleportar
local function setupClickTeleport()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    mouse.Button1Down:Connect(function()
        if teleportEnabled then
            local targetPosition = mouse.Hit.Position
            if targetPosition then
                pcall(function()
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
                end)
            end
        end
    end)
end

-- Inicializa o listener de cliques
setupClickTeleport()

local selectedLocation = "None"
local selectedOrb = "None"
local collectionSpeed = "x150"
local isCollecting = false

-- Function Auto Farm --
local selectedLocation = "None"
local selectedOrb = "None"
local collectionSpeed = "x150"
local isCollecting = false

local speedMap = {
    ["x50"] = 50, 
    ["x75"] = 75, 	
    ["x100"] = 100,	
    ["x150"] = 150,
    ["x175"] = 175,
    ["x200"] = 200,	
    ["x250"] = 250,
    ["x275"] = 275,	
    ["x300"] = 300	
}

local function SetLocation(location)
    selectedLocation = location
    print("Selected location: " .. location)
end

local function SetOrb(orb)
    selectedOrb = orb
    print("Orb selected: " .. orb)
end

local function SetCollectionSpeed(speed)
    collectionSpeed = speed
    print("Selected collection speed: " .. speed)
end

local function CollectOrbs()
    if selectedLocation == "None" or selectedOrb == "None" then
        print("Select a location and an Orb before collecting.")
        return
    end

    local repetitions = speedMap[collectionSpeed] or 100 
    print("Collecting " .. selectedOrb .. " in " .. selectedLocation .. " with " .. repetitions .. " repetitions.")

    for i = 1, repetitions do
        game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", selectedOrb, selectedLocation)
    end
end

-- Função para ativar o "noPing"
local function NoPing()
    while noPingEnabled do
        -- Enviar um evento para o servidor para tentar estabilizar o ping
        game:GetService("ReplicatedStorage").rEvents.someEvent:FireServer("pingCheck")  -- Aqui você envia um evento fictício
        wait(0.1)  -- Espera de 100ms, pode ajustar conforme necessário
    end
end

-- Hoop V2
local function HoopFarmV2()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("HumanoidRootPart") then
        local children = workspace.Hoops:GetChildren()
        for i, child in ipairs(children) do
            if child.Name == "Hoop" then
                child.CFrame = Chr.HumanoidRootPart.CFrame
            end    
        end
    end
end
-- Hoop V1
local function HoopFarm()
    if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
        for i, v in next, game:GetService("Workspace").Hoops:GetDescendants() do
            if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
            task.wait()
            firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 1)
            end
        end
    end
end

-- Variável de estado do noclip
local noclipEnabled = false

-- Função de noclip
local function toggleNoclip(state)
    noclipEnabled = state
    if noclipEnabled then
        print("Noclip activated")
    else
        print("Noclip disabled")
    end
end

-- Function noclip
game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- Function Infinite Jump
local infiniteJumpEnabled = false  -- Flag que indica se o Infinite Jump está ativado

local function toggleInfiniteJump()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        -- Ativa ou desativa o Infinite Jump
        if infiniteJumpEnabled then
            -- Desativa o Infinite Jump (restaurando o comportamento normal do salto)
            humanoid.JumpPower = 50  -- Valor normal de JumpPower
            infiniteJumpEnabled = false
            print("Infinite Jump Disabled")
        else
            -- Ativa o Infinite Jump (aumentando o JumpPower)
            humanoid.JumpPower = 200  -- Valor alto para o salto infinito
            infiniteJumpEnabled = true
            print("Infinite Jump Enabled")
        end
    end
end




--// Vyros Hub \\--
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CkVyros/Vyros-Hub-UI/refs/heads/main/VyrosHubUI.lua')))()
local Window = OrionLib:MakeWindow({Name = "Vyros Hub | Legends Of Speed", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

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
local KeyLabel = Tab:AddLabel("Key: Valid ✅")

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
local TimeLabel = Tab:AddLabel("Time: " .. getCurrentTimeFormatted())
local TimeInGameLabel = Tab:AddLabel("Playing: 0d 00h 00m")  -- Adicionado depois, para ficar abaixo

-- Função para atualizar o tempo de jogo
local function formatTime(minutes)
    local days = math.floor(minutes / 1440)  -- 1440 minutos em um dia
    local hours = math.floor((minutes % 1440) / 60)
    local mins = minutes % 60

    return string.format("%dd %02dh %02dm", days, hours, mins)
end

local function updateTimeInGame()
    timeInGame += 1  -- Incrementa o contador em 1 minuto
    TimeInGameLabel:Set("Playing: " .. formatTime(timeInGame))
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
    KeyLabel:Set("Key: " .. playerKey)
end

-- Função para atualizar o horário
local function UpdateTime()
    TimeLabel:Set("Time: " .. getCurrentTimeFormatted())
end

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
    Name = "Expand Torso",  -- Nome do botão que aparece na UI
    Callback = function()
        ExpandTorso()  -- Chama a função que expande o torso
        print("Successfully expanded torso!")
    end    
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
    Name = "Anti-Kick",
    Callback = function()
        AntiKick()
        print("Anti-kick activated!")
    end    
})

Tab:AddButton({
    Name = "Low Graphics",
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

local Tab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://103168823763561",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "City Teleports"
})

Tab:AddDropdown({
    Name = "Select City",
    Default = "None",
    Options = {"None","Main City", "Snow City", "Magma City", "Legends Highway"},
    Callback = function(Value)
        SelectCity(Value)
    end    
})

local Section = Tab:AddSection({
	Name = "Maps Teleports"
})

Tab:AddDropdown({
    Name = "Select Map",
    Default = "None",
    Options = {"None","Desert", "Space"},
    Callback = function(Value)
        SelectMap(Value) 
    end    
})

local Section = Tab:AddSection({
	Name = "Spawn Teleports"
})

Tab:AddDropdown({
    Name = "Select Spawn",
    Default = "None",
    Options = {"None", "Main City", "Desert", "Space"},
    Callback = function(Value)
        SelectLocation(Value) 
    end    
})

local Section = Tab:AddSection({
	Name = "Chest Teleports"
})

Tab:AddDropdown({
    Name = "Select Chest",
    Default = "None",
    Options = {"None","Main City Chest", "Snow City Chest", "Magma City Chest"},
    Callback = function(Value)
        SelectChest(Value) 
    end    
})

local Tab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://78744214847458",
	PremiumOnly = false
})

local StatsSection = Tab:AddSection({
    Name = "Auto Farm"
})

Tab:AddDropdown({
    Name = "Select City",
    Default = "None",
    Options = {"None", "City", "Magma City"},
    Callback = function(Value)
        SetLocation(Value)
    end    
})

-- Dropdown para selecionar o Orb
Tab:AddDropdown({
    Name = "Select Orb",
    Default = "None",
    Options = {"None", "Red Orb", "Yellow Orb"},
    Callback = function(Value)
        SetOrb(Value)
    end    
})

-- Dropdown para selecionar a velocidade de coleta
Tab:AddDropdown({
    Name = "Select Speed",
    Default = "None",
    Options = {"None","x50", "x75", "x100", "x150", "x175", "x200", "x250", "x275", "x300"},
    Callback = function(Value)
        SetCollectionSpeed(Value)
    end    
})

Tab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        isCollecting = state
        print("Auto Farm Status: " .. (isCollecting and "Enabled" or "Disabled"))

        while isCollecting do
            CollectOrbs()
            wait(0.3) 
        end
    end    
})

Tab:AddToggle({
    Name = "No Ping",
    Default = false,
    Callback = function(state)
        noPingEnabled = state  -- Atualiza o estado de noPing
        print("No Ping " .. (noPingEnabled and "Enabled" or "Disabled"))
        
        -- Inicia o NoPing ou para dependendo do toggle
        if noPingEnabled then
            NoPing()  -- Inicia o noPing
        end
    end    
})

local Section = Tab:AddSection({
	Name = "Hoops Farm"
})

Tab:AddToggle({
	Name = "Hoops V1",
	Default = false,
	Callback = function(Value)
		getgenv().Hoop = Value
        while Hoop do
            HoopFarm()
            task.wait()
        end
	end    
})

Tab:AddToggle({
	Name = "Hoops V2",
	Default = false,
	Callback = function(Value)
		getgenv().HoopV2 = Value
        while HoopV2 do
            HoopFarmV2()
            task.wait()
        end
	end    
})

local Tab = Window:MakeTab({
    Name = "Stats",
    Icon = "rbxassetid://113927674495690",
    PremiumOnly = false
})

-- Seções para cada estatística
local StepsSection = Tab:AddSection({
    Name = "Steps"
})
local RebirthsSection = Tab:AddSection({
    Name = "Rebirths"
})
local HoopsSection = Tab:AddSection({
    Name = "Hoops"
})
local RacesSection = Tab:AddSection({
    Name = "Races"
})

-- Labels para mostrar os valores
local StepsLabel = StepsSection:AddLabel("Steps: 0")
local RebirthsLabel = RebirthsSection:AddLabel("Rebirths: 0")
local HoopsLabel = HoopsSection:AddLabel("Hoops: 0")
local RacesLabel = RacesSection:AddLabel("Races: 0")

-- Função para atualizar os valores das estatísticas
local function UpdateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:WaitForChild("leaderstats")

    local steps = leaderstats:WaitForChild("Steps").Value
    local rebirths = leaderstats:WaitForChild("Rebirths").Value
    local hoops = leaderstats:WaitForChild("Hoops").Value
    local races = leaderstats:WaitForChild("Races").Value

    -- Atualizar os Labels com os valores
    StepsLabel:Set("Steps: " .. steps)
    RebirthsLabel:Set("Rebirths: " .. rebirths)
    HoopsLabel:Set("Hoops: " .. hoops)
    RacesLabel:Set("Races: " .. races)
end

-- Atualizar as estatísticas sempre que um valor mudar
local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")

leaderstats.Steps.Changed:Connect(UpdateStats)
leaderstats.Rebirths.Changed:Connect(UpdateStats)
leaderstats.Hoops.Changed:Connect(UpdateStats)
leaderstats.Races.Changed:Connect(UpdateStats)

-- Atualizar as estatísticas imediatamente ao rodar o script
UpdateStats()

local Tab = Window:MakeTab({
	Name = "Auto Rebirth",
	Icon = "rbxassetid://124658295933505",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Rebirth Stopping Point"
})

Tab:AddTextbox({
    Name = "Rebirth",
    Default = "0",  -- valor padrão
    TextDisappear = true,
    Callback = function(value)
        -- Atualizar o valor do targetRebirth baseado no que o jogador digitou
        local target = tonumber(value)
        if target then
            targetRebirth = target
            print("Rebirth goal set to: " .. targetRebirth)
        else
            print("Invalid value!")
        end
    end
})

Tab:AddToggle({
    Name = "Rebirth Stopping Point",
    Default = false,
    Callback = function(value)
        if value then
            autoRebirth()
        else
            print("Auto-rebirth disabled.")
        end
    end
})

local Section = Tab:AddSection({
	Name = "Auto Rebirth"
})

Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().AutoRebirth = Value
        while AutoRebirth do
            Rebirth()
            task.wait(0.7)
        end
	end    
})

local Tab = Window:MakeTab({
	Name = "Auto Race",
	Icon = "rbxassetid://97860628277392",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Auto Race"
})

local Dropdown = Tab:AddDropdown({
    Name = "Select Map",
    Default = "None",
    Options = {"None","Main City", "Space", "Desert"},
    Callback = function(selectedOption)
        _G.SelectedTeleport = selectedOption
        print("Selected Teleport: " .. selectedOption)
    end
})

Tab:AddToggle({
    Name = "Auto Race V1",
    Default = false,
    Callback = function(Value)
        toggleAutoRaces(Value)
    end
})

Tab:AddToggle({
    Name = "Auto Race V2",
    Default = false,  -- Define como desativado por padrão
    Callback = function(Value)
        AutoRaceToggle = Value  -- Atualiza o estado do toggle para AutoRace
        print("Auto Race:", Value)
    end
})

local Section = Tab:AddSection({
	Name = "Extremely Fast Races"
})

Tab:AddToggle({
    Name = "Auto Fill Race",  -- Nome do botão
    Callback = function(value) 
        -- A variável 'value' recebe o estado atual do toggle (true ou false)
        autoFillRaceActive = value  -- Atualiza o estado de ativação do toggle
        
        -- Se o toggle for ativado, começa a executar a função
        if autoFillRaceActive then
            -- Inicia a ação de preencher a corrida
            spawn(function()
                while autoFillRaceActive do  -- O loop continua enquanto o toggle estiver ativado
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace", true)
                    wait()  -- Intervalo entre as tentativas para evitar sobrecarregar o servidor
                end
            end)
        end
    end    
})

local Section = Tab:AddSection({
	Name = "Extra"
})

Tab:AddButton({
    Name = "Delete Barriers",
    Callback = function()
        deleteBarrier() 
    end    
})

local Tab = Window:MakeTab({
	Name = "PC Exploits",
	Icon = "rbxassetid://92103740798042",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Note"
})

Tab:AddParagraph("READ","The Above Scripts Are Fully Compatible With Mob, But Are PC Specific.")

local Section = Tab:AddSection({
	Name = "Auto Race"
})

Tab:AddButton({
    Name = "Auto Race - Script",  -- Nome do botão
    Callback = function() 
        -- Quando o botão for pressionado, o script será executado
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CkVyros/Vyros-Hub/refs/heads/main/AutoRacePC.lua"))()
    end    
})

local Section = Tab:AddSection({
	Name = "Auto Farm"
})

Tab:AddButton({
    Name = "Auto Farm - Script",  -- Nome do botão
    Callback = function() 
        -- Quando o botão for pressionado, o script será executado
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CkVyros/Vyros-Hub/refs/heads/main/AutoFarmPC.lua"))()
    end    
})

local Tab = Window:MakeTab({
	Name = "Chat Spam",
	Icon = "rbxassetid://112552741196505",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Chat Spam"
})

Tab:AddTextbox({
    Name = "Chat Spam",
    Default = "Here",
    TextDisappear = false,
    Callback = function(Value)
        _G.Message = Value  -- Armazena a mensagem digitada
    end
})

-- Adicionando um Textbox para o intervalo de envio
Tab:AddTextbox({
    Name = "Interval",
    Default = "1",  -- Intervalo padrão de 1 segundo
    TextDisappear = false,
    Callback = function(Value)
        _G.Interval = tonumber(Value) or 1  -- Armazena o intervalo, garantindo que seja um número
    end
})

-- Adicionando o Toggle para ativar ou desativar o envio de mensagens
Tab:AddToggle({
    Name = "Send Spam",
    Default = false,
    Callback = function(Value)
        _G.SendMessages = Value  -- Habilita ou desabilita o envio das mensagens
        if Value then
            spawn(function()  -- Usando spawn para rodar o envio de forma assíncrona
                while _G.SendMessages do
                    if _G.Message ~= "" then  -- Verifica se a mensagem não está vazia
                        sendChatMessage(_G.Message)  -- Envia a mensagem
                    end
                    wait(_G.Interval)  -- Aguarda o intervalo antes de enviar novamente
                end
            end)
        end
    end
})

local Section = Tab:AddSection({
	Name = "Vyros Hub Spam"
})

Tab:AddButton({
    Name = "Click Here To Help Us",
    Callback = function()
        spawn(function()
            for i = 1, 5 do
                sendChatMessage("Vyros The Best Hub!")  -- Envia a mensagem desejada
                wait(0.2)  -- Aguarda 0.2 segundos antes de enviar a próxima mensagem
            end
        end)
    end
})

local Tab = Window:MakeTab({
	Name = "Rebirths",
	Icon = "rbxassetid://99813545305255",
	PremiumOnly = false
})

Tab:AddParagraph("GLITCHABLE REBIRTHS","The Best Legends Of Speed ​​Rebirths, From 1K To 12K ⚡")

local Section = Tab:AddSection({
	Name = "Rebirth Amount - Pet Rarity"
})

Tab:AddParagraph("999 | Epic Pets | Red Orb, Magma City | +25","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("1499 | Advanced Pets | Red Orb, Magma City | +27","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("1749 | Unique Pets | Red Orb, Magma City | +36","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("2399 | Epic Pets | Red Orb, Magma City | +40","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("2999 | Unique Pets | Red Orb, Magma City | +48","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("3749 | Unique Pets | Red Orb, Magma City | +54","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("4399 | Epic Pets | Red Orb, Magma City | +55","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("5499 | Unique Pets | Red Orb, Magma City | +66","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("6499 | Unique Pets | Red Orb, Magma City | +72","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("8749 | Unique Pets | Red Orb, Magma City | +84","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("9999 | Unique Pets | Red Orb, Magma City | +90","Level 1 Glitches Instantly (FAST REBIRTH)")

Tab:AddParagraph("12749 | Unique Pets | Red Orb, Magma City | +102","Level 1 Glitches Instantly (FAST REBIRTH)")

local Section = Tab:AddSection({
	Name = "Note"
})

Tab:AddParagraph("READ","All The Mentioned Rebirths Require a Game Pass, That Is, It Will Only Work Properly If You Have Some Passes Like: Infinite Level, 2x Level, 2x Rebirths, +2 Pet Slots. Good Luck!")

local Tab = Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://89185070084837",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Misc"
})

Tab:AddToggle({
	Name = "Click TP",
	Default = false,
	Callback = function(state)
		teleportEnabled = state
	end
})

Tab:AddToggle({
    Name = "No Clip",
    Default = false,
    Callback = function(Value)
        toggleNoclip(Value)
    end
})

Tab:AddButton({
    Name = "Infinite Jump",
    Callback = function()
        local infiniteJumpEnabled = false  -- Estado inicial desativado

        -- Alterna o estado do Infinite Jump
        infiniteJumpEnabled = not infiniteJumpEnabled

        if infiniteJumpEnabled then
            print("Infinite Jump Activated")
            -- Habilita o Infinite Jump
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if infiniteJumpEnabled then
                    local player = game.Players.LocalPlayer
                    if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        else
            print("Infinite Jump Deactivated")
        end
    end    
})

local GravityTextbox = Tab:AddTextbox({
    Name = "Gravity",
    Default = "196.2",  -- Valor padrão da gravidade
    TextDisappear = true,
    Callback = function(Value)
        -- Verifica se o valor inserido é válido (um número)
        local gravityValue = tonumber(Value)
        if gravityValue then
            -- Aplica a nova gravidade ao personagem
            workspace.Gravity = gravityValue
        else
            -- Se não for um número válido, mantém a gravidade padrão
            OrionLib:MakeNotification({
                Name = "Invalid Input!",
                Content = "Please enter a valid number for gravity.",
                Image = "rbxassetid://89375684433942",
                Time = 5
            })
        end  
    end    
})

local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://96062201354965",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Information"
})

Tab:AddParagraph("VYROS HUB","Script Made By Ck_Vyros (@Alexg78909). Join Our Discord Server:")

Tab:AddButton({
    Name = "Click Here To Copy Discord Link",
    Callback = function()
        setclipboard("discord.gg/uydz6pZWMk") -- Link para obter a key
        linkCopied = true -- Define o sinalizador como verdadeiro
        OrionLib:MakeNotification({
            Name = "Link Copied",
            Content = "Paste the link into your browser.",
            Image = "rbxassetid://71378523145158",
            Time = 5
        })
    end
})


local Section = Tab:AddSection({
	Name = "Collaborators"
})

Tab:AddParagraph("MY HONEY!","Collaboration By Clarkyy (@zClarkyy)")

local Section = Tab:AddSection({
	Name = "V - 1.5"
})

OrionLib:MakeNotification({
	Name = "Vyros Hub Freemium",
	Content = "Your Key Freemium Is Validated!",
	Image = "rbxassetid://101023107339989",
	Time = 15
})

OrionLib:MakeNotification({
	Name = "Vyros Hub",
	Content = "discord.gg/uydz6pZWMk",
	Image = "rbxassetid://101951842185056",
	Time = 20
})

OrionLib:MakeNotification({
	Name = "Script Version",
	Content = "V - 1.5",
	Image = "rbxassetid://83863323756908",
	Time = 10
})



OrionLib:Init()
