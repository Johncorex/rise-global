-- [OtServerBr]
-- Event scheduler lua scripts, on this file is possible to load any kind
-- of global values, create functions or create and register GlobalEvents using the revscript system.
-- For example you can load a 'local Example = GlobalEvent("example")' and register it with 'Example:register()',
-- adding the 'Example.onStartup()' or 'Example.onThink(interval)' with 'Example:interval(time)'.
-- With 'onStartup()' you can load any raid, for example loading a entire map/hunt and the choseen spawns.

-- Examples:
-- Loading map: Game.loadMap('data/world/myMapFolder/myMapFile.otbm')
-- Loading spawn: addEvent(function() Game.loadSpawnFile('data/world/mySpawnFolder/mySpawnFile.xml) end, 30 * 1000)

local Example_One = CreatureEvent("Example one")
function Example_One.onLogin(player)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Extra Exp, Extra Loot and Spawn Rate Event! Extra Exp, Extra Loot Drop and Monsters respawn at a faster rate!\n Happy Hunting!")
	return true
end

Example_One:register()