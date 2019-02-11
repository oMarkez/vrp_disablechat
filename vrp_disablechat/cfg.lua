------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--        Script made for ByensRP 11/02/2019         --
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------

local cfg = {}

cfg.disablechatperm = "admin.tickets"
cfg.bypassperm = "admin.tickets"

cfg.messages = {
    -- Disable Chat
    on = "En administrator har tændt for chatten igen!",
    off = "En administrator har slukket for chatten!",
    currentlyoff = "Chatten er slukket i øjeblikket!",
    name = "^1Admin: ",
    noperm = "Du kan ikke benytte denne kommando!",

    -- Clear chat
    clearedchat = "En administrator har slettet chat historikken!"
}

function getConfig()
	return cfg
end