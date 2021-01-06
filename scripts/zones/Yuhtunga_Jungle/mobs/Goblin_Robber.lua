-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Goblin Robber
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 125, 2, tpz.regime.type.FIELDS)
end

return entity
