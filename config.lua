config = {} --  ¦̵̱ ̵̱ ̵̱ ̵̱ ̵̱(̢ ̡͇̅└͇̅┘͇̅ (▤8כ−◦
-- Important Stuff
config.framework = "qbcore" --------------------- "standalone", "qbcore", "esx", "revolt" -- reVolt Framework coming soon!
config.notify = true ---------------------------- Send Server Notifications (true / false).
config.playCommand = "playQueue" ---------------- Command to play a queue.
config.shuffPlayCommand = "sPlayQueue" ---------- Command to shuffle and play a queue.
config.stopCommand = "stopQueue" ---------------- Command to stop a queue.

-- Command Allowance -- List the users able to use the script commands here. Accepts Rockstar License, Fivem Id, Steam ID, Discord ID, and IP
config.allowedUsers = { -- 
    rsl = { -- Player Rockstar License
--        "license:abc1234567890def1234567890abcdef12345678",
    },
    fmi = { -- Player Fivem Identifier
--        "fivem:123456",
    },
    sid = { -- Player Steam ID
--        "steam:11000010a1b2c3d",
    },
    did = { -- Player Discord ID
--        "discord:123456789012345678",
    },
    pip = { -- Player IP
--        "ip:192.168.1.1",
    }
}

-- Queues -- url and time fields are mandatory.
config.queues = {
 queue1 = { ------------------------------------- Copy and edit to add queues.
     { title ="LG OLED 8k", url = "https://www.youtube.com/watch?v=EJr3uAQwGek", time = 110},
     { title ="4k Test", url = "https://www.youtube.com/watch?v=SBeDS2WvOTg", time = 80},
 },
}