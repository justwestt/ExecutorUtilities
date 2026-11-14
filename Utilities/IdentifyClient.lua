--[[
- Script may seem useless & simple (simple it is), but this is for executors that support multiple roblox processes, but do not display the username of each client ID.
- Run this script with a client ID selected, and it will return the username of that client which will allow you to determine which ID belongs to what account.
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

print(LP.Name)
