local Ausente = TalkAction("!ausente")

function startAusente(player, position)
	player:say("Ausente ...", TALKTYPE_MONSTER_SAY)
	position:sendMagicEffect(33)
end

function stopAusente(player)
	player:sendCancelMessage("Voce nao esta mais ausente.")
end


function Ausente.onSay(player, words, param)
	local position = player:getPosition()

	if param == '' then
		startAusente(player, position)
 	elseif param == 'stop' then
	   stopAusente(player)
	end
end

Ausente:separator(" ")
Ausente:register()