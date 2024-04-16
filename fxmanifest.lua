fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Kiwi'
description 'Simple vehicle spawnner script by Kiwi'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'lib/Tunnel.lua',
    'lib/Proxy.lua',
    'Config.lua',
    'client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'Config.lua',
    'server.lua'
}