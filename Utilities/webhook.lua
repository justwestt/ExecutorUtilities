local webhook, title, desc, footer = ...

--=== Modules ===--
local HWID = loadstring(game:HttpGet("https://raw.githubusercontent.com/justwestt/ExecutorUtilities/refs/heads/main/Utilities/Get-HWID.lua"))

--=== UNC Functions ===---
local HttpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

--=== Services ===--
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

--=== Variables ===--
local LocalPlayer = Players.LocalPlayer
local WEBHOOK_URL = tostring(webhook)

if not HttpRequest then return end

local payload = {
    ["embeds"] = {{
        ["title"] = tostring(title),
        ["description"] = tostring(desc),
        ["color"] = 65280,
        ["fields"] = {
            {
                ["name"] = "Player",
                ["value"] = string.format("%s (`%d`)", LocalPlayer.Name, LocalPlayer.UserId),
                ["inline"] = false
            },
            {
                ["name"] = "Hardware ID",
                ["value"] = "||" .. HWID() .. "||",
                ["inline"] = false
            }
        },
        ["footer"] = {
            ["text"] = tostring(footer)
        },
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }}
}

local response = HttpRequest({
    Url = WEBHOOK_URL,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(payload)
})

return response.StatusCode
