-----------------------------------
-- Area: Gusgen Mines
--  Mob: Ore Eater
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 681, 1, xi.regime.type.GROUNDS)
end

return entity
