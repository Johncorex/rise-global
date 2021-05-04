local ConfigAreaChange = {
	Clean_Time_Water = 60,
	Clean_Time_DryWater = 120,
	Warning_Text_Before = "This area will be changed in 5 seconds", 
	Done_Text = "Next area change will be excuted in 2 min",
	centerPosition = Position(1048, 1081, 7),
    rangeX = 70,
    rangeY = 130,
	ConfigAreaNow = 0
}

local SetAreaPositions = {
	from = {x = 1009, y = 1017, z = 6}, -- Começo Area
	to = {x = 1084, y = 1144, z = 6}, -- Final area
	exitPosition = {x = 1029, y = 1031, z = 6} -- Quando alaga o player é teleportado para ca
}
local function checkPlayers()
    local spectators, spec = Game.getSpectators(ConfigAreaChange.centerPosition, false, false, ConfigAreaChange.rangeX, ConfigAreaChange.rangeX, ConfigAreaChange.rangeY, ConfigAreaChange.rangeY)
    for i = 1, #spectators do
        spec = spectators[i]
		if spec:isPlayer() then
			spec:teleportTo(SetAreaPositions.exitPosition)
		end
    end
    return false
end

function ExecuteChangeAreaWater()
	ConfigAreaChange.ConfigAreaNow = '1'
	checkPlayers()
	for x = SetAreaPositions.from.x, SetAreaPositions.to.x do
		for y = SetAreaPositions.from.y, SetAreaPositions.to.y do
			local p = {x = x, y = y, z = SetAreaPositions.from.z}
		
			local tile = Position(p):getTile()
			if tile then
				-- ^
				local Emcima = tile:getItemById(22280)
				if Emcima then
					Game.createItem(36006, 1, Emcima:getPosition())
					Emcima:remove()
				end
				-- < ^
				local EsquerdaAcabamentoEmcima = tile:getItemById(22288)
				if EsquerdaAcabamentoEmcima then
					Game.createItem(36010, 1, EsquerdaAcabamentoEmcima:getPosition())
					EsquerdaAcabamentoEmcima:remove()
				end
				-- <
				local Esquerda = tile:getItemById(22282)
				if Esquerda then
					Game.createItem(36009, 1, Esquerda:getPosition())
					Esquerda:remove()
				end
				-- >
				local Direita = tile:getItemById(22283)
				if Direita then
					Game.createItem(36007, 1, Direita:getPosition())
					Direita:remove()
				end
				-- > ^
				local DireitaAcabamentoEmcima = tile:getItemById(22289)
				if DireitaAcabamentoEmcima then
					Game.createItem(36011, 1, DireitaAcabamentoEmcima:getPosition())
					DireitaAcabamentoEmcima:remove()
				end
				-- > \/
				local DireitaAcabamentoEmbaixo = tile:getItemById(22290)
				if DireitaAcabamentoEmbaixo then
					Game.createItem(36013, 1, DireitaAcabamentoEmbaixo:getPosition())
					DireitaAcabamentoEmbaixo:remove()
				end
				-- < \/
				local EsquerdaAcabamentoBaixo = tile:getItemById(22291)
				if EsquerdaAcabamentoBaixo then
					Game.createItem(36012, 1, EsquerdaAcabamentoBaixo:getPosition())
					EsquerdaAcabamentoBaixo:remove()
				end
				-- \/
				local Embaixo = tile:getItemById(22281)
				if Embaixo then
					Game.createItem(36008, 1, Embaixo:getPosition())
					Embaixo:remove()
				end
				-- -|
				local EmbaixoAcabamentoCurvaEsquerda = tile:getItemById(22287)
				if EmbaixoAcabamentoCurvaEsquerda then
					Game.createItem(36016, 1, EmbaixoAcabamentoCurvaEsquerda:getPosition())
					EmbaixoAcabamentoCurvaEsquerda:remove()
				end
				-- |-
				local EmbaixoAcabamentoCurvaDireita = tile:getItemById(22286)
				if EmbaixoAcabamentoCurvaDireita then
					Game.createItem(36017, 1, EmbaixoAcabamentoCurvaDireita:getPosition())
					EmbaixoAcabamentoCurvaDireita:remove()
				end
				-- |_
				local EmcimaAcabamentoCurvaEsquerda = tile:getItemById(22284)
				if EmcimaAcabamentoCurvaEsquerda then
					Game.createItem(36014, 1, EmcimaAcabamentoCurvaEsquerda:getPosition())
					EmcimaAcabamentoCurvaEsquerda:remove()
				end
				-- |_
				local EmcimaAcabamentoCurvaDireita = tile:getItemById(22285)
				if EmcimaAcabamentoCurvaDireita then
					Game.createItem(36015, 1, EmcimaAcabamentoCurvaDireita:getPosition())
					EmcimaAcabamentoCurvaDireita:remove()
				end
				
				-- Jangada
				local JangadaTopEsquerda = tile:getItemById(7201)
				if JangadaTopEsquerda then
					Game.createItem(7187, 1, JangadaTopEsquerda:getPosition())
					JangadaTopEsquerda:remove()
				end
				local JangadaEsquerda = tile:getItemById(7202)
				if JangadaEsquerda then
					Game.createItem(7188, 1, JangadaEsquerda:getPosition())
					JangadaEsquerda:remove()
				end
				local JangadaBottomEsquerda = tile:getItemById(7203)
				if JangadaBottomEsquerda then
					Game.createItem(7190, 1, JangadaBottomEsquerda:getPosition())
					JangadaBottomEsquerda:remove()
				end
				local JangadaTop = tile:getItemById(7204)
				if JangadaTop then
					Game.createItem(7191, 1, JangadaTop:getPosition())
					JangadaTop:remove()
				end
				local JangadaBottom = tile:getItemById(7205)
				if JangadaBottom then
					Game.createItem(7192, 1, JangadaBottom:getPosition())
					JangadaBottom:remove()
				end
				local JangadaTopDireita = tile:getItemById(7206)
				if JangadaTopDireita then
					Game.createItem(7193, 1, JangadaTopDireita:getPosition())
					JangadaTopDireita:remove()
				end
				local JangadaDireita = tile:getItemById(7207)
				if JangadaDireita then
					Game.createItem(7194, 1, JangadaDireita:getPosition())
					JangadaDireita:remove()
				end
				local JangadaBottomDireita = tile:getItemById(7208)
				if JangadaBottomDireita then
					Game.createItem(7195, 1, JangadaBottomDireita:getPosition())
					JangadaBottomDireita:remove()
				end
			end
		end
	end
