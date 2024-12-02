-- Carregando a Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CkVyros/Vyros-Hub-UI/refs/heads/main/VyrosHubUI.lua')))()

-- Criando a Janela Principal
local Window = OrionLib:MakeWindow({
    Name = "Vyros Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "CustomOrion",
    IntroText = "Welcome!",
    IntroIcon = "rbxassetid://4483345998"
})

-- Criando uma Tab (Aba)
local Tab = Window:MakeTab({
    Name = "Main Controls",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})

-- Personalizando as cores
OrionLib:MakeNotification({
    Name = "UI Loaded",
    Content = "The interface has been successfully loaded!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Criando um Botão
Tab:AddButton({
    Name = "Click Me!",
    Callback = function()
        print("Button clicked!")
        OrionLib:MakeNotification({
            Name = "Button Action",
            Content = "You clicked the button!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Criando um Toggle
Tab:AddToggle({
    Name = "Activate Feature",
    Default = false,
    Callback = function(Value)
        print("Toggle is now:", Value)
        if Value then
            OrionLib:MakeNotification({
                Name = "Toggle Activated",
                Content = "Feature activated!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Toggle Deactivated",
                Content = "Feature deactivated!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

-- Finalizando e Inicializando a Interface
OrionLib:Init()
