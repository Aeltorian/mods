-----------------------------------
-- Area: Ifrit's Cauldron
--  Mob: Goblin Bandit
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 757, 1, xi.regime.type.GROUNDS)
end

return entity
