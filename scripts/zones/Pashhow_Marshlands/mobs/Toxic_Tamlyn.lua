-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Toxic Tamlyn
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 213)
end

return entity
