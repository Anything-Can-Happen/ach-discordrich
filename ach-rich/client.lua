-- Don't gotta touch the local stuff
local id = 

-- The below requires changing to support everything (DEV)
Citizen.CreateThread(function()
	if config.showstate = true then
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)
		Citizen.Wait(config.update)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				if IsPedSprinting(PlayerPedId()) then
					SetRichPresence("Sprinting down "..StreetName)
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence("Running down "..StreetName)
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence("Walking down "..StreetName)
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence("Standing on "..StreetName)
				end
			elseif GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local VehSpeed = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))
				local CurSpeed = UseKMH and math.ceil(VehSpeed * 3.6) or math.ceil(VehSpeed * 2.236936)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				if CurSpeed > 80 then
					SetRichPresence("Speeding down "..StreetName.." In a "..VehName)
				elseif CurSpeed <= 50 and CurSpeed > 0 then
					SetRichPresence("Cruising down "..StreetName.." In a "..VehName)
				elseif CurSpeed == 0 then
					SetRichPresence("Parked on "..StreetName.." In a "..VehName)
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) or GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 5.0 then
					SetRichPresence("Flying over "..StreetName.." in a "..VehName)
				else
					SetRichPresence("Landed at "..StreetName.." in a "..VehName)
				end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence("Swimming around")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				SetRichPresence("Sailing around in a "..VehName)
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence("In a yellow submarine")
			end
		end
	end
end)
