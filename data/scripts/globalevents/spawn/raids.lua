local raids = {
	-- Weekly
	--Segunda-Feira
	['Monday'] = {
		['06:00'] = {raidName = 'RatsThais'},
		['12:00'] = {raidName = 'Draptor'},
		['07:00'] = {raidName = 'Tanjis'},
		['07:00'] = {raidName = 'Mawhawk'},
		['07:00'] = {raidName = 'Dreadmaw'}
	},
	
	--Terça-Feira
	['Tuesday'] = {
		['16:00'] = {raidName = 'Midnight Panther'},
		['18:00'] = {raidName = 'Citizen'},
		['07:00'] = {raidName = 'Obujos'},
		['07:00'] = {raidName = 'Mawhawk'}
	},
	
	--Quarta-Feira
	['Wednesday'] = {
		['12:00'] = {raidName = 'Draptor'},
		['12:00'] = {raidName = 'Crustacea Gigantica treasure'},
		['12:00'] = {raidName = 'Crustacea Gigantica calassa1'},
		['12:00'] = {raidName = 'Crustacea Gigantica calassa2'},
		['12:00'] = {raidName = 'Crustacea Gigantica seacrest1'},
		['12:00'] = {raidName = 'Crustacea Gigantica seacrest2'},
		['07:00'] = {raidName = 'Tanjis'},
		['07:00'] = {raidName = 'Mawhawk'}
	},
	
	--Quinta-Feira
	['Thursday'] = {
		['19:00'] = {raidName = 'Citizen'},
		['07:00'] = {raidName = 'Jaul'},
		['07:00'] = {raidName = 'Mawhawk'}
	},
	
	--Sexta-feira
	['Friday'] = {
		['23:00'] = {raidName = 'Undead Cavebear'},
		['06:00'] = {raidName = 'Titanica'},
		['07:00'] = {raidName = 'Jaul'},
		['07:00'] = {raidName = 'Mawhawk'}
	},
	
	--Sábado
	['Saturday'] = {
		['20:00'] = {raidName = 'Draptor'},
		['07:00'] = {raidName = 'Tanjis'},
		['07:00'] = {raidName = 'Mawhawk'}
	},
	
	--Domingo
	['Sunday'] = {
		['15:00'] = {raidName = 'Midnight Panther'},
		['13:00'] = {raidName = 'Orc Backpack'},
		['23:00'] = {raidName = 'Undead Cavebear'},
		['07:00'] = {raidName = 'Obujos'},
		['07:00'] = {raidName = 'Mawhawk'}
	},
	
	-- By date (Day/Month)
	['31/10'] = {
		['16:00'] = {raidName = 'Halloween Hare'}
	},
	-- Ferumbras
	-- Fevereiro
	['20/02'] = {
		['21:00'] = {raidName = 'Ferumbras'}
	},
	-- Abril
	['20/04'] = {
		['21:00'] = {raidName = 'Ferumbras'}
	},
	-- Junho
	['20/06'] = {
		['21:00'] = {raidName = 'Ferumbras'}
	},
	-- Agosto
	['20/08'] = {
		['21:00'] = {raidName = 'Ferumbras'}
	},
	-- Outubro
	['20/10'] = {
		['21:00'] = {raidName = 'Ferumbras'}
	},
	-- Dezembro
	['20/12'] = {
		['21:00'] = {raidName = 'Ferumbras'}
	},
	-- Omrafir
	['15/01'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/02'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/03'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/04'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/05'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/06'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/07'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/08'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/09'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/10'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/11'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
	['15/12'] = {
		['20:00'] = {raidName = 'Omrafir'}
	},
}

local spawnRaids = GlobalEvent("spawn raids")
function spawnRaids.onThink(interval, lastExecution, thinkInterval)
	local day, date = os.date('%A'), getRealDate()

	local raidDays = {}
	if raids[day] then
		raidDays[#raidDays + 1] = raids[day]
	end
	if raids[date] then
		raidDays[#raidDays + 1] = raids[date]
	end
	if #raidDays == 0 then
		return true
	end

	for i = 1, #raidDays do
		local settings = raidDays[i][getRealTime()]
		if settings and not settings.alreadyExecuted then
			Game.startRaid(settings.raidName)
			settings.alreadyExecuted = true
		end
	end
	return true
end

spawnRaids:interval(60000)
spawnRaids:register()
