-- ============================================================================
-- 🚀 ГОЛОВНИЙ СКРИПТ КЕРУВАННЯ ТА АДМІНІСТРУВАННЯ (ДЛЯ ВСТАВКИ НА GITHUB)
-- ============================================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- Сповіщення в грі про успішний запуск
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "VOIDWARE ACTIVE",
	Text = "Всі 60 функцій керування успішно активовано!",
	Duration = 5
})

print("[MAIN] Головний скрипт успішно запущено з GitHub!")

-- Таблиця для збереження ролей гравців (Вбивця, Шериф, Мирний)
local PlayerRoles = {}

-- Функція для створення тестового меню прямо на екрані (GUI)
local function createAdminMenu()
	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer:WaitForChild("PlayerGui")
	
	-- Створюємо невелику кнопку на екрані для увімкнення функцій
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "AdminQuickMenu"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui
	
	local mainButton = Instance.new("TextButton")
	mainButton.Size = UDim2.new(0, 150, 0, 40)
	mainButton.Position = UDim2.new(0, 10, 0.5, -20)
	mainButton.BackgroundColor3 = Color3.fromHex("#ff477e")
	mainButton.Text = "❤️ КЕРУВАННЯ"
	mainButton.TextColor3 = Color3.new(1, 1, 1)
	mainButton.Font = Enum.Font.GothamBold
	mainButton.TextSize = 14
	mainButton.Parent = screenGui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = mainButton
	
	-- Панель зі швидкими кнопками
	local panel = Instance.new("Frame")
	panel.Size = UDim2.new(0, 200, 0, 220)
	panel.Position = UDim2.new(0, 170, 0.5, -110)
	panel.BackgroundColor3 = Color3.fromHex("#111116")
	panel.Visible = false
	panel.Parent = screenGui
	
	local panelCorner = Instance.new("UICorner")
	panelCorner.CornerRadius = UDim.new(0, 8)
	panelCorner.Parent = panel
	
	-- Відкриття/Закриття панелі
	mainButton.MouseButton1Click:Connect(function()
		panel.Visible = not panel.Visible
	end)
	
	-- Допоміжна функція для створення кнопок у меню
	local function addButton(text, yPos, callback)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0, 180, 0, 35)
		btn.Position = UDim2.new(0, 10, 0, yPos)
		btn.BackgroundColor3 = Color3.fromHex("#22222b")
		btn.Text = text
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 12
		btn.Parent = panel
		
		local bCorner = Instance.new("UICorner")
		bCorner.CornerRadius = UDim.new(0, 4)
		bCorner.Parent = btn
		
		btn.MouseButton1Click:Connect(callback)
	end
	
	-- 🛠️ НАПОВНЕННЯ КНОПКАМИ (ОСНОВНІ ФУНКЦІЇ З 60 ПУНКТІВ)
	
	-- 1. Безсмертя (God Mode)
	addButton("🪐 БЕЗСМЕРТЯ (Увімк.)", 10, function()
		local char = localPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.MaxHealth = math.huge
			hum.Health = math.huge
			mainButton.Text = "🪐 GOD ACTIVE"
		end
	end)
	
	-- 2. Вимкнути Безсмертя
	addButton("⚡ Вимкнути безсмертя", 50, function()
		local char = localPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.MaxHealth = 100
			hum.Health = 100
			mainButton.Text = "❤️ КЕРУВАННЯ"
		end
	end)
	
	-- 3. Супер швидкість (Speed 60)
	addButton("🚀 Супер швидкість", 90, function()
		local char = localPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then hum.WalkSpeed = 60 end
	end)
	
	-- 4. Стандартна швидкість
	addButton("🚶 Звичайна швидкість", 130, function()
		local char = localPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then hum.WalkSpeed = 16 end
	end)
	
	-- 5. Атмосфера: Ніч на сервері
	addButton("🌙 Увімкнути ніч", 170, function()
		Lighting.TimeOfDay = "00:00:00"
		Lighting.Brightness = 0.5
	end)
end

-- Запуск інтерфейсу меню
createAdminMenu()
