fx_version 'cerulean'
game 'gta5'

author 'Mordbite'
description 'AE Custom Taxijob'
version '0.0.1'

dependency 'qb-core'
dependency 'PolyZone'

ui_page 'html/ui.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
	'shared/config.lua',
	'locales/en.lua',
	'locales/de.lua'
}

files {
    'html/ui.html',
    'html/ui.css',
    'html/ui.js',
	'html/fonts/*.woff2',
	'html/icons/*.svg',
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
	'client/utils.lua',
	'client/tours.lua',
	'client/depot.lua',
	'client/commands.lua',
	'client/main.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua', 
	'server/main.lua'
}


