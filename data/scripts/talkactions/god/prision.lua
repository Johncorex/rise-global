local SendPrision = TalkAction("/p")


function SendPrision.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local split = param:split(",")
	local name = split[1]
	local tempo = tonumber(split[2])

	local target = Player(name)
	if target then
	target:registerEvent("PrisionModal")
	
	local title = "MaserOTs Prision System"
	local message = "Você foi enviado a prisão! Ficará preso " .. tempo.. " minutos.\n\nMotivo: Detecção automatica anti bot."
	local PrisionModal = ModalWindow('PrisionModal', title, message)

	target:teleportTo(Position(31938, 31037, 14))


	-- PrisionModal:addChoice(1, "Aceitar")
	-- PrisionModal:addChoice(2, "Sair")

	-- PrisionModal:addButton(100, "Choose")
	PrisionModal:addButton(101, "Cancel")

	PrisionModal:setDefaultEnterButton(100)
	PrisionModal:setDefaultEscapeButton(101)

	PrisionModal:sendToPlayer(target)
end
	return false
end

SendPrision:separator(" ")
SendPrision:register()
