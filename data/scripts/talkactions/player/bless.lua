local bless = TalkAction("!bless")

function bless.onSay(player, words, param, position)
	local playerBalance = player:getBankBalance()
	if player:hasBlessing(1) and player:hasBlessing(2) and player:hasBlessing(3) and player:hasBlessing(4) and player:hasBlessing(5) and player:hasBlessing(6) and player:hasBlessing(7) and player:hasBlessing(8) then
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You already have all blessings!")
	else
	if player:setBankBalance(playerBalance - 50000) == true or player:removeMoney(50000) == true then
	player:addBlessing(1,1)
	player:addBlessing(2,1)
	player:addBlessing(3,1)
	player:addBlessing(4,1)
	player:addBlessing(5,1)
	player:addBlessing(6,1)
	player:addBlessing(7,1)
	player:addBlessing(8,1)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You are protected right now!")
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	else 
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You dont have money!")
	end
end
end
bless:register()
