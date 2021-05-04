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

-- local voices = {
-- 	{ text = 'I am a MAN! Get me out you drunken fools!' },
-- 	{ text = 'GET ME OUT OF HERE!' },
-- 	{ text = 'Get me out! It was all part of the plan, you fools!' },
-- 	{ text = 'If I ever get out of here, I\'ll kill you all! All of you!' },
-- 	{ text = 'I am NOT Princess Lumelia, you fools!' },
-- 	{ text = 'Get a locksmith and free me or you will regret it, you foolish pirates!' },
-- 	{ text = 'I am not a princess, I am an actor!' }
-- }

-- npcHandler:addModule(VoiceModule:new(voices))


keywordHandler:addKeyword({'late'}, StdModule.say, {npcHandler = npcHandler,
	text = {
		'While you travel and fight the threat where it arises, we will put all our resources into researching the ultimate plans of the legion. Perhaps I can tell you more when you report back. ...',
		'Don\'t forget that you\'ll need very potent holy water for your task. If you need some, just ask me for a trade.'
	}}
)
npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! There is much we have to discuss.")

npcHandler:addModule(FocusModule:new())
