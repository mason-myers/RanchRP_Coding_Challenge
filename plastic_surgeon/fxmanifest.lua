fx_version 'cerulean'
games { 'rdr3' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'asmartcow'
description 'Coding Challenge for Ranch RP development application'
version '1.0.0'

shared_scripts {
    'shared/*.lua',
    'config.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua',
}

ui_pages {
    'nui/main.html'
}

files {
    'nui/*.html',
    'nui/*.css',
    'nui/*.js',
    'nui/images/*.png'
}