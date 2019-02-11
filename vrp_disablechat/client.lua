------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--        Script made for ByensRP 11/02/2019         --
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------

vRP = Proxy.getInterface("vRP")

RegisterCommand("disablechat",function(source, args)
    TriggerServerEvent("disableChat", source)
end, false)

RegisterCommand("clearchat", function(source, args)
    TriggerServerEvent("clearChat", source)
end, false)
