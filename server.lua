--[[
-------------------------------------------------------------------
Made with Love by Error404
Started on 8/9/24 (My First Script)
-------------------------------------------------------------------
Anything with a "--"" comment next to it is editable.
-------------------------------------------------------------------
]]

--[[Default Pier (Hypnonema) Screen Location.]]
beachQueue = {                                                       -- edit when adding new tables, this is your queueTableName.
    { url = "https://www.youtube.com/watch?v=BxF43wve21I", time = 8 }, -- Example entry
    { url = "https://www.youtube.com/watch?v=rXuasgbBetc", time = 12 }, -- Example entry
    { url = "https://www.youtube.com/watch?v=Z_M4o74OeQU", time = 15 }, -- Example entry
    { url = "",                                            time = 0 }, -- Example blank entry
    { url = "https://www.youtube.com/watch?v=Z_M4o74OeQU", time = 0 }, -- Example skipped/archived entry
}

Citizen.CreateThread(function()
    RegisterCommand("playQueue",                  -- command to play this queue, edit "playQueue" command name whenever you create new queues.
        function()
           -- local allow = IsPlayerAceAllowed(source, "cq.admin")
           -- if allow then
                for position, entry in ipairs(beachQueue) do
                    local wait_time = entry['time'] * 1000
                    if entry['url'] and entry['url'] ~= "" and entry['time'] > 0 then
                        exports.hypnonema:play("Hypnonema Example Screen", entry['url']) -- export to set "SCREEN NAME" to play queued['URL'], edit "SCREEN NAME" to match your custom Screen Names.
                        Citizen.Wait(wait_time)
                        exports.hypnonema:stop("Hypnonema Example Screen")
                    end
                end
                TriggerClientEvent("chatMessage", source, "^2Queue started playing on Hypnonema Example Screen.") -- edit to match your screen name.
           -- else
           --     TriggerClientEvent("chatMessage", source, "^1Insufficient permissions for this command.")
           -- end
        end,
        false)
end)

Citizen.CreateThread(function()
    RegisterCommand("stopQueue",                  -- command to stop this queue, edit "playQueue" command name whenever you create new queues.
        function()
            local allow = IsPlayerAceAllowed(source, "cq.admin")
          --  if allow then
                exports.hypnonema:stop("Hypnonema Example Screen")
          --  else
          --      TriggerClientEvent("chatMessage", source, "^1Insufficient permissions for this command.")
          --  end
        end,
        false)
end)
