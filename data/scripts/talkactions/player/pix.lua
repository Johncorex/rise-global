local Commands = TalkAction("!pix", "/pix")

function Player:sendProxyModalWindow()
        local window = ModalWindow {
            title = "MaserOTs Donate System",
            message = "<img src='http://maserots.online/Outfit_Retro_Warrior_Male.gif' style='width:64px;height:64px;' /><br /><br />Selecione uma ação:"
        }

		local choice = window:addChoice("Ver Informações", 1)
		choice.proxyName = "info"
		local choice = window:addChoice("Gerar QRCode", 2)
		choice.proxyName = "qrcode"

        window:addButton("Select",
            function(button, choice)
                if choice.proxyName == 'qrcode' then
					local windowqrcode = ModalWindow {
						title = "MaserOTs Donate System",
						message = "Escaneie o QRCode como forma de pagamento do PIX, escolha o valor doado e aguarde seus pontos cairem.<br /><br /><img src='http://maserots.online/qrcode-pix.png' style='width:64px;height:64px;' />"
						}
						windowqrcode:addButton("Cancel")
						windowqrcode:sendToPlayer(self)
					else
					local windowqrcode = ModalWindow {
						title = "MaserOTs Donate System",
						message = "CPF: 433.741.688-92"
						}
					windowqrcode:addButton("Cancel")
					windowqrcode:sendToPlayer(self)
				end
            end)
 
        window:addButton("Cancel")
        window:setDefaultEscapeButton('Cancel')
        window:setDefaultEnterButton('Select')
        window:sendToPlayer(self)
end

function Commands.onSay(player, words, param)
	return player:sendProxyModalWindow()
end

Commands:register()

