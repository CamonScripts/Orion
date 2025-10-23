# 🌌 **Orion Library Documentation**

This documentation covers the **stable release** of the Orion Library for Roblox.  
It includes setup instructions, UI creation, and examples for all supported components.

---

## ⚙️ Booting the Library

```lua
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CamonScripts/Orion/refs/heads/main/OrionLib.lua"))()
```

---

## 🪟 Creating a Window

```lua
local Window = OrionLib:MakeWindow({
	Name = "Title of the library",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "OrionTest"
})
```

**Parameters:**
- **Name** *(string)* — The name of the UI.  
- **HidePremium** *(bool)* — Whether the user’s Premium status is hidden.  
- **SaveConfig** *(bool)* — Enables or disables configuration saving.  
- **ConfigFolder** *(string)* — Folder name where configs are saved.  
- **IntroEnabled** *(bool)* — Whether to show an intro animation.  
- **IntroText** *(string)* — Text displayed in the intro animation.  
- **IntroIcon** *(string)* — URL to the intro animation’s image.  
- **Icon** *(string)* — Window icon image URL.  
- **CloseCallback** *(function)* — Function executed when the window closes.  

---

## 📁 Creating a Tab

```lua
local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
```

**Parameters:**
- **Name** *(string)* — Tab title.  
- **Icon** *(string)* — Tab icon asset ID or URL.  
- **PremiumOnly** *(bool)* — Restricts tab to Sirius Premium users.  

---

## 🧩 Creating a Section

```lua
local Section = Tab:AddSection({
	Name = "Section"
})
```

**Parameters:**
- **Name** *(string)* — Section name.

> You can add UI elements to sections the same way as with tabs.

---

## 🔔 Sending Notifications

```lua
OrionLib:MakeNotification({
	Name = "Title!",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})
```

**Parameters:**
- **Title** *(string)* — Notification title.  
- **Content** *(string)* — Message content.  
- **Image** *(string)* — Notification icon asset ID or URL.  
- **Time** *(number)* — Duration in seconds.  

---

## 🔘 Creating a Button

```lua
Tab:AddButton({
	Name = "Button!",
	Callback = function()
		print("button pressed")
	end
})
```

**Parameters:**
- **Name** *(string)* — Button name.  
- **Callback** *(function)* — Function executed on click.  

---

## ✅ Creating a Toggle

```lua
Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
		print(Value)
	end
})
```

**Parameters:**
- **Name** *(string)* — Toggle label.  
- **Default** *(bool)* — Default state (true/false).  
- **Callback** *(function)* — Fired when toggled.  

**Change Toggle Value:**
```lua
CoolToggle:Set(true)
```

---

## 🎨 Creating a Color Picker

```lua
Tab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end
})
```

**Parameters:**
- **Name** *(string)* — Color picker label.  
- **Default** *(Color3)* — Default color.  
- **Callback** *(function)* — Fired when color changes.  

**Set Value:**
```lua
ColorPicker:Set(Color3.fromRGB(255, 255, 255))
```

---

## 🎚 Creating a Slider

```lua
Tab:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 20,
	Default = 5,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
		print(Value)
	end
})
```

**Parameters:**
- **Name** *(string)* — Slider label.  
- **Min** *(number)* — Minimum value.  
- **Max** *(number)* — Maximum value.  
- **Increment** *(number)* — Step change.  
- **Default** *(number)* — Default value.  
- **ValueName** *(string)* — Unit label.  
- **Callback** *(function)* — Fired when value changes.  

**Set Slider Value:**
```lua
Slider:Set(2)
```

---

## 🏷 Creating a Label

```lua
Tab:AddLabel("Label")
```

**Change Label Text:**
```lua
CoolLabel:Set("New Label!")
```

---

## 📄 Creating a Paragraph

```lua
Tab:AddParagraph("Paragraph", "Paragraph Content")
```

**Change Paragraph:**
```lua
CoolParagraph:Set("New Paragraph!", "Updated content here.")
```

---

## ✍ Creating a Textbox

```lua
Tab:AddTextbox({
	Name = "Textbox",
	Default = "default box input",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end
})
```

**Parameters:**
- **Name** *(string)* — Textbox label.  
- **Default** *(string)* — Default text.  
- **TextDisappear** *(bool)* — Clears text after focus lost.  
- **Callback** *(function)* — Fired when input submitted.  

---

## ⌨️ Creating a Keybind

```lua
Tab:AddBind({
	Name = "Bind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		print("press")
	end
})
```

**Parameters:**
- **Name** *(string)* — Keybind label.  
- **Default** *(Enum.KeyCode)* — Default key.  
- **Hold** *(bool)* — If true, fires continuously while held.  
- **Callback** *(function)* — Function executed when pressed.  

**Change Bind:**
```lua
Bind:Set(Enum.KeyCode.E)
```

---

## 📜 Creating a Dropdown

```lua
Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Callback = function(Value)
		print(Value)
	end
})
```

**Parameters:**
- **Name** *(string)* — Dropdown label.  
- **Default** *(string)* — Default option.  
- **Options** *(table)* — Dropdown options.  
- **Callback** *(function)* — Fired when selection changes.  

**Refresh Dropdown:**
```lua
Dropdown:Refresh({"3", "4"}, true)
```

**Set Dropdown Value:**
```lua
Dropdown:Set("1")
```

---

## 🚀 Finishing Your Script (Required)

```lua
OrionLib:Init()
```

---

## 🧠 Understanding Flags

Flags act as **unique identifiers** for elements.  
They allow you to access and store values across sessions via configs.

```lua
Tab1:AddToggle({
	Name = "Toggle",
	Default = true,
	Save = true,
	Flag = "toggle"
})

print(OrionLib.Flags["toggle"].Value) -- prints the toggle's value
```

**Note:** Flags work with **toggle**, **slider**, **dropdown**, **bind**, and **colorpicker**.

---

## 💾 Working with Configs

To make your UI save and load data:
1. Enable `SaveConfig` and specify `ConfigFolder` in your window.
2. Add `Flag` and `Save` properties to any savable element.

**Example:**
```lua
Tab:AddSlider({
	Name = "Speed",
	Min = 10,
	Max = 100,
	Default = 50,
	Save = true,
	Flag = "speed"
})
```

Each game will have its own config file automatically generated.

---

## ❌ Destroying the Interface

```lua
OrionLib:Destroy()
```
