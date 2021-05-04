local StaminaRefill = Action()

function StaminaRefill.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local refuel = 42 * 60 * 1000
	-- full
	if doPlayerRemoveItem(player, 16101, 1) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Stamina was fully charged.")
		doSendMagicEffect(getCreaturePosition(player), 440)
		player:setStamina(refuel)
		player:doPlayerRemoveItem(16101)
	end
	return true
end

StaminaRefill:id(16101)
StaminaRefill:register()