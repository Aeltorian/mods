-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Ophion
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 337)
end

return entity
