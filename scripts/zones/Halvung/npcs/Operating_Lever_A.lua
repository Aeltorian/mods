-----------------------------------
-- Area: Halvung
--  NPC: Operating Lever A
-- TODO: more than 5/6 people still need verification as no sites show this requirment?
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.BRACELET_OF_VERVE) then
        GetNPCByID(npc:getID() - 2):openDoor(30)
        player:messageSpecial(ID.text.LIFT_LEVER)
    else
        player:startEvent(100)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
