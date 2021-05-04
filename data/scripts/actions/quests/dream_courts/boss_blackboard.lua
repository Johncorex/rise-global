local positionByDay = {
	[1] = 'Plagueroot', -- domingo
	[2] = 'Malofur Mangrinder', -- segunda
	[3] = 'Maxxenius', -- terça
	[4] = 'Alptramun', -- quarta
	[5] = 'Izcandar The Banished', -- quinta
	[6] = 'Malofur Mangrinder', -- sexta
	[7] = 'Izcandar The Banished' -- sabado
}

local offlineTrainingBook = Action()

function offlineTrainingBook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local today = os.date("*t").wday
	
	if positionByDay[today] then
		local text = positionByDay[today]
		player:popupFYI(text .. " Boss today.")
	else
		print("[!] -> Cannot create blackboard. Day: " .. os.date("%A") .. ".")
	end
	return true
end

offlineTrainingBook:aid(88552)
offlineTrainingBook:register()
