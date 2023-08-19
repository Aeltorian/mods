-----------------------------------
-- Area: Xarcabard
--  Mob: Frost Gigas
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 54, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 55, 2, xi.regime.type.FIELDS)
end

return entity
