-----------------------------------
-- Area: South Gustaberg
--  Mob: Walking Sapling
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 78, 2, xi.regime.type.FIELDS)
end

return entity
