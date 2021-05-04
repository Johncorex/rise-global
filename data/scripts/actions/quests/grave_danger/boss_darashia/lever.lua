local config = {
	centerRoom = Position(33424, 31438, 13),
	bossPosition = Position(33424, 31438, 13),
	newPosition = Position(33424, 31446, 13)
}

local monsters = {
	{cosmic = 'Sir Baeloc', pos = Position(33421, 31431, 13)},
	{cosmic = 'Sir Nictros', pos = Position(33428, 31431, 13)},
}

local function clearGraveBaeloc()
	local spectators = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(Position(33290, 32474, 9))
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
end

local GraveDangerLevel5 = Action()
function GraveDangerLevel5.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9825 then
		if player:getPosition() ~= Position(33424, 31413, 13) then
			item:transform(9826)
			return true
		end
	end
	if item.itemid == 9825 then
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with Baeloc.")
				return true
			end
		end
	
		for x = 33424, 33428 do
			local playerTile = Tile(Position(x, 31413, 13)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				if playerTile:getStorageValue(Storage.GraveDanger.BaelocTimer) < os.time() then
					playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
					playerTile:teleportTo(config.newPosition)
					playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					playerTile:setStorageValue(Storage.GraveDanger.BaelocTimer, os.time() + 20 * 3600)
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Baeloc.")
					return true
				end
			end
		end
		for n = 1, #monsters do
			Game.createMonster(monsters[n].cosmic, monsters[n].pos, true, true)
		end
		-- addEvent(clearGraveBaeloc, 30 * 60 * 1000)
		item:transform(9826)
	elseif item.itemid == 9826 then
		item:transform(9825)
	end
	return true
end

GraveDangerLevel5:uid(12005)
GraveDangerLevel5:register()