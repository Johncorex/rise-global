local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then return false end
	local player = Player(cid)
	if msgcontains(msg, "living") then
		npcHandler:say({
			"It has been a while since I roamed the world of the living in a mortal shell."
		}, cid)
	elseif msgcontains(msg, "mortal") then
		npcHandler:say({
			"I had many names in my live. The one that would be the most recognizable is probably the name Goshnar. Even that was an assumed name that I took, when i left my mundane past behind."
		}, cid)
	elseif msgcontains(msg, "Goshnar") then
		npcHandler:say({
			"I was once known as the necromant king....",
			"For some it was meant as a curse, others used the name with reverence. To me it was just another stepping stone, in a life that burned with ambition."
		}, cid)
	elseif msgcontains(msg, "ambition") then
		npcHandler:say({
			"My ambitions were high and knew no limits. Mastery over life and death was but a milestone that I wanted to accomplish. In the end I aspired probably somewhat like godhood....",
			"Though in hindsight even that wouldn't have been enough. There was a hunger in me that nothing could put to rest."
		}, cid)
	elseif msgcontains(msg, "milestone") then
		npcHandler:say({
			"Everything in my life was just a tool to further my goals. The brotherhood of bones was just a tool for me. As was everyone or everything. In the path I had chosen nothing mattered but me and my ambitions."
		}, cid)
	elseif msgcontains(msg, "everything") then
		npcHandler:say({
			"Necromancy was a passion at first, another tool while I amassed power and a crutch when my ambitions surpassed that what it could accomplish."
		}, cid)
	elseif msgcontains(msg, "accomplish") then
		npcHandler:say({
			"I was so convinced about my brilliance, my greatness, my destiny. And this hunger for more, it let me not have peace at any point in my life. I was always driven. There was no time to rest....",
			"And there was no looking back. I never cared to remember my humble beginnings, what I had sacrificed to get where I was. All that I had left behind and that I had lost forever....",
			"Now I see the bitter irony. I could bring back the dead, but I couldn't create second chances. I couldn't restore the truly important things that I had lost."
		}, cid)
	elseif msgcontains(msg, "dead") then
		npcHandler:say({
			"My demise did not meet me unprepared. As a powerful necromancer I had fettered my soul in the living world and the realms beyond. I had prepared for my return and was confident in my power."
		}, cid)
	elseif msgcontains(msg, "confident") then
		npcHandler:say({
			"My soul wandered the plains of Zarganash, waiting for my wards to power up. Waiting for my soul to be slowly pulled back and manifest in the world of the living once again. What I had not taken into consideration was peace."
		}, cid)
	elseif msgcontains(msg, "peace") then
		npcHandler:say({
			"Zarganash was not a place without it's dangers but for a soul as powerful as mine, there was little threat at all. For the first time in my existence I had to stop running forward. I had to wait for things to fit into their places....",
			"And me, who had seen things that horrible, they would have obliterated a lesser man's mind, finally took the time to look back. And what I saw was frightening in its own right....",
			"A great tiredness overcame me. With the flames of my ambitions calming down for the first time since I could remember, all my aspirations and plans seemed to petty and futile....",
			"Everything I had worked for and my plans for the things to come seemed pointless and the things I had lost and never allowed myself to experience weighted heavily on my soul."
		}, cid)
	elseif msgcontains(msg, "soul") then
		npcHandler:say({
			"I talked to other souls, lost in Zarganash and most of them seemed like mirrors to myself. Their faults, their shortcomings, the things that were important to them and the things they had lost....",
			"It was all like miniature copies of my own grand plans and losses. It made me think. And the great tiredness weighted even more heavy on me. A weariness of the world, of the hunger that drove me."
		}, cid)
	elseif msgcontains(msg, "weariness") then
		npcHandler:say({
			"Then I met a wise soul. A teacher that did not lecture. I never was impressed by anything but my own accomplishments but the inner balance and peace of this soul, it did impress me. A lot....",
			"I, who fancied myself to have been the epitome of knowledge, learned things that were entirely new to me. But this knowledge wasn't about power. It was about me."
		}, cid)
	elseif msgcontains(msg, "knowledge") then
		npcHandler:say({
			"I recognized the extent of my folly and failure. I decided not to return to the world of the living."
		}, cid)
	elseif msgcontains(msg, "return") then
		npcHandler:say({
			"I decided to stay here, even pass on into the great beyond at some point. Yet I still feel the pull of my fetters. I can faintly hear those who think they are my followers, calling to me....",
			"And I feel others, many others who carve for my powers and try to bring me back for their own gain."
		}, cid)
	elseif msgcontains(msg, "fetters") then
		npcHandler:say({
			"Over my time in Zarganash I split away the parts of me that my worldly fetters where bound to. Yet I had to recognize that they are still a part of me and I'm bound to them....",
			"The fetters and the efforts to call me back, are empowering them. I feel them growing in strength and gaining awareness on their own. ...",
			"They are beginning to feed not only on the fetters and incarnations but also on me. As I grow weaker they grow more powerful over time."
		}, cid)
	elseif msgcontains(msg, "powerful") then
		npcHandler:say({
			"The only way I can get rid of them is to disperse them, to 'kill' them so to say. But they are tainted parts of myself and even going near them might endanger my sanity and stability. So all I can do is to ask you to do this daunting task."
		}, cid)
	-- elseif msgcontains(msg, "task") then
	-- 	npcHandler:say({
	-- 		"I'm aware I have no right to ask and I have little to offer as a payment, but I ask you nonetheless. Will you face my fettered vices and destroy them for me?"
	-- 	}, cid)
	elseif msgcontains(msg, "burden") then
		npcHandler:say({
			"You will have to reach each of the negative parts of my personality, I split away. They are hidden deep in the depths of Zarganash and will have corrupted and twisted their surroundings into dangerous nightmares....",
			"Even worse you'll likely encounter minions of those who want to claim my soul as their prize, for their own, depraved reasons. You will have to destroy my shards to set me free."
		}, cid)
	elseif msgcontains(msg, "shards") then
		npcHandler:say({
			"You haven't killed Malice yet. You haven't killed Hatred yet. You haven't killed Spite yet. You haven't killed Cruelty yet. You haven't killed Greed yet."
		}, cid)
	elseif msgcontains(msg, "The Pale Worm") then
		npcHandler:say({
			"His avatar might be destroyed for now and it'd grip on Zarganash considerably weakened. Yet he burrowed to deep into the essence of this realm to be anihilated this easy."
		}, cid)
	elseif msgcontains(msg, "Fermuba") then
		npcHandler:say({
			"My daughter was as ambitious as me, yet she lacked my intellect and my raw talent. She still was great and talented yet I sadly let her feel my disdain. One of the many errors that my way of hubris made me do."
		}, cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, living soul!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())