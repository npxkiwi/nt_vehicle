vRP = Proxy.getInterface("vRP")


RegisterCommand('vspawn', function(source, args, rawCommand)
  local veh = args[1]
  local pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5) -- native vector3s ftw?
  if veh == nil then veh = "adder" end
    lib.registerContext({
        id = 'vh_spawn',
        title = 'Vehicle Spawnner',
        options = {
          {
            title = 'Spawn Vehicle',
            image = "https://docs.fivem.net/vehicles/" ..veh.. ".webp",
            onSelect  = function ()
              RequestModel(veh)
              local waiting = 0
              while not HasModelLoaded(veh) do
                  waiting = waiting + 100
                  Citizen.Wait(100)
                  if waiting > 5000 then
                      TriggerEvent('chatMessage', '', {255,255,255}, '^8Error: ^1Took too long to load the vehicle model. Are you sure it\'s a valid model?')
                      break
                  end
              end
              local cveh = CreateVehicle(veh, pos, GetEntityHeading(PlayerPedId())+90, true, false)
              SetEntityAsNoLongerNeeded(cveh)
              SetModelAsNoLongerNeeded(veh)
            end
          },
        }
      })
      lib.showContext('vh_spawn')
end)