function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(18181) == 1 then
		if item.itemid == 5114 or 6261 or 34679 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end
