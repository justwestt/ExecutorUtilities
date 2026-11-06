--[[ Created by The mighty syn - Personal use only. ]]
if _G.WRDClickTeleport == nil then
	_G.WRDClickTeleport = true
	local player = game:GetService("Players").LocalPlayer
	local UserInputService = game:GetService("UserInputService")
	local mouse = player:GetMouse()
	repeat wait() until mouse
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
			end
		end
	end)
else
	_G.WRDClickTeleport = not _G.WRDClickTeleport
	if _G.WRDClickTeleport then
		game.StarterGui:SetCore("SendNotification", {Title="WeAreDevs.net"; Text="Click teleport enabled"; Duration=5;})
	else
		game.StarterGui:SetCore("SendNotification", {Title="WeAreDevs.net"; Text="Click teleport disabled"; Duration=5;})
	end
end
