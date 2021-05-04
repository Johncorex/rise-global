local mType = Game.createMonsterType("Utua Stone Sting")
local monster = {}

monster.description = "a utua stone sting"
monster.experience = 15100
monster.outfit = {
	lookType = 398,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 16400
monster.maxHealth = monster.health
monster.race = "undead"
monster.corpse = 13501
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 60,
	random = 40,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "*rattle*", yell = false},
	{text = "*tak tak*", yell = false},
	{text = "*tak tak tak*", yell = false}
}

monster.loot = {
	{name = "platinum coin", chance = 32300, maxCount = 9},
    {name = "ultimate health potion", chance = 32300, maxCount = 3},
    {name = "scorpion tail", chance = 32300, maxCount = 3},
    
    {name = "emerald bangle", chance = 9970},
    {name = "glacier kilt", chance = 9970},
    {name = "gold ingot", chance = 9970},
    {name = "green gem", chance = 9970},
    {name = "lightning legs", chance = 9970},
    {name = "mercenary sword", chance = 9970},
	{name = "noble axe", chance = 9970},
	{name = "utua's poison", chance = 9970},
	{name = "violet gem", chance = 9970},
	{name = "warrior's axe", chance = 9970},
	
    {name = "chaos mace", chance = 3970},
    {name = "coral brooch", chance = 3970},
    {name = "crystal mace", chance = 3970},
    {name = "demon shield", chance = 3970},
    {name = "fist on a stick", chance = 3970},
    {name = "guardian axe", chance = 3970},
    {name = "magic plate armor", chance = 3970},
    {name = "ring of green plasma", chance = 3970},
    {name = "spellweaver's robe", chance = 3970},
    {name = "skull helmet", chance = 3970},
	
    {name = "raw watermelon tourmaline", chance = 250},
    {name = "red silk flower", chance = 250},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1493, condition = {type = CONDITION_POISON, totalDamage = 3000, interval = 4000}}
}

monster.defenses = {
	defense = 0,
	armor = 42,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 560, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -1},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
