RegisterServerEvent('sendMessageToPlayer')
AddEventHandler('sendMessageToPlayer', function(name, m1, m2)
	TriggerClientEvent('sendMessageToPlayer', -1, name, m1, m2)
end)

RegisterServerEvent('sendMessageToEveryone')
AddEventHandler('sendMessageToEveryone', function(m1, m2)
	TriggerClientEvent('sendMessageToEveryone', -1, m1, m2)
end)

RegisterServerEvent('PrintText')
AddEventHandler('PrintText', function(text)
	print('[Printed] ' .. text)
end)