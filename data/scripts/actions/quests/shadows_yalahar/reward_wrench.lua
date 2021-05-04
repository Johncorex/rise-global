local items = {
	{itemid = 18516, count = 1},
}

local TelasWrench = Action()
function TelasWrench.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 21385 then
		return false
	end
	if player:getStorageValue(Storage.ShadowsOfYalahar.RewardWrench) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The chest is empty.')
		return true
	end
	local bag = Game.createItem(1987)
	for i = 1, #items do
		bag:addItem(items[i].itemid, items[i].count)
	end
	if player:addItemEx(bag) ~= RETURNVALUE_NOERROR then
		local weight = bag:getWeight()
		if player:getFreeCapacity() < weight then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('You have found %s weighing %.2f oz. You have no capacity.', bag:getName(), (weight / 100)))
		else
			player:sendCancelMessage('You have found a bag, but you have no room to take it.')
		end
		return true
	end
	player:setStorageValue(Storage.ShadowsOfYalahar.RewardWrench, 1)
	return true
end

TelasWrench:id(21385)
TelasWrench:register()