-----------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Hemodrosophila
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 527)
end

return entity
