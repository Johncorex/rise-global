local config = {
	centerRoom = Position(33617, 32562, 13),
	bossPosition = Position(33617, 32559, 13),
	newPosition = Position(33617, 32568, 13)
}

local function ClearFacelessBane()
	local spectators = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
	for i = 1, #spectators do
		local spectator = spectators[i]
		if spectator:isPlayer() then
			spectator:teleportTo(Position(33635, 32559, 13))
			spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spectator:say('Time out! You were teleported out by strange forces.', TALKTYPE_MONSTER_SAY)
		elseif spectator:isMonster() then
			spectator:remove()
		end
	end
end

local FacelessBane = Action()
function FacelessBane.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 10029 then
		if player:getPosition() ~= Position(33638, 32562, 13) then
			item:transform(10030)
			return true
		end
	end
	if item.itemid == 10029 then
		local specs, spec = Game.getSpectators(config.centerRoom, false, false, 15, 15, 15, 15)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting with King Faceless Bane.")
				return true
			end
		end
		
		for x = 33638, 33642 do
			local playerTile = Tile(Position(x, 32562, 13)):getTopCreature()
			if playerTile and playerTile:isPlayer() then
				if playerTile:getStorageValue(Storage.ThreatenedDreams.FacelessBaneTime) < os.time() then
					playerTile:getPosition():sendMagicEffect(CONST_ME_POFF)
					playerTile:teleportTo(config.newPosition)
					playerTile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					playerTile:setStorageValue(Storage.ThreatenedDreams.FacelessBaneTime, os.time() + 10 * 3600)
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, recently someone challenge Faceless Bane.")
					return true
				end
			end
		end
		Game.createMonster("Faceless Bane", config.bossPosition, true, true) 
		-- addEvent(ClearFacelessBane, 30 * 60 * 1000)
		item:transform(10030)
	elseif item.itemid == 10030 then
		item:transform(10029)
	end
	return true
end

FacelessBane:uid(1039)
FacelessBane:register()