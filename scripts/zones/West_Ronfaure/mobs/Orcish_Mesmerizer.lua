-----------------------------------
-- Area: West Ronfaure
--  Mob: Orcish Mesmerizer
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 4, 1, xi.regime.type.FIELDS)
end

return entity
