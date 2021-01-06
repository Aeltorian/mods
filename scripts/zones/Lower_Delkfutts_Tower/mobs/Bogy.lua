-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Bogy
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 780, 2, tpz.regime.type.GROUNDS)
end

return entity
