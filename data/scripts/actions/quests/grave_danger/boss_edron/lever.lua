local config = {
	centerRoom = Position(33456, 31438, 13),
	bossPosition = Position(33456, 31438, 13),
	newPosition = Position(33456, 31444, 13)
}

local monsters = {
	{cosmic = 'cosmic energy prism a', pos = Position(32801, 32827, 14)},
	{cosmic = 'cosmic energy prism b', pos = Position(32798, 32827, 14)},
	{cosmic = 'cosmic energy prism c', pos = Position(32803, 32826, 14)},
	{cosmic = 'cosmic energy prism d', pos = Position(32796, 32826, 14)}
}

local function clearGraveVlarkorth()
	local spectators = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(Position(33195, 31690, 8))
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
end

local GraveDangerLevel1 = Action()
function GraveDangerLevel1.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(33455, 31413, 13) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Count Vlarkorth.")
				return true
			end
		end
		-- for n = 1, #monsters do
		-- 	Game.createMonster(monsters[n].cosmic, monsters[n].pos, true, true)
		-- end
		for x = 33455, 33459 do
			local playerTile = Tile(Position(x, 31413, 13)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				if playerTile:getStorageValue(Storage.GraveDanger.VlarkorthTimer) < os.time() then
					playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
					playerTile:teleportTo(config.newPosition)
					playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					playerTile:setStorageValue(Storage.GraveDanger.VlarkorthTimer, os.time() + 10 * 3600)
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Count Vlarkorth.")
					return true
				end
			end
		end
		Game.createMonster("Count Vlarkorth", config.bossPosition, true, true)
		-- addEvent(clearGraveVlarkorth, 30 * 60 * 1000)
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end

GraveDangerLevel1:aid(12001)
GraveDangerLevel1:register()