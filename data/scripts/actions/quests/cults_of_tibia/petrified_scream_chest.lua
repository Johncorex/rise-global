local PetrifiedChestQuest = Action()

function PetrifiedChestQuest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(57982) ~= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found 5 petrified scream.")
		player:addItem(11337, 5)
		player:setStorageValue(57982, 1)
	else 
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Empty chest.")
	end
	return true
end

PetrifiedChestQuest:uid(57982)
PetrifiedChestQuest:register()