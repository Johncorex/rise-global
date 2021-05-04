local setting = {
	[62136] = Position(32208, 32092, 13),
	[62137] = Position(32208, 32092, 13),
	[62138] = Position(32208, 32092, 13),
	[62139] = Position(32208, 32092, 13),
}

local zarganashTeleport = MoveEvent()

function zarganashTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local toPosition = setting[item.actionid]
	if not toPosition then
		return true
	end

	player:teleportTo(toPosition)
	-- toPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end

zarganashTeleport:type("stepin")

for index, value in pairs(setting) do
	zarganashTeleport:aid(index)
end

zarganashTeleport:register()
