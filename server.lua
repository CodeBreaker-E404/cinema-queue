--[[ 
-------------------------------------------------------------
Made with Love by Error404
Started on 8/9/24 (My First Script)
-------------------------------------------------------------
Anything with a "--"" comment next to it is editable.
Please do not edit "--[[" comments. 
-------------------------------------------------------------
]]--

--[[Default Pier (Hypnonema) Screen Location.]]--
beachDriveIn = {                                -- edit when adding new tables, this is your queueTableName.
    { url = "https://example.com/video1.mp4", time = 10 }, -- Example entry
    { url = "https://example.com/video2.mp4", time = 20 },
    { url = "", time = 0 },
    { url = "", time = 0 },
    { url = "", time = 0 },
}

Citizen.CreateThread(function()
    RegisterCommand("playQueue",                  -- command to play this queue, edit "playQueue" command name whenever you create new queues.
        function()
            --[[check if player has permissions]]--
            if IsPlayerAceAllowed(source, "cq.admin") or IsPlayerAceAllowed(source, "cq.god") then
                for position, entry in ipairs(beachDriveIn) do
                    local wait_time = entry['time'] * 1000
                    --[[check if there is a url, url is blank, or time is 0]]--                            
                    if entry['url'] and entry['url'] ~= "" and entry['time'] > 0 then
                        --[[if checks are passed, execute]]--
                        exports.hypnonema:play("Hypnonema Example Screen", entry['url']) -- export to set "SCREEN NAME" to play queued['URL'], edit "SCREEN NAME" to match your custom Screen Names.
                        Citizen.Wait(wait_time)
                    end
                end
                --[[notify server of queue starting]]
                TriggerClientEvent("chatMessage", source, "^2Queue started playing on Hypnonema Example Screen.") -- edit to match your screen name.
            else
                --[[notify user of insufficient permissions]]--
                TriggerClientEvent("chatMessage", source, "^1Insufficient permissions for this command.")
            end
        end,
        false)
end)
