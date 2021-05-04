local BabyUnicorn = Action()
local transformItems = {
	[36539] = 36538, [36538] = 36539, --baby unicorn
}
local z = 7


function BabyUnicorn.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local pos = getCreaturePosition(player)
    for x = -7, 7 do
        for y = -5, 5 do
            doSendMagicEffect({x = pos.x + x, y = pos.y + y, z = pos.z}, 13, player)
            doSendMagicEffect({x = pos.x + x, y = pos.y + y, z = pos.z}, 14, player)
            doSendMagicEffect({x = pos.x + x, y = pos.y + y, z = pos.z}, 15, player)
        end
    end

	player:say("Feel the power of my horn!", TALKTYPE_MONSTER_SAY)
    item:transform(transformItems[item.itemid])
	item:decay()
	return true
end

BabyUnicorn:id(36538)
BabyUnicorn:register()