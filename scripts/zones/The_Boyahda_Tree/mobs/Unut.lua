-----------------------------------
-- Area: The Boyahda Tree
--   NM: Unut
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 359)
end

return entity
