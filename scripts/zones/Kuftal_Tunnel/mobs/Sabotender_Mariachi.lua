----------------------------------------
-- Area: Kuftal Tunnel
--   NM: Sabotender Mariachi
-- TODO: Auto-Regen during the day
----------------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 417)
end

return entity
