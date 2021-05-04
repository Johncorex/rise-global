local mType = Game.createMonsterType("Yirkas Blue Scales")
local monster = {}

monster.description = "a yirkas blue scales"
monster.experience = 5100
monster.outfit = {
	lookType = 1196,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 16000
monster.maxHealth = 16000
monster.race = "blood"
monster.corpse = 36244
monster.speed = 190
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 9},
	{name = "ultimate health potion", chance = 68000, maxCount = 3},
	{name = "blue goanna scale", chance = 4500},
	{name = "green gem", chance = 3900},
	{name = "ring of green plasma", chance = 2300},
	{name = "demonrage sword", chance = 1000},
	{name = "spellbook of mind control", chance = 2700},
	{name = "war axe", chance = 4000},
	{name = "ornate crossbow", chance = 1800},
	{name = "yirkas' egg", chance = 3800},
	{name = "demon shield", chance = 1100},
	{name = "lizard heart", chance = 2100},
	{name = "spellweaver's robe", chance = 790},
	{name = "red silk flower", chance = 210}
}
monster.defenses = {
	defense = 78,
	armor = 78
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -530, maxDamage = -530, type = COMBAT_EARTHDAMAGE},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -800, radius = 1, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_STONES, target = true},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "invisible", condition = false},
}

mType:register(monster)
