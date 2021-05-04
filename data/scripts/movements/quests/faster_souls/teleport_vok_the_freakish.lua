local function roomIsOccupied(centerPosition,
    rangeX, rangeY)
local spectators = Game.getSpectators(centerPosition, false, true,
    rangeX,
    rangeX, rangeY, rangeY)
if #spectators ~= 0 then
    return true
end
return false
end

function clearBossRoom(playerId, bossId,
    centerPosition,
    rangeX, rangeY, exitPosition)
local spectators, spectator = Game.getSpectators(centerPosition, false, false,
    rangeX,
    rangeX, rangeY, rangeY)
for i = 1, #spectators do
    spectator = spectators[i]
    if spectator:isPlayer() and spectator.uid == playerId then
        spectator:teleportTo(exitPosition)
        exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
    end
    if spectator:isMonster() and spectator.uid == bossId then
        spectator:remove()
    end
end
end

local bosses = {
    [4604] = {
        bossName = 'vok the freakish',
        storage = 65016,
        playerPosition = Position(33505, 31486, 9),
        bossPosition = Position(33508, 31490, 9),
        centerPosition = Position(33508, 31490, 9),
        rangeX = 13, rangeY = 13,
    },
    [4602] = {
        bossName = 'irgix the flimsy',
        storage = 65017,
        playerPosition = Position(33467, 31397, 8),
        bossPosition = Position(33468, 31401, 8),
        centerPosition = Position(33468, 31401, 8),
        rangeX = 13, rangeY = 13,
    },
    [4600] = {
        bossName = 'unaz the mean',
        storage = 65018,
        playerPosition = Position(33562, 31493, 8),
        bossPosition = Position(33575, 31495, 8),
        centerPosition = Position(33570, 31496, 8),
        rangeX = 13, rangeY = 13,
    }
}

local boss = MoveEvent()

function boss.onStepIn(creature, item, position, fromPosition)
local player = creature:getPlayer()
if not player then
    return true
end

local boss = bosses[item.uid] or bosses[item:getActionId()]
if not boss then
    return true
end

if roomIsOccupied(boss.centerPosition, boss.rangeX, boss.rangeY) then
    player:teleportTo(fromPosition, true)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

if player:getStorageValue(boss.storage) < os.time() then
    player:setStorageValue(boss.storage, os.time() + 5 * 3600)
    player:teleportTo(boss.playerPosition)
    boss.playerPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return true
else
    player:teleportTo(fromPosition, true)
    player:say(
        "You have already faced this boss, wait 5 hours.",
        TALKTYPE_MONSTER_SAY
    )
    return false
end

local monster = Game.createMonster(boss.bossName, boss.bossPosition)
if not monster then
    return true
end

addEvent(clearBossRoom, 60 * 30 * 1000, player.uid, monster.uid, boss.centerPosition, boss.rangeX, boss.rangeY, fromPosition)
player:say(
    "You have thirty minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.",
    TALKTYPE_MONSTER_SAY
)
return true
end

boss:type("stepin")

for index, value in pairs(bosses) do
boss:aid(index)
end

boss:register()
