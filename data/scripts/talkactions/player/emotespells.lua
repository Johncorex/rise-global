local emotespells = TalkAction("!emotespells","/emotespells")

function emotespells.onSay(player, words, param)
	local switch = player:getStorageValue(203500) == -1 and 1 or -1

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'Emote Spells: (' .. (switch == 1 and 'Activated' or 'Disabled') .. ')')
	player:setStorageValue(203500, switch)
end


emotespells:register()
