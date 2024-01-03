local TweenService = game:GetService("TweenService")

--

local Log = { }
Log.__index = Log

function Log.new(parent: any)
	local self = { }
	setmetatable(self, Log)

	self.Alerts = Instance.new("ScreenGui")
	self.Container = Instance.new("Frame")
	self.UIListLayout = Instance.new("UIListLayout")
	self.Notification = Instance.new("TextLabel")
	self.UICorner = Instance.new("UICorner")

	self.Alerts.Name = "Alerts"
	self.Alerts.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	self.Alerts.ResetOnSpawn = false
	self.Alerts.Parent = parent

	self.Container.Name = "Container"
	self.Container.Parent = self.Alerts
	self.Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	self.Container.BackgroundTransparency = 1.000
	self.Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	self.Container.BorderSizePixel = 0
	self.Container.Position = UDim2.new(0, 0, 0.0500000007, 0)
	self.Container.Size = UDim2.new(1, 0, 0.949999988, 0)

	self.UIListLayout.Parent = self.Container
	self.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	self.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	self.UIListLayout.Padding = UDim.new(0, 10)
	
	self.Container.ChildAdded:Connect(function(child: Instance)
		if not child:IsA("TextLabel") or child.Name ~= "Notification" then
			return
		end
		
		coroutine.wrap(function()
			task.wait(3 + #child.Text / 16)
			
			local Tween = TweenService:Create(child, TweenInfo.new(0.4), {
				BackgroundTransparency = 1,
				TextTransparency = 1
			})
			
			Tween:Play()
			Tween.Completed:Wait()
			
			child:Destroy()
		end)()
	end)
	
	return self
end

function Log:CreateNotification(message: string)
	local Notification = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")

	Notification.Name = "Notification"
	Notification.BackgroundColor3 = Color3.new(0, 0, 0)
	Notification.BackgroundTransparency = 0.3
	Notification.Size = UDim2.new(0, 0, 0, 0)
	Notification.Font = Enum.Font.GothamMedium
	Notification.TextColor3 = Color3.fromRGB(248, 248, 248)
	Notification.TextSize = 24
	Notification.Text = message

	UICorner.CornerRadius = UDim.new(0, 12)
	UICorner.Parent = Notification
	
	local Connection
	Connection = Notification:GetPropertyChangedSignal("TextBounds"):Connect(function()
		Notification.Size = UDim2.new(0, Notification.TextBounds.X + 10, 0, Notification.TextBounds.Y + 10)
		Connection:Disconnect()
	end)
	
	return Notification
end

function Log:PushNotification(notification: Instance)
	if not notification:IsA("TextLabel") then
		return
	end
	
	notification.Parent = self.Container
end

function Log:Display(message: string)
	self:PushNotification(self:CreateNotification(message))
end

function Log:DisplayError(message: string)
	local notification = self:CreateNotification(message)
	notification.BackgroundColor3 = Color3.fromRGB(230, 40, 31)
	
	self:PushNotification(notification)
end

return Log
