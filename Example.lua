local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CamonScripts/Orion/refs/heads/main/OrionLib.lua"))()

local Window = OrionLib:MakeWindow({
	Name = "Demo UI",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "DemoConfig",
	IntroEnabled = false
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Controls"
})

Tab:AddButton({
	Name = "Print Message",
	Callback = function()
		print("Button pressed")
		OrionLib:MakeNotification({
			Name = "Notification",
			Content = "Button was pressed!",
			Image = "rbxassetid://4483345998",
			Time = 3
		})
	end
})

Tab:AddToggle({
	Name = "Toggle Option",
	Default = false,
	Callback = function(Value)
		print("Toggle:", Value)
	end
})

Tab:AddSlider({
	Name = "Adjust Value",
	Min = 0,
	Max = 100,
	Default = 25,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Value",
	Callback = function(Value)
		print("Slider:", Value)
	end
})

Tab:AddTextbox({
	Name = "Enter Text",
	Default = "Input",
	TextDisappear = true,
	Callback = function(Value)
		print("Textbox:", Value)
	end
})

Tab:AddColorpicker({
	Name = "Choose Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print("Color:", Value)
	end
})

Tab:AddDropdown({
	Name = "Select Option",
	Default = "Option 1",
	Options = {"Option 1", "Option 2", "Option 3"},
	Callback = function(Value)
		print("Dropdown:", Value)
	end
})

Tab:AddBind({
	Name = "Keybind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		print("Key pressed")
	end
})

OrionLib:Init()
