-----------------------------------
-- Area: Beaucedine Glacier
--   NM: Gargantua
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 312)
end

return entity
