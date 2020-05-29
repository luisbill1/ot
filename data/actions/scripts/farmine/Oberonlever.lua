-- FUNCTIONS
local function doCheckArea()
	local upConer = {x = 33354, y = 31308, z = 9}      -- upLeftCorner
	local downConer = {x = 33375, y = 31328, z = 9}     -- downRightCorner

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
	local upConer = {x = 33354, y = 31308, z = 9}        -- upLeftCorner
	local downConer = {x = 33375, y = 31328, z = 9}     -- downRightCorner

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
								c:teleportTo({x = 33298, y = 31285, z = 9})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaOberon)
end
-- FUNCTIONS END

function onUse(player, item, fromPosition, itemEx, toPosition)

	local config = {
		playerPositions = {
			Position(33364, 31344, 9),
			Position(33365, 31344, 9),
			Position(33366, 31344, 9),
			Position(33363, 31344, 9),
			Position(33362, 31344, 9)
		},

		newPos = {x = 33364, y = 31322, z = 9},
	}

	local pushPos = {x = 33364, y = 31344, z = 9}

	if item.actionid == 57605 then
		if item.itemid == 1945 then
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
					if playerTile:getStorageValue(14530) < os.time() then
						players = storePlayers[i]
						config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
						players:teleportTo(config.newPos)
						players:setStorageValue(14530, os.time() + 20*60*60)
					else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait a while, you recently challenge Grand Master Oberon.")
					return true
					end
				end
					Position(config.newPos):sendMagicEffect(11)

					areaOberon = addEvent(clearArea, 15 * 60000)


					Game.createMonster("Grand Master Oberon", {x = 33364, y = 31317, z = 9}, false, true)

				else
					player:sendTextMessage(19, "Someone is in the area.")
				end
			else
				return true
			end
		end
		item:transform(item.itemid == 1945 and 1946 or 1945)
	end
	return true
end
