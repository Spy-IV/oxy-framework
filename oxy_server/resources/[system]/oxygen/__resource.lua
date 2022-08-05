server_script 'database_server.lua'
server_script 'oxy_server.lua'

client_script 'oxy_main.lua'
client_script 'oxy_functions.lua'
client_script 'database_client.lua'
client_script 'oxy_settings.lua'

export 'GetRespawnTimer'
export 'GetRespawnStatus'
export 'IsLocalChatEnabled'
export 'GetChatKey'
export 'GetChatRadius'
export 'GetAdmin'