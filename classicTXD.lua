-- NEW: The TXD now colors both your name and the server based on the old color.

-- Known issue: If you are in jail and you reconnect, the modified TXD goes over to the total time remaining until you leave the prison."
-- This is from the latest update where TXD IDs are dynamically assigned to optimize their code."

local script_name = "Classic Textdraw"
local script_version = "0.0.3"
local script_author = "DjC - Forked by AnTiDoT"

-- Libraries
local samp = require "samp.events"
local sampev = require("lib.samp.events")
local txdServer = 2049 -- RPG.B-ZONE.RO
local txdName = 2048 -- Name (ID)
local desiredColor = 0x3e4d98ff -- The most accurate representation of the old color.

-- SAMPFUNCS is mandatory for this script to work. If the script doesn't find SAMPFUNCS installed, it will not run.
function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end

    sampRegisterChatCommand("ctxd", classic_Textdraw)

    while true do
        wait(0)
    end
end

-- The function will call itself if you're on RPG.B-ZONE.RO.
function sampev.onServerMessage(color, text)
    if text:sub(1, 8) == "SERVER: " and (text:find("Welcome") or text:find("Bine ai venit")) then
        lua_thread.create(function()
            wait(1000)
            classic_Textdraw()
        end)
    end
end

-- The magic happens here.
function classic_Textdraw()
	sampTextdrawSetOutlineColor(txdName, 0, -1)
    sampTextdrawSetLetterSizeAndColor(txdName, 0.35, 1.20, -13420369)
    sampTextdrawSetStyle(txdName, 1)
    sampTextdrawSetShadow(txdName, 1, -16448252)

	sampTextdrawSetOutlineColor(txdServer, 0, -1)
    sampTextdrawSetLetterSizeAndColor(txdServer, 0.35, 1.10, -13420369)
    sampTextdrawSetStyle(txdServer, 1)
    sampTextdrawSetShadow(txdServer, 1, -16448252)
end
