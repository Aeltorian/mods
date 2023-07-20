-----------------------------------
-- Area: Meriphataud Mountains
--  NPC: qm1 (???)
-- Involved in Quest: The Holy Crest
-- !pos 641 -15 7 119
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.items.WYVERN_EGG) and
        player:getCharVar("TheHolyCrest_Event") == 4
    then
        player:startEvent(56)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_FOUND)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 56 then
        player:setCharVar("TheHolyCrest_Event", 5)
        player:confirmTrade()
        player:startEvent(33)
    end
end

return entity
