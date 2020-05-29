-- FUNCTIONS
local function doCheckArea()
	local upConer = {x = 32199, y = 32038, z = 14}      -- upLeftCorner
	local downConer = {x = 32217, y = 32057, z = 14}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k = upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								return true
							end
						end
					end
				end
			end
		end
	end
	return false
end

local function clearArea()
	local upConer = {x = 32199, y = 32038, z = 14}        -- upLeftCorner
	local downConer = {x = 32217, y = 32057, z = 14}      -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								c:teleportTo({x = 32208, y = 32035, z = 13})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaAlptramun)
end
-- FUNCTIONS END

function onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(32208, 32021, 13),
			Position(32208, 32022, 13),
			Position(32208, 32023, 13),
			Position(32208, 32024, 13),
			Position(32208, 32025, 13)
		},

		newPos = {x = 32207, y = 32053, z = 14},
	}

	local pushPos = {x = 32208, y = 32021, z = 13}

	if item.actionid == 60123 then
		if item.itemid == 10029 then
			if player:getPosition().x == pushPos.x and player:getPosition().y == pushPos.y and player:getPosition().z == pushPos.z then

				local storePlayers, playerTile = {}
				for i = 1, #config.playerPositions do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if isPlayer(playerTile) then
						storePlayers[#storePlayers + 1] = playerTile
					end
				end

				if doCheckArea() == false then
					clearArea()

					local players
					for i = 1, #storePlayers do
					playerTile = Tile(config.playerPositions[i]):getTopCreature()
					if playerTile:getStorageValue(14551) < os.time() then
						players = storePlayers[i]
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						players:teleportTo(config.newPos)
						players:setStorageValue(14551, os.time() + 20*60*60)
					else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, you recently challenge the Alptramun.")
					return true
					end
				end
					Position(config.newPos):sendMagicEffect(11)

					areaAlptramun = addEvent(clearArea, 15 * 60000)

					Game.createMonster("Shadow Tentacle", {x = 32204, y = 32046, z = 14}, false, true)
					Game.createMonster("Shadow Tentacle", {x = 32210, y = 32046, z = 14}, false, true)
					Game.createMonster("Shadow Tentacle", {x = 32210, y = 32050, z = 14}, false, true)
					Game.createMonster("Shadow Tentacle", {x = 32205, y = 32050, z = 14}, false, true)
					Game.createMonster("Alptramun", {x = 32207, y = 32047, z = 14}, false, true)

				else
					player:sendTextMessage(19, "Someone is in the area.")
				end
			else
				return true
			end
		end
		item:transform(item.itemid == 10029 and 10030 or 10029)
	end
	return true
end
