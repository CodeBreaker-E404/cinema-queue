# Cinema Queue

## Description:

Cinema Queue is designed to be used with all-in-simplicity's fivem-hypnonema script and therefore requires hypnonema to function.
This is a light-weight script that simply adds the ability to queue up video files for play at your designated cinema locations
by iterating through a table of links. By default the script is set to run an empty queue on the default Hypnonema screen.

## Dependencies

[fivem-hypnonema](https://github.com/all-in-simplicity/fivem-hypnonema?tab=readme-ov-file)

## Installation

Assuming Hypnonema is downloaded, installed, and set up.

- Download the zip file to your resources folder
- Un-zip the file and ensure it is named cinema-queue
- Add ensure cinema-queue after hypnonema in your server.cfg
- Configure the queue for the default screen in client.lua
- Add custom queues in client.lua (optional)
- Restart your server

## Starting Order
```
exec @hypnonema/permissions.cfg
ensure hypnonema
ensure cinema-queue
```

## server.cfg
You will need to setup permissions before using the commands.
- Define ACE permissions
add_ace group.admin cq.admin allow   # Grant 'cq.admin' permission to the 'admin' group
add_ace group.admin cq.god allow     # Grant 'cq.god' permission to the 'admin' group
- Optionally define specific user permissions
add_ace user123 cq.admin allow       # Grant 'cq.admin' permission to a specific user with identifier 'user123'
- Optionally define groups
add_principal group.admin group.admin
add_principal group.user group.user

## Commands

/playQueue - Plays the queue for the default screen.

### NOTICE

This is my first ever script for Fivem and also my first dive head-first into the lua language. This script was created out of necessity for my personal servers, however it is free and fair for you to edit and use in your own servers. I ask that if you build a project off of some or all of my code that you are respectful enough to give credit where it is due.
