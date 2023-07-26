-----------------------------------
-- Area: Quicksand Caves
--  NPC: Ornate Door
-- Door blocked by Weight system
-- !pos -418 0 790 208
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local difX = player:getXPos()-(-425)
    local difZ = player:getZPos()-(790)
    local Distance = math.sqrt(math.pow(difX, 2) + math.pow(difZ, 2))
    if Distance < 3 then
        return -1
    end

    player:messageSpecial(ID.text.DOOR_FIRMLY_SHUT)
    return 1
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
