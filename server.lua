if GetCurrentResourceName() ~= "trplr_radio" then
    return print("^6Changing the resource's name wont't let the resource start, ^1" .. GetCurrentResourceName() .. "^0 > ^2 trplr_radio ^7")
end

CreateThread(function()
   print("  ____              _                      _        ")
   print(" | __ )   _   _    | |       ___   _ __   (_) __  __")
   print(" |  _ \\  | | | |   | |     / _ \\  | '_ \\  | | \\\\/ /")
   print(" | |_) | | |_| |   | |___  | __/  | | | | | |  >  < ")
   print(" |____/   \\__, |   |_____| \\___|  |_| |_| |_| /_/\\\\ ")
   print("          |___/                                     ")
)

local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("radio", function(source)
    TriggerClientEvent('qb-radio:use', source)
end)

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local Player = QBCore.Functions.GetPlayer(source)
        return config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty
    end)
end
