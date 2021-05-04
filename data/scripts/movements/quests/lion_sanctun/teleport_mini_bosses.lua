local config = {
	[30000] = Position(33154, 32247, 12),
	[30001] = Position(33148, 32285, 12),
	[30002] = Position(33119, 32280, 12),
	[30003] = Position(33087, 32241, 12),
	-- fim ida
	-- inicio volta
	[30004] = Position(33123, 32236, 12),
	[30005] = Position(33111, 32252, 12),
	[30006] = Position(33123, 32269, 12),
	[30007] = Position(33134, 32252, 12),
}
local storageTime = {
	[30000] = Storage.LionsRock.HyenaSign,
	[30001] = Storage.LionsRock.SnakeSign,
	[30002] = Storage.LionsRock.ScorpionSign,
	[30003] = Storage.LionsRock.LizardSign,
}
local boosName = {
	[30000] = "Yirkas Blue Scales",
	[30001] = "Katex Blood Tongue",
	[30002] = "Srezz Yellow Eyes",
	[30003] = "Utua Stone Sting",
}
local boosPosition = {
	[30000] = Position(33158, 32250, 12),
	[30001] = Position(33154, 32286, 12),
	[30002] = Position(33124, 32283, 12),
	[30003] = Position(33087, 32245, 12),
}



local LionSanctunTeleport = MoveEvent()

function LionSanctunTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = config[item.actionid]
	local storage = item.actionid

	if item.actionid == 30000 or item.actionid == 30001 or item.actionid == 30002 or item.actionid == 30003 then
		if player:getStorageValue(storageTime[item.actionid]) < os.time() then
				player:say("This is time! Go to fight!", TALKTYPE_MONSTER_SAY)
				teleport:sendMagicEffect(CONST_ME_GREEN_RINGS)
				fromPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
			else 
				player:say("You need to wait a while, recently someone challenge " .. boosName[item.actionid] .. ".", TALKTYPE_MONSTER_SAY)
			return true
		end
	end

	
	if teleport then
		player:teleportTo(teleport)
		
		-- exibe a mensagem s� quando cai na sala. 			
			
			if item.actionid == 30000 or item.actionid == 30001 or item.actionid == 30002 or item.actionid == 30003 then
				Game.createMonster(boosName[item.actionid], boosPosition[item.actionid], true, true)
				player:setStorageValue(storageTime[item.actionid], os.time() + 2 * 3600)
			end
		end
		return true
	end


LionSanctunTeleport:type("stepin")

for index, value in pairs(config) do
	LionSanctunTeleport:aid(index)
end

LionSanctunTeleport:register()