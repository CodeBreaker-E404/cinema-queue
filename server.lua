--[[ cinema-queue                                      (╯°□°)--︻╦╤─ - -
---------------------------------------------------------------------------------------------------
Made with Love by Error404 - Started on 8/9/24 (My First Script) ]]

local function logToFile(message) -- logging
    local logFile = "cinema_queue_log.txt"
    local timeStamp = os.date("%Y-%m-%d %H:%M:%S")
    local logMessage = string.format("[%s] %s\n", timeStamp, message)
    local file = io.open(logFile, "a")
    if file then
        file:write(logMessage)
        file:close()
    else
        print("Error: Unable to open log file.")
    end
end


function playMedia(screen, entry) -- Play
    local wait_time = entry['time'] * 1000
    if entry['url'] and entry['url'] ~= "" and entry['time'] > 0 then
        exports.hypnonema:play(screen, entry['url'])
        TriggerClientEvent('showMediaPopup', -1, entry['title'], screen)
        Citizen.Wait(wait_time)
        exports.hypnonema:stop(screen)
    else
        logToFile('Media titled "' .. entry['title'] .. '" with URL "' .. entry['url'] .. '" and time of ' .. entry['time'] .. ' has an issue, please ensure all fields are filled.')
        print('Media titled "' .. entry['title'] .. '" with URL "' .. entry['url'] .. '" and time of ' .. entry['time'] .. ' has an issue, please ensure all fields are filled.')
    end
end

function shuffleQueue(queue) -- Shuffle
    local len = #queue
    for i = len, 2, -1 do
        local rand = math.random(i)
        queue[i], queue[rand] = queue[rand], queue[i]
    end
end

local identifierCache = {} -- Allowed Users Caching
local function getPlayerIdentifiersCached(playerId)
    if identifierCache[playerId] then
        return identifierCache[playerId]
    end
    local playerIdentifiers = {
        rsl = GetPlayerIdentifierByType(playerId, "license"),
        fmi = GetPlayerIdentifierByType(playerId, "fivem"),
        sid = GetPlayerIdentifierByType(playerId, "steam"),
        did = GetPlayerIdentifierByType(playerId, "discord"),
        pip = GetPlayerIdentifierByType(playerId, "ip")
    }
    identifierCache[playerId] = playerIdentifiers
    return playerIdentifiers
end

local function isPlayerAllowed(playerId) -- Permission Check
    local playerIdentifiers = getPlayerIdentifiersCached(playerId)
    for idType, identifier in pairs(playerIdentifiers) do
        if identifier and config.allowedUsers[idType] then
            for _, allowedId in ipairs(config.allowedUsers[idType]) do
                if identifier == allowedId then
                    return true
                end
            end
        end
    end
    return false
end

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    identifierCache[playerId] = nil
end)
---------------------------------------------------------------------------------------------------

-- Play Command
RegisterCommand(config.playCommand,function(source, args)
    local playerId = source
    if isPlayerAllowed(playerId) then
        local screen = args[1]
        local queue = args[2]
        if not screen or not config.queues[queue] then
            logToFile("Play command failed: invalid screen or queue. Player ID: " .. playerId)
            return
        end
        logToFile("Play command executed by Player ID: " .. playerId .. " on screen: " .. screen .. " with queue: " .. queue)
        for _, entry in ipairs(config.queues[queue]) do
            logToFile("Playing media: " .. entry['title'] .. " on screen: " .. screen)
            playMedia(screen, entry)
        end
    else
        logToFile("Play command denied for Player ID: " .. playerId)
    end
end,false)
-- Shuffle & Play Command
RegisterCommand(config.shuffPlayCommand, function(source, args)
    local playerId = source
    if isPlayerAllowed(playerId) then
        local screen = args[1]
        local queueName = args[2]
        if not screen or not config.queues[queueName] then
            logToFile("Shuffle play command failed: invalid screen or queue. Player ID: " .. playerId)
            return
        end
        logToFile("Shuffle play command executed by Player ID: " .. playerId .. " on screen: " .. screen .. " with queue: " .. queueName)
        local queue = config.queues[queueName]
        shuffleQueue(queue)
        for _, entry in ipairs(queue) do
            logToFile("Playing media: " .. entry['title'] .. " on screen: " .. screen)
            playMedia(screen, entry)  
        end
    else
        logToFile("Shuffle play command denied for Player ID: " .. playerId)
    end
end, false)
-- Stop Command
RegisterCommand(config.stopCommand,function(source, args)
    local playerId = source
    if isPlayerAllowed(playerId) then
        local screen = args[1]
        if not screen then
            logToFile("Stop command failed: invalid screen. Player ID: " .. playerId)
            return
        end
        logToFile("Stop command executed by Player ID: " .. playerId .. " on screen: " .. screen)
        exports.hypnonema:stop(screen)
    else
        logToFile("Stop command denied for Player ID: " .. playerId)
    end
end,false)
