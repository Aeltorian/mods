-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Bloodpool Vorax
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 211)
end

return entity
