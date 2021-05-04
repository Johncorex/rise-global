local ejectHouse = TalkAction("!eject")

function ejectHouse.onSay(player, words, param)
	local housePrice = configManager.getNumber(configKeys.HOUSE_PRICE)
	if housePrice == -1 then
		return true
	end

	if not player:isPremium() then
		player:sendCancelMessage("You need a premium account.")
		return false
	end
	
	local position = player:getPosition()
	position:getNextPosition(player:getDirection())

	
	local tile = Tile(position)
	local house = tile and tile:getHouse()
	if not house then
		player:sendCancelMessage("You have to be looking at the door of the house you would like to eject player.")
		return false
	end

    local days = 5 * 24 * 60 * 60
    local own = house:getOwnerGuid()
	local sql = string.format("SELECT `lastlogin` FROM `players` WHERE `id` = "..own)
    local qry = db.storeQuery(sql)
	local lastlogin = result.getDataString(qry, "lastlogin")
    
    if(qry ~= -1) then
        last = tonumber(lastlogin)
        if last < os.time() - days then
            house:setOwnerGuid()
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A Casa agora esta sem dono, você ou outro jogador pode compra-la")
        end
        if last > os.time() - days then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O proprietário desta casa ainda está ativo no servidor, tente outra casa.")
        end
    end
    return false
end

ejectHouse:separator(" ")
ejectHouse:register()
