local config = {
	[14515] = Position(31915, 32356, 8),
	[14516] = Position(31915, 32356, 8),
	[14518] = Position(33614, 31414, 8),
	[14519] = Position(33614, 31414, 8),
	[14530] = Position(31915, 32356, 8),
	[14531] = Position(31915, 32356, 8),
	-- fim ida
}


local EntradaFasterSouls = MoveEvent()

function EntradaFasterSouls.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = config[item.actionid]
	
	if teleport then
		player:teleportTo(teleport)
	end
		return true
	end


EntradaFasterSouls:type("stepin")

for index, value in pairs(config) do
	EntradaFasterSouls:aid(index)
end

EntradaFasterSouls:register()