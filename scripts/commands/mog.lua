-----------------------------------
-- func: mh
-- desc: allows access to the mog house menu anywhere in a city.
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local currentZone = player:getZoneID()
    
	player:PrintToPlayer("NOTE: This command may only be used in cities.")
	
    allowedZones = {
					xi.zone.PORT_SAN_DORIA, 
					xi.zone.NORTHERN_SAN_DORIA, 
					xi.zone.SOUTHERN_SAN_DORIA,
                    xi.zone.PORT_BASTOK, 
					xi.zone.BASTOK_MINES, 
					xi.zone.BASTOK_MARKETS, 
					xi.zone.WINDURST_WATERS,
    				xi.zone.PORT_WINDURST, 
					xi.zone.WINDURST_WALLS, 
					xi.zone.WINDURST_WOODS,
					xi.zone.SOUTHERN_SAN_DORIA_S, 
					xi.zone.BASTOK_MARKETS_S, 
					xi.zone.WINDURST_WATERS_S,
					xi.zone.SELBINA, 
					xi.zone.RABAO, 
					xi.zone.NORG, 
					xi.zone.RULUDE_GARDENS, 
					xi.zone.UPPER_JEUNO, 
					xi.zone.LOWER_JEUNO, 
					xi.zone.PORT_JEUNO, 
					xi.zone.METALWORKS, 
					xi.zone.MHAURA, 
					xi.zone.KAZHAM, 
					xi.zone.AL_ZAHBI, 
					xi.zone.AHT_URHGAN_WHITEGATE, 
					xi.zone.NASHMAU, 
					xi.zone.TAVNAZIAN_SAFEHOLD,
				}
    				 
    for _, allowedZone in ipairs(allowedZones) do
        if currentZone == allowedZone then
    	    player:sendMenu(1)
    	end
    end
end