Citizen.CreateThread(function()
	local mainMenuOpen = false

	while true do
		local playerPed = GetPlayerPed(-1)
		
		if not IsPedInAnyVehicle(playerPed) then
			if IsPauseMenuActive() and not mainMenuOpen then
				mainMenuOpen = true

				SetCurrentPedWeapon(playerPed, 0xA2719263, true)
				TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_TOURIST_MAP", 0, true)
			elseif mainMenuOpen then
				Wait(1000)
				ClearPedTasks(playerPed)
				mainMenuOpen = false
			end
		end

		Wait(250)
	end
end)
