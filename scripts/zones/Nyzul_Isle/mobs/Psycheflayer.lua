-----------------------------------
--  MOB: Psycheflayer
-- Area: Nyzul Isle
-- Info: Specified Mob Group and Eliminate all Group
-----------------------------------
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    xi.nyzul.specifiedEnemySet(mob)

    if mob:getPool() == 8072 then
        mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
    end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.specifiedEnemyKill(mob)

        if mob:getID() >= 17092974 then
            xi.nyzul.specifiedGroupKill(mob)
        end
    end
end

return entity
