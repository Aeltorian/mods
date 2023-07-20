-----------------------------------
-- Area: Castle Oztroja
--  NPC: Tebhi
-- !pos -136 24 -21 151
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:hasItemQty(xi.items.BEAST_COLLAR, 1) and
        trade:getItemCount() == 1
    then
        player:tradeComplete()
        -- TODO: Tebhi disappears for 15min
        player:setCharVar("scatIntoShadowCS", 2)
    end
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
