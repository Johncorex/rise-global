local SpiderEggs = Action()


function SpiderEggs.onUse(player, item, fromPosition, target, toPosition, isHotkey)
        Game.createMonster("Spider", Position(fromPosition), true, true)
        item:transform(7586)
	return true
end

SpiderEggs:id(7585)
SpiderEggs:register()