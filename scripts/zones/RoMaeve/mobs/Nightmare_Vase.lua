-----------------------------------
-- Area: RoMaeve
--   NM: Nightmare Vase
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 327)
end

return entity
