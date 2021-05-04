local flaskRemove = TalkAction("!flask","!vial")

function flaskRemove.onSay(player, words, param)
	local switch = player:getStorageValue(203501) == -1 and 1 or -1

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'Vial Remove: (' .. (switch == 1 and 'Disabled' or 'Activated') .. ')')
	player:setStorageValue(203501, switch)
end


flaskRemove:register()
