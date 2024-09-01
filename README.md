# Cinema Queue Script for Hypnonema

## Overview
Cinema Queue is a media queue management script designed for the Hypnonema media player in FiveM. This script allows server administrators to create and manage media queues, shuffle and play media, and stop media on specified screens. The script supports multiple frameworks, including standalone, qbcore, esx, and the upcoming revolt framework.

### Update v1.0.2
Features & Improvements:
- Now uses a config file to enhance flexibility and ease of use.
- Framework Support: Compatible with standalone, qbcore, esx, and revolt.
- Added "allowedUsers" table in config to limit a players access to the commands by their Rockstar License, Fivem Id, Steam ID, Discord ID, or IP.
- Updated commands to accept screen name and queue name as arguments.
- Shuffle & Play: Shuffle media entries within a queue and play them on any registered screen.
- Notifications: Notify players when media is played using customizable notification systems.
- Logging: Logs key actions and errors to help with monitoring and debugging.

### v1.0.1
Features:
- Media Queue Management: Easily create and manage media queues through a configuration file.

## Dependencies
Hypnonema - Media Player Resource for FiveM
[fivem-hypnonema](https://github.com/all-in-simplicity/fivem-hypnonema)
[download](https://github.com/all-in-simplicity/fivem-hypnonema/releases/download/1.9.3/hypnonema.zip)


## Installation
Assuming Hypnonema is downloaded, installed, and set up.
- Download the zip file to your resources folder
- Un-zip the file and ensure it is named cinema-queue
- Add ensure cinema-queue after Hypnonema in your server.cfg
- Configure the script in config.lua
- Restart your server

## Starting Order
```
exec @hypnonema/permissions.cfg
ensure hypnonema
ensure cinema-queue
```

## config.lua
```lua
config = {}

-- Framework Selection
config.framework = "qbcore" -- Options: "standalone", "qbcore", "esx", "revolt"

-- Notifications
config.notify = true -- Enable/disable server notifications (true/false).

-- Commands
config.playCommand = "playQueue"        -- Command to play a queue.
config.shuffPlayCommand = "sPlayQueue"  -- Command to shuffle and play a queue.
config.stopCommand = "stopQueue"        -- Command to stop a queue.

-- Allowed Users
config.allowedUsers = { 
    rsl = {}, -- Rockstar License
    fmi = {}, -- FiveM Identifier
    sid = {}, -- Steam ID
    did = {}, -- Discord ID
    pip = {}, -- IP Address
}

-- Media Queues
config.queues = {
    queue1 = {
        { title = "LG OLED 8k", url = "https://www.youtube.com/watch?v=EJr3uAQwGek", time = 110 },
        { title = "4k Test", url = "https://www.youtube.com/watch?v=SBeDS2WvOTg", time = 80 },
    },
}
```

## Commands
All command names are configurable in the config file.
/playQueue - Plays a queue on the desired screen.
/sPlayQueue - Shuffles and Plays a queue on the desired screen.
/stopQueue - Stops a queue on the desired screen.

### NOTICE
Hypnonema supports the following links
- All HTML5 supported audio and video types including HLS/DASH
- Twitch
- YouTube
- DailyMotion
- Facebook
- Vimeo
- Streamable
- Vidme
- Wistia
- SoundCloud

This is my first ever script for Fivem and also my first dive head-first into the lua language. This script was created out of necessity for my personal servers, however it is free and fair for you to edit and use in your own servers. I ask that if you build a project using some or all of my code that you are respectful enough to give credit where it is due.

## LICENSE
This project is licensed under theThis work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/).

