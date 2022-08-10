ui_page 'html/index.html'



files {

    'html/dependencies/jquery-3.6.0.min.js',
    'html/dependencies/peerjs.min.js',
    'html/voice.js',
    
    'html/error.png',
    'html/off.png',
    'html/on.png',
    'html/onr.png',
    
    'html/index.html'
}



client_script 'client.lua'
client_script 'settings.lua'
server_script 'settings.lua'
server_script 'server.lua'



export 'SetPlayerChannel'
export 'SetPlayerVolume'
export 'GetPlayerVolume'
export 'PlayerIsTalking'
export 'GetPlayerChannel'
export 'ChangeSettingsKeys'
export 'PlayerHasBanMicrophone'
export 'BanMicrophone'
export 'IsPlayerConnected'