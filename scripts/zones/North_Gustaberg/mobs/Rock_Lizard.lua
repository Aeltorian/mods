-----------------------------------
-- Area: North Gustaberg
--  Mob: Rock Lizard
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 19, 2, xi.regime.type.FIELDS)
end

return entity
