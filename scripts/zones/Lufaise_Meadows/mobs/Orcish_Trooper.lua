----------------------------------------
-- Area: Lufaise_Meadows
--  Mob: Orcish Trooper
----------------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
-----------------------------------
local entity = {}

function onMobSpawn(mob)
    mob:setLocalVar("fomorHateAdj", -1)
end

function onMobDeath(mob, player, isKiller)
end

return entity
