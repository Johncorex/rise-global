local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
    npcHandler:onThink()
end

-- local shopModule = ShopModule:new()
-- npcHandler:addModule(shopModule)

-- shopModule:addBuyableItem({"broken compass"}, 29047, 10000)

local BossNameWeek = {
    [1] = 'Plagueroot', -- domingo
    [2] = 'Malofur Mangrinder', -- segunda
    [3] = 'Maxxenius', -- terça
    [4] = 'Alptramun', -- quarta
    [5] = 'Izcandar The Banished', -- quinta
    [6] = 'Malofur Mangrinder', -- sexta
    [7] = 'Izcandar The Banished' -- sabado
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
    
	local player = Player(cid)	
    local DiadeHojeBoss = os.date("*t").wday
	if msgcontains(msg, "boss") then
        
		npcHandler:say("Today's boss is " .. BossNameWeek[DiadeHojeBoss] .. ". Say {fight} to face this fearless creature.", cid)
    elseif msgcontains(msg, "fight") then
        -- Verifica dentro da sala se não há nenhum outro player
        local specs, spec = Game.getSpectators(Position(32207, 32046, 14), false, false, 7, 7, 7, 7)
		for i = 1, #specs do
			spec = specs[i]
			if spec:isPlayer() then
                npcHandler:say("Another person is at war in the room, wait a few moments until he can complete the mission given to him.", cid)
				return true
			end
		end
        -- Verifica dentro da sala se não há nenhum outro player

        -- Caso não tenha player dentro da sala, ele envia o jogador que quer desafiar, verifica o boss que é da vez e sumona.
		npcHandler:say("Good luck!", cid)
        player:teleportTo(Position(32207, 32055, 14))
		Game.createMonster(BossNameWeek[DiadeHojeBoss], Position(32208, 32046, 14), true, true)



    elseif msgcontains(msg, "leave") then
		npcHandler:say("Good bye.", cid)
        player:teleportTo(Position(32204, 32021, 13))
    end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_GREET, "Hello Adventurer! Every day of the week we will have different challenges for you! Tell {boss} to know what the boss will be today. You can also leave the room by saying {leave}.")

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")

npcHandler:addModule(FocusModule:new())
