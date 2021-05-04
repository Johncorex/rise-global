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


local function greetCallback(cid)
	local player = Player(cid)
	if not player:setStorageValue(284722) then
		npcHandler:setMessage(MESSAGE_GREET,{
			"Welcome adventurer! I'm sensing some very unusual distortions in the fabric of reality recently. They are caused by an inactive portal right beside me. ...",
			"I found a way to activate it. Yet, to keep it open, I have to stay here, focusing on the portal. Thus I need you to go in there and uncover the true story behind those distortions. Can I count on you?"
		}, cid)
	else
		npcHandler:setMessage(MESSAGE_GREET,{
			"Glad you managed to collect all the ghostly souls, now we are facing a mysterious anomaly, I ask you to check and identify what is causing it. Good luck, and be careful, the road is as dangerous as it is!"
		}, cid)
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "yes") then
		npcHandler.topic[cid] = 0
		npcHandler:say({
			"Thank you very much. In order to pass the invisible portal over there, you have to visit three places that are closely linked to death and afterlife. Sound this knell at each of the sites to infuse your aura with the ghostly energies there. ...",
			"The places you have to visit are: the cemetery east of Carlin, a sacrificial site beneath the Ghostlands and a skull-adorned altar underneath the Dark Cathedral. ...",
			"You also have to drink a special potion to pass the portal. Find bone meal and grave flower extract and mix them together to brew this potion. Once you drank the potion you will be able to pass the portal."
		}, cid)
		player:setStorageValue(284722, 2)
		player:addItem(37417, 1)
	elseif msgcontains(msg, "bone meal") and npcHandler.topic[cid] == 0 then
		npcHandler.topic[cid] = 1
		npcHandler:say("I guess, it should be made from a skull. Yes, grinding a skull into fine dust will do.", cid)
			player:setStorageValue(284722, 3)
			player:addItem(37437, 1)
	elseif msgcontains(msg, "grave flower extract") and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 2
		npcHandler:say("As the name implies, grave flowers grow on graves. Pick one and distil it to extract its essence.", cid)
		player:setStorageValue(284722, 4)
		player:addItem(37438, 1)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
