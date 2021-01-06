-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Tomb Mage
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 671, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 675, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 676, 2, tpz.regime.type.GROUNDS)
end

return entity
