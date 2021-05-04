local BarrenDriftEntrace = Action()
function BarrenDriftEntrace.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33876, 31885, 8))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	return true
end

BarrenDriftEntrace:aid(32533)
BarrenDriftEntrace:register()