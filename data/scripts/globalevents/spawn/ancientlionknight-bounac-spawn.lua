local config = {
    monsterName = 'Ancient Lion Knight',
    bossPosition = Position(32440, 32471, 6),
    centerPosition = Position(32440, 32471, 6),
    rangeX = 10,
    rangeY = 10
}

local function checkBoss(centerPosition, rangeX, rangeY, bossName)
    local spectators, spec = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
    for i = 1, #spectators do
        spec = spectators[i]
        if spec:isMonster() then
            if spec:getName() == bossName then
                return true
            end
        end
    end
    return false
end

local ancientlionknight = GlobalEvent("ancientlionknight")
function ancientlionknight.onThink(interval, lastExecution)
    if checkBoss(config.centerPosition, config.rangeX, config.rangeY, config.monsterName) then
        return true
    end

    local boss =
    Game.createMonster(config.monsterName, config.bossPosition, true, true)
    boss:setReward(true)
    return true
end

-- ancientlionknight:interval(900000)
ancientlionknight:interval(500000)
ancientlionknight:register()