local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink() end
local player = Player(cid)



function StartQuest(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    doSendMagicEffect(getCreaturePosition(cid), 73)
    selfSay('Excellent... I hope they will haaaaaaunt my house no longer. What was your... naaaaaame again, tell me?', cid)
end


node01 = keywordHandler:addKeyword({ "yes" }, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeeeees... you need to help meeeeeee. I want those ghosts gone... this is my home and I need it to teach my students. Will you take care of the... {ghosts}?"})
node01:addChildKeyword({ "ghosts" }, StartQuest, {})

npcHandler:setMessage(MESSAGE_GREET, "This place is... haunted... heed my warning... there are... ghooooooosts here...! Why are you giving me that... look? I am certain, there aaaaaaare ghosts here - I've seen them! Do you believe me?")
npcHandler:addModule(FocusModule:new())