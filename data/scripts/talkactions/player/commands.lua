local Commands = TalkAction("!commands", "/commands")

function Commands.onSay(player, words, param)
	doPlayerPopupFYI(player, [[Command List:
!flask - Remove or not vials
!online - Show all players online
!emotespells - Show emoted spells
!pix - PIX Donate
!serverinfo - View your stages on server
!eject - Ejects the player from the home after 6 days offline.
]])
end

Commands:register()
