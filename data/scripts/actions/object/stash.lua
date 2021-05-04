local stash = Action()

function stash.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- doPlayerPopupFYI(player, "ENG:\nFor technical occasions the supply stash system is temporarily disabled for maintenance without prior return, thanks for your attention, use the depot for now.\n\nThe management thanks you.\nwww.maserots.online\n\n\nPT:\nPara ocasi�es t�cnicas o sistema de estoque de suprimentos fica temporariamente desabilitado para manuten��o sem retorno pr�vio, obrigado por sua aten��o, use o dep�sito por enquanto.\n\nA ger�ncia agradece.\nwww.maserots.online")
	player:openStash()
	return true
end

stash:id(32450)
stash:register()