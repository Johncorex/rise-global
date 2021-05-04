local setting = {
	{fromPos = Position(32404, 31778, 7), toPos = Position(32413, 31789, 7), Local = 284723},
	{fromPos = Position(32174, 31835, 8), toPos = Position(32181, 31837, 8), Local = 284724},
	{fromPos = Position(32624, 32412, 9), toPos = Position(32633, 32422, 9), Local = 284725},
}

local DeathKnellUses = Action()

function DeathKnellUses.onUse(player, item, fromPosition, target, toPosition, isHotkey)


    local playerPos, isInPosition, temple, Local = player:getPosition(), false
	for i = 1, #setting do
		temple = setting[i]
		if isInRange(playerPos, temple.fromPos, temple.toPos) then
            isInPosition, Local = true, temple.Local
            break
		end
	end

    if not isInPosition then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It was not possible to infuse your aura with ghostly energies.')
		return true
	end
    if player:getStorageValue(Local) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have already collected the ghostly souls from this location.')
		return true
	end


	player:getPosition():sendMagicEffect(447)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Ring!')
	player:setStorageValue(Local, 1)
    
	return true
end

DeathKnellUses:id(37417)
DeathKnellUses:register()