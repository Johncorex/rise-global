-- Fazer com que clicando no carrinho saia ou entra POS: 33853, 31819, 8

local FacelessBookShotcurt = Action()
function FacelessBookShotcurt.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:teleportTo(Position(33876, 31885, 8))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	return true
end

FacelessBookShotcurt:id(37406)
FacelessBookShotcurt:register()