------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--        Script made for ByensRP 11/02/2019         --
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency "vrp"

client_scripts{
   'lib/Proxy.lua',
  'client.lua'

}
server_scripts{ 
  "@vrp/lib/utils.lua",
  "cfg.lua",
  "server.lua"
}
