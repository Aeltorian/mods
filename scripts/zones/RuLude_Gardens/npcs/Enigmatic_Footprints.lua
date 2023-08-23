-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Enigmatic Footprints
-- Entry NPC for Dynamis Divergence
-----------------------------------
local ID = zones[xi.zone.RULUDE_GARDENS]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.TEAR_IN_FABRIC_OF_SPACE)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
