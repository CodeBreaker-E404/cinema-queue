--[[ cinema-queue                                  (-(-_(-_-)_-)-)
-------------------------------------------------------------------
Made with Love by Error404 - Started on 8/9/24 (My First Script) ]]

local function setHelpTexts() -- Set Helper messages
    if not config then
        print("Error: Config is not properly defined.")
        return
    end
    local a = "/"..config.playCommand
    TriggerEvent('chat:addSuggestion',a,'Plays the Queue.', {
        {name = 'screenName', help = 'Screen name is case sensitive, must be registered with hypnonema first, and must not contain spaces or special characters.'},
        {name = 'queueName', help = 'Queue name is case sensitive and must be set in config.lua first.'},
    })
    local b = "/"..config.shuffPlayCommand
    TriggerEvent('chat:addSuggestion',b,'Shuffles and plays the Queue.', {
        {name = 'screenName', help = 'Screen name is case sensitive, must be registered with hypnonema first, and must not contain spaces or special characters.'},
        {name = 'queueName', help = 'Queue name is case sensitive and must be set in config.lua first.'},
    })
    local c = "/"..config.stopCommand
    TriggerEvent('chat:addSuggestion',c,'Stops the Queue on a given screen.', {
        {name = 'screenName', help = 'Screen name is case sensitive, must be registered with hypnonema first, and must not contain spaces or special characters.'}
    })
end

CreateThread(setHelpTexts)

RegisterNetEvent('showMediaPopup')
AddEventHandler('showMediaPopup', function(title, screen)
    if config.notify and config.notify == true then
        local customMessage = string.format('*** %s *** is LIVE on *** %s ***', title, screen)
        if config.framework and config.framework == "standalone" then
            SendNUIMessage({ action = "showPopup", message = customMessage })
        elseif config.framework and config.framework == "qbcore" then
            QBCore.Functions.Notify(customMessage, 'info', 10000)
        elseif config.framework and config.framework == "esx" then
            TriggerClientEvent('esx:showNotification', source, customMessage, 'info', 10000)
        elseif config.framework and config.framework == "revolt" then
            exports.revolt_notify:announce(customMessage)
        end
    else
        print('Queue Notifications Disabled')
    end
end)
