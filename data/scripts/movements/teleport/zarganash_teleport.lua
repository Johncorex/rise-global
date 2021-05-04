local setting = {
	[62122] = Position(33615, 31423, 10),
	[62123] = Position(33776, 31661, 14), -- boss mirrored thais
	[62124] = Position(33634, 31430, 10),
	[62125] = Position(33530, 31410, 9),
	[62126] = Position(33541, 31411, 9),
	[62127] = Position(33537, 31440, 9),
	[62128] = Position(33550, 31438, 9),
	[62129] = Position(33557, 31467, 9),
	[62130] = Position(33571, 31467, 9),
	[62131] = Position(33485, 31435, 8),
	[62132] = Position(33482, 31452, 9),
	[62133] = Position(33545, 31444, 8),
	[62134] = Position(33534, 31444, 8),
	[14518] = Position(33649, 31444, 10),
	[14519] = Position(33649, 31444, 10),
	[14520] = Position(32424, 32445, 7),
	[14521] = Position(33181, 31749, 7),
	[4518] = Position(32627, 32079, 7),
	[4515] = Position(32883, 32520, 7),
	
	[62120] = Position(33987, 30998, 9), -- soul war -> claustrophobic inferno
	[62135] = Position(33889, 31000, 8), -- soul war -> ebb and flow
	[59131] = Position(33621, 31423, 10), -- ebb and flow -> boss
	[62136] = Position(33987, 30998, 9), -- soul war -> rotten wasteland
	[14542] = Position(33860, 31830, 3), -- soul war -> furious crater
	[62121] = Position(33886, 31188, 10), -- soul war -> mirrored nightmare

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
	toPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end

zarganashTeleport:type("stepin")

for index, value in pairs(setting) do
	zarganashTeleport:aid(index)
end

zarganashTeleport:register()
