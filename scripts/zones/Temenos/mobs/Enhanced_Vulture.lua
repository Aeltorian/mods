-----------------------------------
-- Area: Temenos W T
--  Mob: Enhanced Vulture
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")
-----------------------------------
local entity = {}

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+1):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+2):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+3):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+4):updateEnmity(target)
    GetMobByID(ID.mob.TEMENOS_W_MOB[7]+5):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetMobByID(ID.mob.TEMENOS_W_MOB[7]):isDead() and GetMobByID(ID.mob.TEMENOS_W_MOB[7]+1):isDead() and
            GetMobByID(ID.mob.TEMENOS_W_MOB[7]+2):isDead() and GetMobByID(ID.mob.TEMENOS_W_MOB[7]+3):isDead() and
            GetMobByID(ID.mob.TEMENOS_W_MOB[7]+4):isDead() and GetMobByID(ID.mob.TEMENOS_W_MOB[7]+5):isDead()
        then
            GetNPCByID(ID.npc.TEMENOS_W_CRATE[7]):setStatus(tpz.status.NORMAL)
        end
    end
end

return entity
