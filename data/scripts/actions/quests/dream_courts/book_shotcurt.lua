local FacelessBookShotcurt = Action()
function FacelessBookShotcurt.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33640, 32560, 13))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	return true
end

FacelessBookShotcurt:id(34592)
FacelessBookShotcurt:register()