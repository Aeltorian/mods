-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Gigas Wallwatcher
-- Note: PH for Ogygos
-----------------------------------
local ID = zones[xi.zone.MIDDLE_DELKFUTTS_TOWER]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 783, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 784, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.OGYGOS_PH, 5, math.random(7200, 14400)) -- 2 to 4 hours
end

return entity
