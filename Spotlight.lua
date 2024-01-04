local Players = game:GetService("Players")

--

local Spotlight = { }
Spotlight.__index = Spotlight

local Lp = Players.LocalPlayer
local Mouse = Lp:GetMouse()
	
--

function Spotlight.new(parent: any)
	local self = { }
	setmetatable(self, Spotlight)

	self.CommandBar = Instance.new("ScreenGui")
	self.Container = Instance.new("Frame")
	self.ContainerCorner = Instance.new("UICorner")
	self.Entry = Instance.new("TextBox")
	self.EntryPadding = Instance.new("UIPadding")
	self.ContainerPadding = Instance.new("UIPadding")
	self.Autocomplete = Instance.new("TextLabel")
	self.AutocompletePadding = Instance.new("UIPadding")

	self.CommandBar.Name = "CommandBar"
	self.CommandBar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	self.CommandBar.ResetOnSpawn = false
	self.CommandBar.Parent = parent

	self.Container.Name = "Container"
	self.Container.Parent = self.CommandBar
	self.Container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	self.Container.BackgroundTransparency = 0.250
	self.Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	self.Container.BorderSizePixel = 0
	self.Container.Position = UDim2.new(0.0565871708, 0, 0.963343084, -30)
	self.Container.Size = UDim2.new(0.199498117, 0, 0, 30)

	self.ContainerCorner.Name = "ContainerCorner"
	self.ContainerCorner.Parent = self.Container

	self.Entry.Name = "Entry"
	self.Entry.Parent = self.Container
	self.Entry.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	self.Entry.BackgroundTransparency = 1.000
	self.Entry.BorderColor3 = Color3.fromRGB(0, 0, 0)
	self.Entry.BorderSizePixel = 0
	self.Entry.Size = UDim2.new(1, -10, 1, 0)
	self.Entry.ClearTextOnFocus = false
	self.Entry.Font = Enum.Font.GothamMedium
	self.Entry.PlaceholderText = "Start typing..."
	self.Entry.Text = ""
	self.Entry.TextColor3 = Color3.fromRGB(233, 233, 233)
	self.Entry.TextSize = 20.000
	self.Entry.TextXAlignment = Enum.TextXAlignment.Left

	self.EntryPadding.Name = "EntryPadding"
	self.EntryPadding.Parent = self.Entry
	self.EntryPadding.PaddingLeft = UDim.new(0, 10)

	self.ContainerPadding.Name = "ContainerPadding"
	self.ContainerPadding.Parent = self.Container
	self.ContainerPadding.PaddingRight = UDim.new(0, 10)

	self.Autocomplete.Name = "Autocomplete"
	self.Autocomplete.Parent = self.Container
	self.Autocomplete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	self.Autocomplete.BackgroundTransparency = 1.000
	self.Autocomplete.BorderColor3 = Color3.fromRGB(0, 0, 0)
	self.Autocomplete.BorderSizePixel = 0
	self.Autocomplete.Size = UDim2.new(1, 0, 1, 0)
	self.Autocomplete.ZIndex = 0
	self.Autocomplete.Font = Enum.Font.Gotham
	self.Autocomplete.Text = ""
	self.Autocomplete.TextColor3 = Color3.fromRGB(128, 128, 128)
	self.Autocomplete.TextSize = 20
	self.Autocomplete.TextXAlignment = Enum.TextXAlignment.Left

	self.AutocompletePadding.Name = "AutocompletePadding"
	self.AutocompletePadding.Parent = self.Autocomplete
	self.AutocompletePadding.PaddingLeft = UDim.new(0, 10)
	
	return self
end

function Spotlight:Show()
	self.Entry.Text = ""
	self.Container.Position = UDim2.new(0, Mouse.X, 0, Mouse.Y)
	self.Container.Visible = true
	self.Entry:CaptureFocus()
end

function Spotlight:Hide()
	self.Container.Visible = false
	self.Entry.Text = ""
end

return Spotlight
