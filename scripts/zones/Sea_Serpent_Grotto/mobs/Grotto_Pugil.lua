-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Grotto Pugil
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 808, 2, tpz.regime.type.GROUNDS)
end

return entity
