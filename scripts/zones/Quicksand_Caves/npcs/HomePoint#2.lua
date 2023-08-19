-----------------------------------
-- Area: Quicksand_Caves
--  NPC: HomePoint#2
-- !pos  573 9 -500 208
-----------------------------------
local entity = {}

local hpEvent = 8701
local hpIndex = 96

entity.onTrigger = function(player, npc)
    xi.homepoint.onTrigger(player, hpEvent, hpIndex)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.homepoint.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.homepoint.onEventFinish(player, csid, option, hpEvent)
end

return entity
