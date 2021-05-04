local FinalJudgement = Action()

function FinalJudgement.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- full
	if doPlayerRemoveItem(player, 36573, 1) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Outfit and Addon added successfully!")
		doSendMagicEffect(getCreaturePosition(player), 440)
		doPlayerAddOutfit(player, 1243, 1) 
		doPlayerAddOutfit(player, 1244, 1)
        setPlayerStorageValue(player,22038,1)
	end
	return true
end

FinalJudgement:id(36573)
FinalJudgement:register()