end


local function ExecuteChangeAreaDryWater()
	ConfigAreaChange.ConfigAreaNow = '0'
	for x = SetAreaPositions.from.x, SetAreaPositions.to.x do
		for y = SetAreaPositions.from.y, SetAreaPositions.to.y do
			local p = {x = x, y = y, z = SetAreaPositions.from.z}
			local tile = Position(p):getTile()
			if tile then
				-- ^
				local Emcima = tile:getItemById(36006)
				if Emcima then
					Game.createItem(22280, 1, Emcima:getPosition())
					Emcima:remove()
				end
				-- < ^
				local EsquerdaAcabamentoEmcima = tile:getItemById(36010)
				if EsquerdaAcabamentoEmcima then
					Game.createItem(22288, 1, EsquerdaAcabamentoEmcima:getPosition())
					EsquerdaAcabamentoEmcima:remove()
				end
				-- <
				local Esquerda = tile:getItemById(36009)
				if Esquerda then
					Game.createItem(22282, 1, Esquerda:getPosition())
					Esquerda:remove()
				end
				-- >
				local Direita = tile:getItemById(36007)
				if Direita then
					Game.createItem(22283, 1, Direita:getPosition())
					Direita:remove()
				end
				-- > ^
				local DireitaAcabamentoEmcima = tile:getItemById(36011)
				if DireitaAcabamentoEmcima then
					Game.createItem(22289, 1, DireitaAcabamentoEmcima:getPosition())
					DireitaAcabamentoEmcima:remove()
				end
				-- > \/
				local DireitaAcabamentoEmbaixo = tile:getItemById(36013)
				if DireitaAcabamentoEmbaixo then
					Game.createItem(22290, 1, DireitaAcabamentoEmbaixo:getPosition())
					DireitaAcabamentoEmbaixo:remove()
				end
				-- < \/
				local EsquerdaAcabamentoBaixo = tile:getItemById(36012)
				if EsquerdaAcabamentoBaixo then
					Game.createItem(22291, 1, EsquerdaAcabamentoBaixo:getPosition())
					EsquerdaAcabamentoBaixo:remove()
				end
				-- \/
				local Embaixo = tile:getItemById(36008)
				if Embaixo then
					Game.createItem(22281, 1, Embaixo:getPosition())
					Embaixo:remove()
				end
				-- -|
				local EmbaixoAcabamentoCurvaEsquerda = tile:getItemById(36016)
				if EmbaixoAcabamentoCurvaEsquerda then
					Game.createItem(22287, 1, EmbaixoAcabamentoCurvaEsquerda:getPosition())
					EmbaixoAcabamentoCurvaEsquerda:remove()
				end
				-- |-
				local EmbaixoAcabamentoCurvaDireita = tile:getItemById(36017)
				if EmbaixoAcabamentoCurvaDireita then
					Game.createItem(22286, 1, EmbaixoAcabamentoCurvaDireita:getPosition())
					EmbaixoAcabamentoCurvaDireita:remove()
				end
				-- |_
				local EmcimaAcabamentoCurvaEsquerda = tile:getItemById(36014)
				if EmcimaAcabamentoCurvaEsquerda then
					Game.createItem(22284, 1, EmcimaAcabamentoCurvaEsquerda:getPosition())
					EmcimaAcabamentoCurvaEsquerda:remove()
				end
				-- |_
				local EmcimaAcabamentoCurvaDireita = tile:getItemById(36015)
				if EmcimaAcabamentoCurvaDireita then
					Game.createItem(22285, 1, EmcimaAcabamentoCurvaDireita:getPosition())
					EmcimaAcabamentoCurvaDireita:remove()
				end
				
				-- Jangada
				local JangadaTopEsquerda = tile:getItemById(7187)
				if JangadaTopEsquerda then
					Game.createItem(7201, 1, JangadaTopEsquerda:getPosition())
					JangadaTopEsquerda:remove()
				end
				local JangadaEsquerda = tile:getItemById(7188)
				if JangadaEsquerda then
					Game.createItem(7202, 1, JangadaEsquerda:getPosition())
					JangadaEsquerda:remove()
				end
				local JangadaBottomEsquerda = tile:getItemById(7190)
				if JangadaBottomEsquerda then
					Game.createItem(7203, 1, JangadaBottomEsquerda:getPosition())
					JangadaBottomEsquerda:remove()
				end
				local JangadaTop = tile:getItemById(7191)
				if JangadaTop then
					Game.createItem(7204, 1, JangadaTop:getPosition())
					JangadaTop:remove()
				end
				local JangadaBottom = tile:getItemById(7192)
				if JangadaBottom then
					Game.createItem(7205, 1, JangadaBottom:getPosition())
					JangadaBottom:remove()
				end
				local JangadaTopDireita = tile:getItemById(7193)
				if JangadaTopDireita then
					Game.createItem(7206, 1, JangadaTopDireita:getPosition())
					JangadaTopDireita:remove()
				end
				local JangadaDireita = tile:getItemById(7194)
				if JangadaDireita then
					Game.createItem(7207, 1, JangadaDireita:getPosition())
					JangadaDireita:remove()
				end
				local JangadaBottomDireita = tile:getItemById(7195)
				if JangadaBottomDireita then
					Game.createItem(7208, 1, JangadaBottomDireita:getPosition())
					JangadaBottomDireita:remove()
				end
				-- Escadas
				
			end
		end
	end
end


local EbbAndFlowChanges = GlobalEvent("EbbAndFlowChangesEvent")
function EbbAndFlowChanges.onThink(interval, lastExecution)
	print(ConfigAreaChange.ConfigAreaNow)
	if ConfigAreaChange.ConfigAreaNow == '1' then
		ExecuteChangeAreaDryWater()
	else
		ExecuteChangeAreaWater()
	end
	return true
end

EbbAndFlowChanges:interval(3000)
EbbAndFlowChanges:register()