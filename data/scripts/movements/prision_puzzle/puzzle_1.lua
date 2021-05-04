local PrisionPuzzleI = MoveEvent()

function PrisionPuzzleI.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	item:transform(37726)
	return true
end

PrisionPuzzleI:type("stepin")
PrisionPuzzleI:id(37726)
PrisionPuzzleI:register()
