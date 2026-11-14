_G.AutoPotion = true

_G.Potions = {
    Lucky = { Enabled = false, Level = 5 },
    Coins = { Enabled = false, Level = 3 },
    Speed = { Enabled = false, Level = 1 },
    Mythic = { Enabled = false, Level = 5 }
}

while _G.AutoPotion do
    task.wait()

    for potion, data in pairs(_G.Potions) do
        if data.Enabled then
            game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.RemoteEvent:FireServer("UsePotion", potion, data.Level, 250)
        end
    end
end
