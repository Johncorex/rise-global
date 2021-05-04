-- local SavePlayer = GlobalEvent("SavePlayer")

-- local savingEvent = 0
-- function saveLoop(delay)
-- 	saveServer()
-- 	SaveHirelings()
-- 	-- print("> Server Save" .. print(os.date("%x")))
-- 	if delay > 0 then
-- 		savingEvent = addEvent(saveLoop, delay, delay)
-- 	end
-- end

-- function SavePlayer.onThink(cid, interval, param)
--     if isNumber(param) then
--         stopEvent(savingEvent)
--         saveLoop(tonumber(param) * 60 * 1000)
--     else
--         saveServer()
--         SaveHirelings()
--         -- print("> Server Save" .. print(os.date("%x")))
--     end
--     -- sql = string.format("INSERT INTO `historico_save` (`id`, `data`) VALUES (NULL, '" .. os.date("%d/%m/%Y %H:%m") .. "');")
--     -- db.query(sql)
--     return true
-- end

-- SavePlayer:interval(900000)
-- SavePlayer:register()