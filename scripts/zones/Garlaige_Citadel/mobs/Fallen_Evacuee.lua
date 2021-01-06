-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fallen Evacuee
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 703, 2, tpz.regime.type.GROUNDS)
end

return entity
