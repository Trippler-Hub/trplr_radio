if GetCurrentResourceName() ~= "trplr_radio" then
    return print("^6Changing the resource's name wont't let the resource start, ^1" .. GetCurrentResourceName() .. "^0 > ^2 trplr_radio ^7")
end

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
