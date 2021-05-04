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

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	
	if msgcontains(msg, "stamina") then
			if getPlayerItemCount(cid,16101) >= 1 then
				if doPlayerRemoveItem(cid,16101,1) then 
					player:setStamina(2520)
					npcHandler:say("Sua stamina foi regenerada por completo!", cid)
					doSendMagicEffect(getCreaturePosition(cid), 73) 
				end
			else
				npcHandler:say("Você não possui o item stamina refil.", cid)
			end
		end


	if msgcontains(msg, "chalise") then
		player:setStorageValue(Storage.ForgottenKnowledge.Chalice, 1)
		player:setStorageValue(Storage.ForgottenKnowledge.AccessLavaTeleport, 1)

		npcHandler:say("Feito.", cid)
	end
	
	if msgcontains(msg, "oramond") then
		player:setStorageValue(Storage.DarkTrails.Mission01, 1)
		player:setStorageValue(Storage.DarkTrails.Mission02, 1)
		player:setStorageValue(Storage.DarkTrails.Mission03, 1)
		player:setStorageValue(Storage.DarkTrails.Mission04, 1)
		player:setStorageValue(Storage.DarkTrails.Mission05, 1)
		player:setStorageValue(Storage.DarkTrails.Mission06, 1)
		player:setStorageValue(Storage.DarkTrails.Mission07, 1)
		player:setStorageValue(Storage.DarkTrails.Mission08, 1)
		player:setStorageValue(Storage.DarkTrails.Mission09, 1)
		player:setStorageValue(Storage.DarkTrails.Mission10, 1)
		player:setStorageValue(Storage.DarkTrails.Mission11, 1)
		player:setStorageValue(Storage.DarkTrails.Mission12, 1)
		player:setStorageValue(Storage.DarkTrails.Mission13, 1)
		player:setStorageValue(Storage.DarkTrails.Mission14, 1)
		player:setStorageValue(Storage.DarkTrails.Mission15, 1)
		player:setStorageValue(Storage.DarkTrails.Mission16, 1)
		player:setStorageValue(Storage.DarkTrails.Mission17, 1)
		player:setStorageValue(Storage.DarkTrails.Mission18, 1)


		npcHandler:say("Feito.", cid)
	end
	if msgcontains(msg, "access") then
		-- Feiryst
		player:setStorageValue(Storage.ThreatenedDreams.Start, 1)
		player:setStorageValue(Storage.ThreatenedDreams.TroubledMission01, 17)
		npcHandler:say("Brave adventurer |PLAYERNAME|, I grant you permission to access the feyrist by means of the shrines.", cid)
	end
	if msgcontains(msg, "cults") then
		-- Cults
		player:setStorageValue(Storage.CultsOfTibia.Questline, 1)
		player:setStorageValue(Storage.CultsOfTibia.Minotaurs.JamesfrancisTask, 1)
		player:setStorageValue(Storage.CultsOfTibia.Minotaurs.Mission, 5)
		player:setStorageValue(Storage.CultsOfTibia.MotA.Mission, 15)
		player:setStorageValue(Storage.CultsOfTibia.Barkless.Mission, 7)
		player:setStorageValue(Storage.CultsOfTibia.Misguided.Mission, 5)
		player:setStorageValue(Storage.CultsOfTibia.Orcs.Mission, 3)
		player:setStorageValue(Storage.CultsOfTibia.Life.Mission, 10)
		player:setStorageValue(Storage.CultsOfTibia.Humans.Mission, 3)

		player:setStorageValue(Storage.CultsOfTibia.Minotaurs.Access, 1)
		player:setStorageValue(Storage.CultsOfTibia.Minotaurs.AccessDoor, 1)
		player:setStorageValue(Storage.CultsOfTibia.Minotaurs.JamesfrancisTask, 50)
		player:setStorageValue(Storage.CultsOfTibia.Minotaurs.EntranceAccessDoor, 1)
		npcHandler:say("Brave adventurer |PLAYERNAME|, I grant you permission to access the Cults of Tibia.", cid)
	end
	return true
end

keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, text = "I am a travelling trader. I don't buy everything, though. And not from everyone, for that matter."})
keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "I am Spanzil, son of the desert."})
keywordHandler:addKeyword({"offers"}, StdModule.say, {npcHandler = npcHandler, text = "Of course, old friend. You can also browse only armor, legs, shields, helmets, boots, weapons, enchanted weapons, jewelry or miscellaneous stuff."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, text = "Elves... I don't really trust them. All this talk about nature and flowers and treehugging... I'm sure there's some wicked scheme behind all this."})
keywordHandler:addKeyword({"desert"}, StdModule.say, {npcHandler = npcHandler, text = "My beloved hometown! Ah, the sweet scent of the desert sands, the perfect shape of the pyramids... stunningly beautiful."})
keywordHandler:addKeyword({"carlin"}, StdModule.say, {npcHandler = npcHandler, text = "I have to go to Carlin once in a while, since the queen wishes to see my exclusive wares in regular intervals."})
keywordHandler:addKeyword({"cormaya"}, StdModule.say, {npcHandler = npcHandler, text = "Cormaya? Not a good place to make business, it's way too far and small."})
keywordHandler:addKeyword({"darashia"}, StdModule.say, {npcHandler = npcHandler, text = "It's not the real thing, but almost as good. The merchants there claim ridiculous prices, which is fine for my own business."})
keywordHandler:addKeyword({"edron"}, StdModule.say, {npcHandler = npcHandler, text = "Ah yes, Edron! Such a lovely and quiet island! I usually make some nice business there."})
keywordHandler:addKeyword({"fibula"}, StdModule.say, {npcHandler = npcHandler, text = "Too few customers there, it's not worth the trip."})
keywordHandler:addKeyword({"greenshore"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"kazordoon"}, StdModule.say, {npcHandler = npcHandler, text = "I don't like being underground much. I also tend to get lost in these labyrinthine dwarven tunnels, so I rather avoid them."})
keywordHandler:addKeyword({"liberty bay"}, StdModule.say, {npcHandler = npcHandler, text = "When you avoid the slums, it's a really pretty city. Almost as pretty as the governor's daughter."})
keywordHandler:addKeyword({"northport"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"port hope"}, StdModule.say, {npcHandler = npcHandler, text = "I like the settlement itself, but I don't set my foot into the jungle. Have you seen the size of these centipedes??"})
keywordHandler:addKeyword({"senja"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"svargrond"}, StdModule.say, {npcHandler = npcHandler, text = "I wish it was a little bit warmer there, but with a good mug of barbarian mead in your tummy everything gets a lot cosier."})
keywordHandler:addKeyword({"thais"}, StdModule.say, {npcHandler = npcHandler, text = "I feel uncomfortable and rather unsafe in Thais, so I don't really travel there."})
keywordHandler:addKeyword({"vega"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"venore"}, StdModule.say, {npcHandler = npcHandler, text = "Although it's the flourishing trade centre of Tibia, I don't like going there. Too much competition for my taste."})
keywordHandler:addKeyword({"time"}, StdModule.say, {npcHandler = npcHandler, text = "It's almost time to journey on."})
keywordHandler:addKeyword({"king"}, StdModule.say, {npcHandler = npcHandler, text = "Kings, queens, emperors and kaliphs... everyone claims to be different and unique, but actually it's the same thing everywhere."})
keywordHandler:addKeyword({"feyrist"}, StdModule.say, {npcHandler = npcHandler, text = "I can grant you permission to access feyrist {access}."})


npcHandler:setMessage(MESSAGE_GREET, "Ah, a customer! Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, may the winds guide your way.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Take all the time you need to decide what you want!")

local function onTradeRequest(cid)
	-- if Player(cid):getStorageValue(Storage.TravellingTrader.Mission07) ~= 1 then
	-- 	npcHandler:say('Sorry, but you do not belong to my exclusive customers. I have to make sure that I can trust in the quality of your wares.', cid)
	-- 	return false
	-- end

	return true
end


npcHandler:setMessage(MESSAGE_GREET, "Greetings brave |PLAYERNAME|, I can buy several items saying {trade} and guarantee {access} to feiryst saying access. I can refill your full {stamina}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
