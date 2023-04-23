RegisterServerEvent('restartScript')
AddEventHandler('restartScript', function(script)
	TriggerClientEvent('restartScript', source, script)
end)