-----------------------------------
-- Area: Al Zahbi
--  NPC: Gajaad
-- Type: Donation Taker
-- !pos 40.781 -1.398 116.261 48
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local walahraCoinCount = player:getCharVar("walahraCoinCount")
    local tradeCount = trade:getItemQty(xi.items.IMPERIAL_BRONZE_PIECE)

    if tradeCount > 0 and tradeCount == trade:getItemCount() then
        if walahraCoinCount + tradeCount >= 1000 then -- give player turban, donated over 1000
            if player:addItem(xi.items.WALAHRA_TURBAN) then
                player:setCharVar("walahraCoinCount", walahraCoinCount - (1000 - tradeCount))
                player:tradeComplete()
                player:messageSpecial(ID.text.ITEM_OBTAINED, xi.items.WALAHRA_TURBAN)
                player:startEvent(102, xi.items.IMPERIAL_BRONZE_PIECE, 0, tradeCount)
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.WALAHRA_TURBAN)
            end
        else -- turning in less than the amount needed to finish the quest
            if tradeCount >= 100 then -- give bonus walahra water - only one water per trade, regardless of the amount.
                player:tradeComplete()
                player:setCharVar("walahraCoinCount", walahraCoinCount + tradeCount)
                player:addItem(xi.items.FLASK_OF_WALAHRA_WATER)
                player:messageSpecial(ID.text.ITEM_OBTAINED, xi.items.FLASK_OF_WALAHRA_WATER)
                player:startEvent(102, xi.items.IMPERIAL_BRONZE_PIECE, 0, tradeCount)
            else
                player:tradeComplete()
                player:setCharVar("walahraCoinCount", walahraCoinCount + tradeCount)
                player:startEvent(102, xi.items.IMPERIAL_BRONZE_PIECE, 0, tradeCount)
            end
        end
    end
end

entity.onTrigger = function(player, npc)
    -- TODO besiege result can effect if this NPC will accept trades
    player:startEvent(102, xi.items.IMPERIAL_BRONZE_PIECE)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
