local wasmenuopen = false

---------------------------------------------------------------------------
-- Threads --
---------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
			Wait(0)
			if IsPauseMenuActive() and not wasmenuopen then
					SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263, true) -- set unarmed
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_TOURIST_MAP", 0, false) -- Start the scenario
					wasmenuopen = true
			end
			
			if not IsPauseMenuActive() and wasmenuopen then
					ClearPedTasksImmediately(GetPlayerPed(-1))
					wasmenuopen = false
			end
	end
end)