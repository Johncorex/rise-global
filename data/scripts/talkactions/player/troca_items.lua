local trocar = TalkAction("!so123123123ul")
local soul_items = {38934, 38927, 38930, 38931, 38929, 38928, 38932, 38933, 38924, 38923, 38922, 38921, 38920, 38919, 38918, 38917, 38925, 38926}

function trocar.onSay(player, words, param)
	local split = param:split(", ")
	if split[1] == "soulwalkers" then split[1] = 38932 end if split[2] == "soulwalkers" then split[2] = 38932 end
	if split[1] == "soulstalkers" then split[1] = 38933 end if split[2] == "soulstalkers" then split[2] = 38933 end
	if not table.contains(soul_items, ItemType(split[1]):getId()) or not table.contains(soul_items, ItemType(split[2]):getId()) then
		player:sendCancelMessage("Voce nao pode trocar este item.") 
		return false
	end
	if player:removeItem(ItemType(split[1]):getId(), 1) then
		player:addItem(ItemType(split[2]):getId(), 1)
		if split[1] == 38932 then split[1] = "pairs of soulwalkers" end if split[2] == 38932 then split[2] = "pairs of soulwalkers" end
		if split[1] == 38933 then split[1] = "pairs of soulstalkers" end if split[2] == 38933 then split[2] = "pairs of soulstalkers" end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce trocou uma "..split[1].." por uma "..split[2]..".")
	else
		player:sendCancelMessage("Voce nao possui uma "..split[1].." para trocar.")
	end
end

trocar:separator(" ")
trocar:register()