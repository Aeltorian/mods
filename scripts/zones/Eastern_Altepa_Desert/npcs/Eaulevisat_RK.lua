-----------------------------------
-- Area: Eastern Altepa desert
--  NPC: Eaulevisat, R.K.
-- Outpost Conquest Guards
-- !pos -257 8 -249 114
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------
local entity = {}

local guardNation = xi.nation.SANDORIA
local guardType   = xi.conq.guard.OUTPOST
local guardRegion = xi.region.KUZOTZ
local guardEvent  = 32763

entity.onTrade = function(player, npc, trade)
    xi.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

entity.onTrigger = function(player, npc)
    xi.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end

return entity
