-- // Variables

local HintService = { }
local Methods = { }

local Settings = { }

---

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")

local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/szcvak/lua/main/Signal.lua"))()
local Types = loadstring(game:HttpGet("https://raw.githubusercontent.com/szcvak/lua/main/BasicTypes.lua"))()

local HintTemplate = Instance.new("TextButton")
HintTemplate.AutomaticSize = Enum.AutomaticSize.XY
HintTemplate.BackgroundTransparency = 0.2
HintTemplate.BackgroundColor3 = Color3.fromRGB(25, 27, 29)
HintTemplate.Font = Enum.Font.Gotham
HintTemplate.TextSize = 13
HintTemplate.TextColor3 = Color3.new(1, 1, 1)

local BorderStroke = Instance.new("UIStroke")
BorderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
BorderStroke.Color = Color3.new(0, 0, 0)
BorderStroke.LineJoinMode = Enum.LineJoinMode.Round
BorderStroke.Thickness = 0
BorderStroke.Transparency = 1
BorderStroke.Parent = HintTemplate

local HintCorner = Instance.new("UICorner")
HintCorner.CornerRadius = UDim.new(0, 6)
HintCorner.Parent = HintTemplate

local TextPadding = Instance.new("UIPadding")
TextPadding.PaddingBottom = UDim.new(0, 9)
TextPadding.PaddingLeft = UDim.new(0, 11)
TextPadding.PaddingRight = UDim.new(0, 11)
TextPadding.PaddingTop = UDim.new(0, 8)
TextPadding.Parent = HintTemplate

local TextStroke = Instance.new("UIStroke")
TextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
TextStroke.Color = Color3.new(0, 0, 0)
TextStroke.LineJoinMode = Enum.LineJoinMode.Round
TextStroke.Thickness = 0
TextStroke.Transparency = 1
TextStroke.Parent = HintTemplate

type HintStyle = "Default" | "Legacy" | "Custom"
type HintAnimation = "Fade" | "None"
type HintMetaData = {any}

HintService.HintAdded = Signal.new() :: Types.ScriptSignal
HintService.HintRemoved = Signal.new() :: Types.ScriptSignal

-- // Functions

function HintService.CreateHint()
	local Hint = setmetatable({ }, {__index = Methods})
	
	Hint.MetaData = { } :: HintMetaData
	Hint.PrivateData = {
		Object = HintTemplate:Clone();
		Style = "Default" :: HintStyle;
		HintSettings = {
			DestroyAfterBroadcast = true;
			BroadcastTime = 10;
			InfiniteBroadcastTime = false;
			BroadcastAnimationType = "Fade" :: HintAnimation;
		};
	};
	
	Hint.Broadcasted = Signal.new() :: Types.ScriptSignal
	Hint.BroadcastFinished = Signal.new() :: Types.ScriptSignal
	Hint.BroadcastCancelled = Signal.new() :: Types.ScriptSignal
	Hint.Clicked = Signal.new() :: Types.ScriptSignal
	
	return Hint	
end

function Methods:SetStyle(style: HintStyle)
	
end

function Methods:SetText(text: string)
	local PrivateData = self.PrivateData
	local Hint: TextButton = PrivateData.Object
	
	Hint.Text = text
end

return HintService
