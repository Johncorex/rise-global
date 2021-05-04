local config = {
	[14532] = Position(33882, 31872, 4),
	[14533] = Position(33890, 31872, 3),
	[14534] = Position(33890, 31872, 3),
	[14535] = Position(33836, 31866, 5),
	[14536] = Position(33830, 31880, 4),
	[14537] = Position(33869, 31867, 6),
	[14538] = Position(33857, 31884, 5),
	[14539] = Position(33856, 31831, 3),
	[14540] = Position(33853, 31831, 3),
	[14541] = Position(33624, 31423, 10),
	[14543] = Position(33649, 31444, 10),
	[14544] = Position(33649, 31444, 10),
	[14545] = Position(33903, 31884, 8),
	[14546] = Position(33899, 31889, 8),
	[14547] = Position(33850, 31813, 8),
	
	-- fim ida
}


local FuriousCraterTeleports = MoveEvent()

function FuriousCraterTeleports.onStepIn(creature, item, position, fromPosition)
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


FuriousCraterTeleports:type("stepin")

for index, value in pairs(config) do
	FuriousCraterTeleports:aid(index)
end

FuriousCraterTeleports:register()