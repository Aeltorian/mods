-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Battle Bat
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 649, 1, xi.regime.type.GROUNDS)
end

return entity
