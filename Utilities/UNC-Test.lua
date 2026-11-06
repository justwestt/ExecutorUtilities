--// Written by The mighty Syn \\---

local uncSupportTable = {}

local function checkFunction(apiName, globalVar)
    uncSupportTable[apiName] = (globalVar ~= nil)
end

checkFunction("readfile", readfile)
checkFunction("writefile", writefile)
checkFunction("appendfile", appendfile)
checkFunction("isfile", isfile)
checkFunction("getgenv", getgenv)
checkFunction("getrenv", getrenv)
checkFunction("hookfunction", hookfunction)
checkFunction("newcclosure", newcclosure)
checkFunction("checkcaller", checkcaller)
checkFunction("getrawmetatable", getrawmetatable)
checkFunction("setreadonly", setreadonly)
checkFunction("gethui", gethui)
checkFunction("cloneref", cloneref)
checkFunction("request", request)
checkFunction("identifyexecutor", identifyexecutor)

local rows = {}
table.insert(rows, "--- Executor UNC Results ---")
for apiName, isSupported in pairs(uncSupportTable) do
    table.insert(rows, string.format("%s = %s", apiName, tostring(isSupported)))
end
local finalOutput = table.concat(rows, "\n")

print(finalOutput)
writefile("UNC_RESULTS.txt", finalOutput)
