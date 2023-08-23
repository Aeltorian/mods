-----------------------------------
-- Zone: Chocobo_Circuit
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-59, -14, -124, 188)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    xi.chocoboRacing.onEventUpdate(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    xi.chocoboRacing.onEventFinish(player, csid, option, npc)
end

return zoneObject
