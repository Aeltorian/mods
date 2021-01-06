-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 764, 2, tpz.regime.type.GROUNDS)
end

return entity
