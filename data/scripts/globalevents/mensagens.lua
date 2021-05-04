-- local MensagensPropaganda = GlobalEvent("MensagensPropaganda")

-- function MensagensPropaganda.onThink(cid, interval, param)

--     local mensagens = {"Encontrou algum bug? Reporte para algum GM, vamos manter o nosso servidor sempre online e sem quedas!","www.MaserOTs.online","Discord:\nhttps://discord.gg/h4wVYCRb94"} -- Defina as mensagens de propaganda

--     for _, targetPlayer in ipairs(Game.getPlayers()) do
-- 		targetPlayer:sendPrivateMessage(cid, mensagens[math.random(1,table.maxn(mensagens))], TALKTYPE_BROADCAST)
-- 	end
--     return true
-- end

-- MensagensPropaganda:interval(300000)
-- MensagensPropaganda:register()
