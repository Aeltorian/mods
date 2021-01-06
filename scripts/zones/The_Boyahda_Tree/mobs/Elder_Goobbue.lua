-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Elder Goobbue
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 722, 2, tpz.regime.type.GROUNDS)
end

return entity
