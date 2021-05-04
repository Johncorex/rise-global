local PhantasmalMount = Action()

function PhantasmalMount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local HorseshoeUses = player:getStorageValue(38907)
    local SpectralSaddleUses = player:getStorageValue(38908)
    local SpectralHorseTackUses = player:getStorageValue(38909)
       

    -- if (item:getId() == 38909) then
    --     player:setStorageValue(38909, SpectralHorseTackUses + 1)
    --     -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Você usou ' .. SpectralHorseTackUses .. ' ' .. item:getName() .. '.')
    --     item:remove(1)
    -- end
    
    -- if (item:getId() == 38908) then
    --     player:setStorageValue(38908, SpectralSaddleUses + 1)
    --     -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Você usou ' .. SpectralSaddleUses .. ' ' .. item:getName() .. '.')
    --     item:remove(1)
    -- end
    
    -- if (item:getId() == 38907) then
    --     player:setStorageValue(38907, HorseshoeUses + 1)
    --     -- player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Você usou ' .. HorseshoeUses .. ' ' .. item:getName() .. ' de 04.')
    --     item:remove(1)
    -- end
    
    -- if HorseshoeUses == 4 and SpectralHorseTackUses == 1 and SpectralSaddleUses == 1 then
    --     player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Parabéns por sua montaria!')
        
    --     doSendMagicEffect(getCreaturePosition(player), 66) 
    --     doPlayerAddMount(player, 167)
    -- end 


	return true
end

PhantasmalMount:id(38907,38908,38909)
PhantasmalMount:register()