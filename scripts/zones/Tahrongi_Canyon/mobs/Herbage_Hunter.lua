-----------------------------------
-- Area: Tahrongi Canyon
--   NM: Herbage Hunter
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 259)
end

return entity
