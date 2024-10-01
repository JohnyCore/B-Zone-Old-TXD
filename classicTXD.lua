local script_name = "Classic Textdraw"
local script_version = "0.0.1"
local script_author = "DjC"

-- Libraries ======================================
local samp = require "samp.events"
local sampev = require("lib.samp.events")

local txdServer = 2054 -- RPG.B-ZONE.RO
local txdName = 2055 -- Name (ID)

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end

    sampRegisterChatCommand("ctxd", classic_Textdraw) -- Creating command just in-case if you were laggin or something

    while true do
        wait(0)
    end
end

function sampev.onServerMessage(color, text)
    if text:sub(1, 8) == "SERVER: " and (text:find("Welcome") or text:find("Bine ai venit")) then
        lua_thread.create(function()
            wait(1000) -- You can adjust it.
            classic_Textdraw()
        end)
    end
end

function classic_Textdraw()
    -- sampAddChatMessage("Textdraws are now classic!", -1)
    sampTextdrawSetOutlineColor(txdName, 0, -1)
    sampTextdrawSetOutlineColor(txdServer, 0, -1)
    sampTextdrawSetStyle(txdName, 1)
    sampTextdrawSetShadow(txdName, 1, -16448252)
    sampTextdrawSetStyle(txdServer, 1)
    sampTextdrawSetShadow(txdServer, 1, -16448252)
end
