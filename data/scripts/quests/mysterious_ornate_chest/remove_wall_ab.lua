local wallsPositions = {
	{x = 32679, y = 31608, z = 8}
}

local RemoveWallAb = Action()

function RemoveWallAb.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	for i = 1, #wallsPositions do
		local walls = Tile(wallsPositions[i]):getItemById(3459)
		if walls then
			walls:remove()
		end
	end

	return true
end

RemoveWallAb:aid(19075)
RemoveWallAb:register()

local wallsPositions2 = {
	{x = 32675, y = 31604, z = 8}
}
local RemoveWallAbSkull = Action()

function RemoveWallAbSkull.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	for i = 1, #wallsPositions2 do
		local walls = Tile(wallsPositions2[i]):getItemById(3457)
		if walls then
			walls:remove()
			fromPosition:sendMagicEffect(3)
		end
	end

	return true
end

RemoveWallAbSkull:id(21398)
RemoveWallAbSkull:register()