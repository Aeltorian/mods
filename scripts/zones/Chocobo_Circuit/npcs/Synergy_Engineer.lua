-----------------------------------
-- Area: Chocobo Circuit
-- NPC: Synergy Engineer
-- Type: Standard NPC
-- !pos -325.376 0.000 -524.698 70
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(11001)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
